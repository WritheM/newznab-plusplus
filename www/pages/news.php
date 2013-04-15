<?php
require_once(WWW_DIR."/lib/news.php");

$news = new news;

if (!$users->isLoggedIn())
	$page->show403();

if ($page->isPostBack())
{
		if (!isset($_POST["addSubject"]) || empty($_POST["addSubject"]))
			$page->show403();
		if (!isset($_POST["addMessage"]) || empty($_POST["addMessage"]))
			$page->show403();
		
		$news->add(0, $users->currentUserId(), $_POST["addSubject"], $_POST["addMessage"]); 
		header("Location:".WWW_TOP."/news");
		die();
}
$browsecount = $news->getBrowseCount();

$offset = (isset($_REQUEST["offset"]) && ctype_digit($_REQUEST['offset'])) ? $_REQUEST["offset"] : 0;

$results = array();
$results = $news->getBrowseRange($offset, 5);

$page->smarty->assign('pagertotalitems',$browsecount);
$page->smarty->assign('pageroffset',$offset);
$page->smarty->assign('pageritemsperpage',5);
$page->smarty->assign('pagerquerybase', WWW_TOP."/news?offset=");
$page->smarty->assign('pagerquerysuffix', "#results");

$pager = $page->smarty->fetch("pager.tpl");
$page->smarty->assign('pager', $pager);
$page->smarty->assign('results',$results);		

$page->meta_title = "News";
$page->meta_keywords = "news,chat,posts";
$page->meta_description = "News";
	
$page->content = $page->smarty->fetch('news.tpl');
$page->render();

