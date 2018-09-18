package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	private Connection con=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	private DataSource ds=null;
	
	private Connection getConnection() {
		//커넥션 넘기기
		try {
			Context ctx = new InitialContext();
			ds=(DataSource)ctx.lookup("java:comp/env/jdbc/MySQL");
			con=ds.getConnection();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return con;	
	}
	
	private void close(Connection con, PreparedStatement pstmt, ResultSet rs) {
		try {
			if(rs!=null)
				rs.close();
			if(pstmt!=null)
				pstmt.close();
			if(con!=null)
				con.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	private void close(Connection con, PreparedStatement pstmt) {
		try {
			
			if(pstmt!=null)
				pstmt.close();
			if(con!=null)
				con.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public int member_insert(MemberVO vo) {
		int result=0;
		
		try {
			con = getConnection();
			//트랜잭션
			con.setAutoCommit(false);
			String sql="insert into member values(?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, vo.getUserid());
			pstmt.setString(2, vo.getPassword());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getGender());
			pstmt.setString(5, vo.getEmail());
			result=pstmt.executeUpdate();
			con.commit();
		} catch (SQLException e) {
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			close(con,pstmt);
		}
		return result;
	}//insert 종료
	
	
/*	public MemberVO islogin(MemberVO vo) {
		//ArrayList<MemberVO> list = new ArrayList<>();
		MemberVO vo1 = null;
		con=getConnection();
		String sql= "select userid, name from member where userid = ? and  password = ?";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, vo.getUserid());
			pstmt.setString(2, vo.getPassword());
			rs=pstmt.executeQuery();
			if(rs.next()) {
				vo1 = new MemberVO();
				vo1.setUserid(rs.getString("userid"));//1		
				vo1.setName(rs.getString("name"));//3
				System.out.println(vo1.toString());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(con, pstmt, rs);
		}
		return vo1;
	}//로그인 확인
*/	
	
	
	
	//선생님
	public MemberVO isLogin(String id,String password) {
		//id,password 정보에 해당하는 사용자 확인 후 id와 name 넘겨주기
		MemberVO vo=null;
		try {
			con=getConnection();
			con.setAutoCommit(false);
			String sql="select * from member where userid=? and password=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			//select결과를 담는 테이블 rs : 단하나의 레코드만 들어감
			rs=pstmt.executeQuery();
			//한명의 사용자 아이디,이름이 필요하기에 if
			if(rs.next()) { //하나라도 일치한다면
				vo=new MemberVO();
				//칼럼명 또는 1,2,3과 같은 자리값을 넣어도 됨
				vo.setUserid(rs.getString("userid"));
				vo.setName(rs.getString("name"));
			}
			con.commit();
		}catch(Exception e) {
			try {
				con.rollback();
			} catch (SQLException e1) {				
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			close(con,pstmt,rs);
		}
		return vo;
	}//로그인 확인
	
	//아이디 중복 확인
	public boolean checkId(String userid) {
		boolean flag=false;
		try {
			con=getConnection();
			con.setAutoCommit(false);
			String sql="select * from member where userid=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				flag=true;
			}
			con.commit();
		}catch(Exception e) {
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
		return flag;
	}
	
}

