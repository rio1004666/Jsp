package kr.co.jboard1.db;

public class Sql {
	public static final String SELECT_TERMS = "SELECT * FROM `Jboard_terms`;"; // 클래스이름으로 참조하게끔 static선언 고정상수 
	// 메모리에 한번올려져서 공유 하는 변수 
	// 전역변수이기때문에 쭉 연결  => 멤버변수자체는 그냥 선언만하기때문에 연산하지않음!!!
	//지역변수면 += 대입연산자  => 지역변수는 연산자체를 많이함 
	// += 이렇게 대입연산자를 사용하면 문장을 끝내는 ;세미콜론이 붙기때문엣 
	// 전역변수에서는 사용되지 않는다.
	public static final String SELECT_MEMBER = "SELECT * FROM `Jboard_member` WHERE `uid`=? AND `pass`=PASSWORD(?);";  // 암호화한 비밀번호를 그대로 매핑 
	
	// 게시판관련
	
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
	 + "`pass`=PASSWORD(?),"// 테이블필드명을 써야한다 그리고 비밀번호를 암호화해야한다 
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
