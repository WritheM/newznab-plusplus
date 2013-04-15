<?php
require_once(WWW_DIR."/lib/framework/db.php");

/**
 * This class handles data access for news and post data.
 */
class News
{
	/**
	 * Add a news post.
	 */
	public function add($parentid, $userid, $subject, $message, $locked = 0, $sticky = 0, $replies = 0)
	{
		$db = new DB();
		
		if ($message == "")
			return -1;
		
		if ($parentid != 0)
		{
			$par = $this->getParent($parentid);
			if ($par == false)
				return -1;
				
			$db->query(sprintf("update newspost set replies = replies + 1, updateddate = now() where ID = %d", $parentid));		
		}
		
		$db->queryInsert(sprintf("INSERT INTO `newspost` (`newsID`,`parentID`,`userID`,`subject`,`message`, `locked`, `sticky`, `replies`, `createddate`, `updateddate`) VALUES ( 1,  %d, %d,  %s,  %s, %d, %d, %d,NOW(),  NOW())", 
			$parentid, $userid, $db->escapeString($subject)	, $db->escapeString($message), $locked, $sticky, $replies));
	}

	/**
	 * Get the top level post in a thread.
	 */
	public function getParent($parent)
	{
		$db = new DB();
		return $db->queryOneRow(sprintf(" SELECT newspost.*, users.username from newspost left outer join users on users.ID = newspost.userID where newspost.ID = %d ", $parent));		
	}

	/**
	 * Get recent posts.
	 */
	public function getRecentPosts($limit)
	{
		$db = new DB();
		return $db->query(sprintf("select newspost.*, users.username from newspost join (select case when parentID = 0 then ID else parentID end as ID, max(createddate) from newspost group by case when parentID = 0 then ID else parentID end order by max(createddate) desc) x on x.ID = newspost.ID inner join users on userID = users.ID limit %d", $limit));		
	}


	/**
	 * Get all child posts for a parent.
	 */
	public function getPosts($parent)
	{
		$db = new DB();
		return $db->query(sprintf(" SELECT newspost.*, CASE WHEN role=%d THEN 1 ELSE 0 END  AS 'isadmin', users.username from newspost left outer join users on users.ID = newspost.userID where newspost.ID = %d or parentID = %d order by createddate asc limit 250", Users::ROLE_ADMIN, $parent, $parent));		
	}

	/**
	 * Get a newspost by its ID.
	 */
	public function getPost($id)
	{
		$db = new DB();
		return $db->queryOneRow(sprintf(" SELECT * from newspost where ID = %d", $id));		
	}

	/**
	 * Get a count of all news posts.
	 */
	public function getBrowseCount()
	{
		$db = new DB();
		$res = $db->queryOneRow(sprintf("select count(ID) as num from newspost where parentID = 0"));		
		return $res["num"];
	}

	/**
	 * Get a list of news posts for browse list by limit.
	 */
	public function getBrowseRange($start, $num)
	{
		$db = new DB();

		if ($start === false)
			$limit = "";
		else
			$limit = " LIMIT ".$start.",".$num;

		return $db->query(sprintf(" SELECT newspost.*, users.username from newspost left outer join users on users.ID = newspost.userID where parentID = 0 order by updateddate desc".$limit ));		
	}

	/**
	 * Delete an entire thread.
	 */
	public function deleteParent($parent)
	{
		$db = new DB();
		$db->query(sprintf("delete from newspost where ID = %d or parentID = %d", $parent, $parent));		
	}

	/**
	 * Delete a newspost row.
	 */
	public function deletePost($id)
	{
		$db = new DB();
		$post = $this->getPost($id);
		if ($post)
		{
			if ($post["parentID"] == "0")
				$this->deleteParent($id);
			else
				$db->query(sprintf("delete from newspost where ID = %d", $id));		
		}
	}

	/**
	 * Delete all newsposts for a user.
	 */
	public function deleteUser($id)
	{
		$db = new DB();
		$db->query(sprintf("delete from newspost where userID = %d", $id));		
	}

	/**
	 * Count of all posts for a user.
	 */	
	public function getCountForUser($uid)
	{			
		$db = new DB();
		$res = $db->queryOneRow(sprintf("select count(ID) as num from newspost where userID = %d", $uid));		
		return $res["num"];
	}
	
	/**
	 * Get news posts for a user for paged list in profile.
	 */	
	public function getForUserRange($uid, $start, $num)
	{		
		$db = new DB();
		
		if ($start === false)
			$limit = "";
		else
			$limit = " LIMIT ".$start.",".$num;
		
		return $db->query(sprintf(" SELECT newspost.*, users.username FROM newspost LEFT OUTER JOIN users ON users.ID = newspost.userID where userID = %d order by newspost.createddate desc ".$limit, $uid));		
	}
}