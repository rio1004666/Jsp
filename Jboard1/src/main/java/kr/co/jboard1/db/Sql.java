package kr.co.jboard1.db;

public class Sql {
	public static final String SELECT_TERMS = "SELECT * FROM `Jboard_terms`;"; // Ŭ�����̸����� �����ϰԲ� static���� ������� 
	// �޸𸮿� �ѹ��÷����� ���� �ϴ� ���� 
	// ���������̱⶧���� �� ����  => ���������ü�� �׳� �����ϱ⶧���� ������������!!!
	//���������� += ���Կ�����  => ���������� ������ü�� ������ 
	// += �̷��� ���Կ����ڸ� ����ϸ� ������ ������ ;�����ݷ��� �ٱ⶧���� 
	// �������������� ������ �ʴ´�.
	public static final String SELECT_MEMBER = "SELECT * FROM `Jboard_member` WHERE `uid`=? AND `pass`=PASSWORD(?);";  // ��ȣȭ�� ��й�ȣ�� �״�� ���� 
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
	
	public static final String SELECT_COUNT_UID  = "SELECT COUNT(`uid`) FROM `Jboard_member` WHERE `uid`=?;";
	public static final String SELECT_COUNT_HP  = "SELECT COUNT(`hp`) FROM `Jboard_member` WHERE `hp`=?;";
	public static final String SELECT_COUNT_EMAIL = "SELECT COUNT(`email`) FROM `Jboard_member` WHERE `email`=?;";
	
			
}
