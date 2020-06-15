package kr.co.jboard1.config;

public class SQL {

	// ȸ������
	
	
	
	
	
	
	
	
	// �Խù� ����
	public final static String SELECT_TOTAL_COUNT = "SELECT COUNT(`seq`) FROM `JBOARD_ARTICLE` "
												  + "WHERE `parent`=0";
	
	public final static String UPDATE_ARTICLE = "UPDATE `JBOARD_ARTICLE` SET `title`=?, `content`=? "
												+ "WHERE `seq`=?";
	
	public final static String DELETE_ARTICLE = "DELETE FROM `JBOARD_ARTICLE` WHERE `seq`=? OR `parent`=?";
	
	
	public final static String UPDATE_HIT = "UPDATE `JBOARD_ARTICLE` SET `hit` = `hit` + 1 WHERE `seq`=?";
	
	
	
	public final static String SELECT_ARTICLE = "SELECT * FROM `JBOARD_ARTICLE` "
												+ "WHERE `seq`=?";
	
	public final static String SELECT_ARTICLE_MAX_SEQ = "SELECT MAX(`seq`) FROM `JBOARD_ARTICLE`";
	
	public final static String SELECT_ARTICLES = "SELECT a.*, b.nick FROM `JBOARD_ARTICLE` AS a "
												+ "JOIN `JBOARD_MEMBER` AS b "
												+ "ON a.uid = b.uid "
												+ "WHERE `parent`=0 "
												+ "ORDER BY `seq` DESC "
												+ "LIMIT ?, 10";
	
	public final static String INSERT_ARTICLE = "INSERT INTO `JBOARD_ARTICLE` SET "
												+ "`title`=?, "
												+ "`content`=?, "
												+ "`file`=?, "
												+ "`uid`=?, "
												+ "`regip`=?, "
												+ "`rdate`=NOW()";
	
	public final static String INSERT_FILE = "INSERT INTO `JBOARD_FILE` SET "
										   + "`parent`=?, "
										   + "`oldName`=?, "
										   + "`newName`=?, "
										   + "`rdate`=NOW()";

	public final static String SELECT_COMMENTS = "SELECT a.*, b.nick FROM `JBOARD_ARTICLE` AS a "
												+ "JOIN `JBOARD_MEMBER` AS b "
												+ "ON a.uid = b.uid "
												+ "WHERE `parent`=? "
												+ "ORDER BY `seq` ASC";
	
	public final static String INSERT_COMMENT = "INSERT INTO `JBOARD_ARTICLE` SET "
												+ "`parent`=?, "
												+ "`content`=?, "
												+ "`uid`=?, "
												+ "`regip`=?, "
												+ "`rdate`=NOW()";
	
	public final static String DELETE_COMMENT = "DELETE FROM `JBOARD_ARTICLE` WHERE `seq`=?";
	
	public final static String UPDATE_COMMENT_COUNT = "UPDATE `JBOARD_ARTICLE` SET `comment` = `comment` + 1 "
													+ "WHERE `seq` =?";

	public final static String UPDATE_COMMENT_COUNT_MINUS = "UPDATE `JBOARD_ARTICLE` SET `comment` = `comment` - 1 "
													+ "WHERE `seq` =?";

	
	
}
