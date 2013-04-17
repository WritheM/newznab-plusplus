
/* NEWS STUFF */
CREATE TABLE  `newznab`.`newspost` (
`ID` INT( 11 ) UNSIGNED NOT NULL AUTO_INCREMENT ,
 `parentID` INT( 11 ) NOT NULL DEFAULT  '0',
 `userID` INT( 11 ) UNSIGNED NOT NULL ,
 `subject` VARCHAR( 255 ) COLLATE utf8_unicode_ci NOT NULL ,
 `message` TEXT COLLATE utf8_unicode_ci NOT NULL ,
 `locked` TINYINT( 1 ) UNSIGNED NOT NULL DEFAULT  '0',
 `sticky` TINYINT( 1 ) UNSIGNED NOT NULL DEFAULT  '0',
 `replies` INT( 11 ) UNSIGNED NOT NULL DEFAULT  '0',
 `createddate` DATETIME NOT NULL ,
 `updateddate` DATETIME NOT NULL ,
PRIMARY KEY (  `ID` ) ,
KEY  `parentID` (  `parentID` ) ,
KEY  `userID` (  `userID` ) ,
KEY  `createddate` (  `createddate` ) ,
KEY  `updateddate` (  `updateddate` )
) ENGINE = MYISAM DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;

SET SQL_MODE =  'NO_AUTO_VALUE_ON_ZERO';

/* Uncomment if you want to migrate the old forum posts to your new news posts
INSERT INTO  `newznab`.`newspost` 
SELECT * 
FROM  `newznab`.`forumpost` ;
*/

/* Premium ads stuff */
ALTER TABLE  `userroles` ADD  `hideads` TINYINT( 1 ) NOT NULL DEFAULT  '0'