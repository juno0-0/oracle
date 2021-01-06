package view;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

//Data Access Object
//DB 연결하는 클래스
public class MemberDAO {
	//1. 오라클 데이터베이스 연동을 위한 4가지 정보를 문자열에 저장
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String userid = "system";
	String passwd = "1234";
	
	public MemberDAO() {
		try {
			//2. 드라이버 로딩 OracleDriver 클래스를 자바에서 이용하기 위해서 JVM에 올려줌
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}//end 생성자
	
	//회원 정보 보기
	public ArrayList<MemberDTO> select(){
		ArrayList<MemberDTO> list = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		//PreparedStatement : ?를 나중에 입력하는 것
		ResultSet rs = null;
		try {
			//3. Connection 맺기
			con = DriverManager.getConnection(url, userid, passwd);
			//4. SQL문을 작성
			String query = "SELECT * FROM member";
			//5. PreparedStatement 생성, 요청할 SQL문을 전송하고 실행하는 클래스
			pstmt = con.prepareStatement(query);
			//6. 전송한 후 DB에서 SQL문이 실행되고 결과를 담아 줄 것을 작성
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setName(rs.getString("name"));
				dto.setAge(rs.getInt("age"));
				dto.setHeight(rs.getInt("height"));
				dto.setWeight(rs.getInt("weight"));
				dto.setSex(rs.getString("sex").charAt(0));
				list.add(dto);//ArrayList에 데이터베이스의 레코드를 가져와서 모두 넣어주는 것
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			//7. 자원 반납
				try {
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(con != null) con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		//데이터베이스에서 가져온 정보가 들어있는 ArrayList를 리턴
		return list;
		
	}//end select
}//end class
