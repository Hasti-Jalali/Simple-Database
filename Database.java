import java.awt.*;
import java.sql.*;

public class Database {
	
	private String connectionUrl;
	private Statement stmt;
	public CallableStatement callableStatement;
	private Connection conn;
	
	public Database() {
		connectionUrl = "jdbc:mysql://127.0.0.1:3306";
		try {
			//Class.forName("com.mysql.jdbc.Driver");
			connect();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		
	}
	
	public void connect() throws Exception{
		try
		{
			conn = DriverManager.getConnection(connectionUrl, "root", "hj6111379");
			stmt = conn.createStatement();
			conn.setAutoCommit(true);
		} 
		catch (SQLException ex) {
		    // handle the exception
			System.out.println("SQLException: " + ex.getMessage());
		    System.out.println("SQLState: " + ex.getSQLState());
		    System.out.println("VendorError: " + ex.getErrorCode());
		}
	}
	
	public void executQuery(String query) {
		try {
			ResultSet rs = stmt.executeQuery(query);
			ResultSetMetaData rsmd = rs.getMetaData();
			int columnsNumber = rsmd.getColumnCount();
			while (rs.next()) {
			    for (int i = 1; i <= columnsNumber; i++) {
			        if (i > 1) System.out.print("	");
			        String columnValue = rs.getString(i);
			        System.out.print(rsmd.getColumnName(i) + " : " + columnValue);
			    }
			    System.out.println("");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void printResultSet(ResultSet rs) {
		try {
			ResultSetMetaData rsmd = rs.getMetaData();
			int columnsNumber = rsmd.getColumnCount();
			while (rs.next()) {
			    for (int i = 1; i <= columnsNumber; i++) {
			        if (i > 1) System.out.print("");
			        String columnValue = rs.getString(i);
			        System.out.print(rsmd.getColumnName(i) + " : " + columnValue);
			        System.out.println("");
			    }
			    System.out.println("");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public void callCreateUserPrc(String fName, String lName, String userName, String password, String birthDate,String bio) {
		try {
			CallableStatement callableStatement = conn.prepareCall("{call DBProject.PRC_CREATE_USER(?,?,?,?,?,?)}");
			callableStatement.setString(1, fName);
			callableStatement.setString(2, lName);
			callableStatement.setString(3, userName);
			callableStatement.setString(4, password);
			callableStatement.setString(5, birthDate);
			callableStatement.setString(6, bio);
			conn.setAutoCommit(false);
			boolean hadResults = callableStatement.execute();
			conn.setAutoCommit(true);
			if(hadResults) {
				ResultSet rs = callableStatement.getResultSet();
				printResultSet(rs);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
	}
	public void callLoginPrc(String userName, String password) {
		try {
			CallableStatement callableStatement = conn.prepareCall("{call DBProject.PRC_LOG_IN(?,?)}");
			callableStatement.setString(1, userName);
			callableStatement.setString(2, password);
			conn.setAutoCommit(false);
			boolean hadResults = callableStatement.execute();
			conn.setAutoCommit(true);
			if(hadResults) {
				ResultSet rs = callableStatement.getResultSet();
				printResultSet(rs);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
	}
	
	public void callLoginCheckPrc(String userName) {
		try {
			CallableStatement callableStatement = conn.prepareCall("{call DBProject.PRC_LOG_INS_CHECK(?)}");
			callableStatement.setString(1, userName);
			boolean hadResults = callableStatement.execute();
			if(hadResults) {
				ResultSet rs = callableStatement.getResultSet();
				printResultSet(rs);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
	}
	public void callCreateAvaPrc(String content) {
		try {
			CallableStatement callableStatement = conn.prepareCall("{call DBProject.PRC_CREATE_AVA(?)}");
			callableStatement.setString(1, content);
			boolean hadResults = callableStatement.execute();
			if(hadResults) {
				ResultSet rs = callableStatement.getResultSet();
				printResultSet(rs);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
	}
	
	public void callgetPersonalAvaPrc() {
		try {
			CallableStatement callableStatement = conn.prepareCall("{call DBProject.PRC_GET_PERSONAL_AVA()}");
			boolean hadResults = callableStatement.execute();
			if(hadResults) {
				ResultSet rs = callableStatement.getResultSet();
				printResultSet(rs);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
	}
	
	public void callfollowprc(String username) {
		try {
			CallableStatement callableStatement = conn.prepareCall("{call DBProject.PRC_FOLLOW(?)}");
			callableStatement.setString(1, username);
			boolean hadResults = callableStatement.execute();
			if(hadResults) {
				ResultSet rs = callableStatement.getResultSet();
				printResultSet(rs);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
	}
	public void callUnfollowprc(String username) {
		try {
			CallableStatement callableStatement = conn.prepareCall("{call DBProject.PRC_UNFOLLOW(?)}");
			callableStatement.setString(1, username);
			boolean hadResults = callableStatement.execute();
			if(hadResults) {
				ResultSet rs = callableStatement.getResultSet();
				printResultSet(rs);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
	}
	public void callBlockPrc(String username) {
		try {
			CallableStatement callableStatement = conn.prepareCall("{call DBProject.PRC_BLOCK(?)}");
			callableStatement.setString(1, username);
			boolean hadResults = callableStatement.execute();
			if(hadResults) {
				ResultSet rs = callableStatement.getResultSet();
				printResultSet(rs);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
	}
	public void callUnblockPrc(String username) {
		try {
			CallableStatement callableStatement = conn.prepareCall("{call DBProject.PRC_UNBLOCK(?)}");
			callableStatement.setString(1, username);
			boolean hadResults = callableStatement.execute();
			if(hadResults) {
				ResultSet rs = callableStatement.getResultSet();
				printResultSet(rs);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
	}
	public void callGetFollowingsAvasPrc() {
		try {
			CallableStatement callableStatement = conn.prepareCall("{call DBProject.PRC_FOLLOWING_AVA()}");
			boolean hadResults = callableStatement.execute();
			if(hadResults) {
				ResultSet rs = callableStatement.getResultSet();
				printResultSet(rs);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
	}
	public void callGetSomeUserAvasPrc(String username) {
		try {
			CallableStatement callableStatement = conn.prepareCall("{call DBProject.PRC_SPECIFIC_USER_AVA(?)}");
			callableStatement.setString(1, username);
			boolean hadResults = callableStatement.execute();
			if(hadResults) {
				ResultSet rs = callableStatement.getResultSet();
				printResultSet(rs);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
	}
	
	public void callCommentPrc(int avaId,String content) {
		try {
			CallableStatement callableStatement = conn.prepareCall("{call DBProject.PRC_COMMENT(?,?)}");
			callableStatement.setInt(1, avaId);
			callableStatement.setString(2, content);
			boolean hadResults = callableStatement.execute();
			if(hadResults) {
				ResultSet rs = callableStatement.getResultSet();
				printResultSet(rs);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
	}
	public void callGetCommentPrc(int avaId) {
		try {
			CallableStatement callableStatement = conn.prepareCall("{call DBProject.PRC_GET_COMMENT(?)}");
			callableStatement.setInt(1, avaId);
			boolean hadResults = callableStatement.execute();
			if(hadResults) {
				ResultSet rs = callableStatement.getResultSet();
				printResultSet(rs);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
	}
	public void callAvasOfHashtagPrc(String hashtag) {
		try {
			CallableStatement callableStatement = conn.prepareCall("{call DBProject.PRC_AVAs_SPECIFIC_HASHTAG(?)}");
			callableStatement.setString(1, hashtag);
			boolean hadResults = callableStatement.execute();
			if(hadResults) {
				ResultSet rs = callableStatement.getResultSet();
				printResultSet(rs);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
	}
	public void callLikePrc(int avaId) {
		try {
			CallableStatement callableStatement = conn.prepareCall("{call DBProject.PRC_LIKE(?)}");
			callableStatement.setInt(1, avaId);
			boolean hadResults = callableStatement.execute();
			if(hadResults) {
				ResultSet rs = callableStatement.getResultSet();
				printResultSet(rs);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
	}
	public void callAvaLikesCountPrc(int avaId) {
		try {
			CallableStatement callableStatement = conn.prepareCall("{call DBProject.PRC_AVA_LIKE_NUMBER(?)}");
			callableStatement.setInt(1, avaId);
			boolean hadResults = callableStatement.execute();
			if(hadResults) {
				ResultSet rs = callableStatement.getResultSet();
				printResultSet(rs);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
	}
	public void callAvaLikersUsernamePrc(int avaId) {
		try {
			CallableStatement callableStatement = conn.prepareCall("{call DBProject.PRC_AVA_LIKES_USERNAME(?)}");
			callableStatement.setInt(1, avaId);
			boolean hadResults = callableStatement.execute();
			if(hadResults) {
				ResultSet rs = callableStatement.getResultSet();
				printResultSet(rs);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
	}
	public void callBestAvasPrc() {
		try {
			CallableStatement callableStatement = conn.prepareCall("{call DBProject.PRC_BEST_AVAS()}");
			boolean hadResults = callableStatement.execute();
			if(hadResults) {
				ResultSet rs = callableStatement.getResultSet();
				printResultSet(rs);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
	}
	public void callSendMessagePrc(Boolean isAva, String recipientUsername, int avaId, String text) {
		try {
			CallableStatement callableStatement = conn.prepareCall("{call DBProject.PRC_SEND_MESSAGE(?,?,?,?)}");
			callableStatement.setBoolean(1, isAva);
			callableStatement.setString(2, recipientUsername);
			callableStatement.setInt(3, avaId);
			callableStatement.setString(4, text);
			boolean hadResults = callableStatement.execute();
			if(hadResults) {
				ResultSet rs = callableStatement.getResultSet();
				printResultSet(rs);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
	}
	public void callGetMessagePrc(String transmitterUsername) {
		try {
			CallableStatement callableStatement = conn.prepareCall("{call DBProject.PRC_GET_MESSAGES_OF_USER(?)}");
			callableStatement.setString(1, transmitterUsername);
			boolean hadResults = callableStatement.execute();
			if(hadResults) {
				ResultSet rs = callableStatement.getResultSet();
				printResultSet(rs);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
	}
	public void callTransmitterUserNamePrc() {
		try {
			CallableStatement callableStatement = conn.prepareCall("{call DBProject.PRC_GET_TRANSMITTER_MESSAGE_USERNAME()}");
			boolean hadResults = callableStatement.execute();
			if(hadResults) {
				ResultSet rs = callableStatement.getResultSet();
				printResultSet(rs);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
	}
}
