<?php
require_once(WWW_DIR."/lib/news.php");

if (!$users->isLoggedIn())
	$page->show403();

$id = $_GET["id"] + 0;

$news = new News();
if ($page->isPostBack())
{
		$news->add($id, $users->currentUserId(), "", $_POST["addReply"]); 
		header("Location:".WWW_TOP."/newspost/".$id."#last");
		die();
}

$results = $news->getPosts($id);
if (count($results) == 0)
{
	header("Location:".WWW_TOP."/news");
	die();
}

$page->meta_title = "news Post";
$page->meta_keywords = "view,news,post,thread";
$page->meta_description = "View news post";

$page->smarty->assign('results', $results);

$page->content = $page->smarty->fetch('newspost.tpl');
$page->render();


