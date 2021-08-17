package kr.co.jboard1.db;

public class Sql {
	public static final String SELECT_TERMS = "SELECT * FROM `Jboard_terms`;"; // Ŭ�����̸����� �����ϰԲ� static���� ������� 
	// �޸𸮿� �ѹ��÷����� ���� �ϴ� ���� 
	// ���������̱⶧���� �� ����  => ���������ü�� �׳� �����ϱ⶧���� ������������!!!
	//���������� += ���Կ�����  => ���������� ������ü�� ������ 
	// += �̷��� ���Կ����ڸ� ����ϸ� ������ ������ ;�����ݷ��� �ٱ⶧���� 
	// �������������� ������ �ʴ´�.
	public static final String SELECT_MEMBER = "SELECT * FROM `Jboard_member` WHERE `uid`=? AND `pass`=PASSWORD(?);";  // ��ȣȭ�� ��й�ȣ�� �״�� ���� 
	
	// �Խ��ǰ���
	
	public static final String SELECT_COUNT_TOTAL = "SELECT COUNT(`seq`) FROM `Jboard_article`;";
	
	public static final String SELECT_ARTICLES = "SELECT a.*,b.nick FROM `Jboard_article` AS a "
																							+ "JOIN `Jboard_member` AS b "
			                                                                                 + "ON a.uid = b.uid "
																							+ "ORDER BY `seq`  DESC  " 
																							+  "LIMIT ?, 10;";
	
	public static final String SELECT_MAX_SEQ = "SELECT MAX(`seq`) FROM `Jboard_article`;";
	public static final String SELECT_COUNT_UID  = "SELECT COUNT(`uid`) FROM `Jboard_member` WHERE `uid`=?;";
	public static final String SELECT_COUNT_HP  = "SELECT COUNT(`hp`) FROM `Jboard_member` WHERE `hp`=?;";
	public static final String SELECT_COUNT_EMAIL = "SELECT COUNT(`email`) FROM `Jboard_member` WHERE `email`=?;";
	
	
	
	
	//////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	public static final String INSERT_MEMBER = "INSERT INTO `Jboard_member` SET "
	 + "`uid`=?,"
	 + "`pass`=PASSWORD(?),"// ���̺��ʵ���� ����Ѵ� �׸��� ��й�ȣ�� ��ȣȭ�ؾ��Ѵ� 
	 + "`name`=?,"
	 + "`nick`=?,"
	 + "`email`=?,"
	 + "`hp`=?,"
	 + "`zip`=?,"
	 + "`add1`=?,"
	 + "`add2`=?,"
	 + "`regip`=?,"
	 + "`rdate`=NOW();";
	

	public static final String INSERT_ARTICLE = "INSERT INTO `Jboard_article` SET "
																								+"`title`=?,"
																								+"`content`=?,"
																								+"`file`=?,"
																								+"`uid`=?,"
																								+"`regip`=?,"
																								+"`rdate`=NOW();";
	public static final String INSERT_FILE = "INSERT INTO `Jboard_file` SET "
			+"`parent`=?,"
			+"`oriName`=?,"
			+"`newName`=?,"
			+"`rdate`=NOW();";
}
