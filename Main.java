import java.util.Scanner;
import java.sql.*;
public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Database database = new Database();
		Scanner scanner = new Scanner(System.in);
		String inputString = "start";
//		database.executQuery("select * from dbproject.user");
		while(inputString != "end") {
			System.out.println("Please Enter Your Command : ");
			inputString = scanner.next();
			if(inputString.toLowerCase().equals("create_user")) {
				System.out.print("First Name : ");
				String fName = scanner.next();
				System.out.print("Last Name : ");
				String lName = scanner.next();
				System.out.print("Username : ");
				String userName = scanner.next();
				System.out.print("Passsword : ");
				String password = scanner.next();
				System.out.print("Year of Birth : ");
				String birthDate = new String();
				int year = scanner.nextInt();
				birthDate = year + "-";
				System.out.print("Month of Birth : ");
				int month = scanner.nextInt();
				birthDate += month + "-";
				System.out.print("Day of Birth : ");
				int day = scanner.nextInt();
				birthDate += day;
				System.out.println("Bio : ");
				String bio = scanner.nextLine();
				bio = scanner.nextLine();
				database.callCreateUserPrc(fName, lName, userName, password, birthDate, bio);
			}
			else if(inputString.toLowerCase().equals("log_in")) {
				System.out.print("Username : ");
				String userName = scanner.next();
				System.out.print("Passsword : ");
				String password = scanner.next();
				database.callLoginPrc(userName, password);
			}
			else if(inputString.toLowerCase().equals("log_ins_check")) {
				System.out.print("Username : ");
				String userName = scanner.next();
				database.callLoginCheckPrc(userName);
			}
			else if(inputString.toLowerCase().equals("create_ava")) {
				System.out.println("Ava Content : ");
				String content = scanner.nextLine();
				content = scanner.nextLine();
				database.callCreateAvaPrc(content);
			}
			else if(inputString.toLowerCase().equals("get_personal_ava")) {
				database.callgetPersonalAvaPrc();
			}
			else if(inputString.toLowerCase().equals("follow")) {
				System.out.print("Enter Username You'd Like To Follow : ");
				String followingUsername = scanner.next();
				database.callfollowprc(followingUsername);
			}
			else if(inputString.toLowerCase().equals("unfollow")) {
				System.out.print("Enter Username You'd Like To Unfollow : ");
				String followingUsername = scanner.next();
				database.callUnfollowprc(followingUsername);
			}
			else if(inputString.toLowerCase().equals("block")) {
				System.out.print("Enter Username You'd Like To Block : ");
				String username = scanner.next();
				database.callBlockPrc(username);
			}
			else if(inputString.toLowerCase().equals("unblock")) {
				System.out.print("Enter Username You'd Like To Unblock : ");
				String username = scanner.next();
				database.callUnblockPrc(username);
			}
			else if(inputString.toLowerCase().equals("followings_avas")) {
				database.callGetFollowingsAvasPrc();
			}
			else if(inputString.toLowerCase().equals("specific_user_ava")) {
				System.out.print("Enter Username You'd Like To See Its Avas : ");
				String username = scanner.next();
				database.callGetSomeUserAvasPrc(username);
			}
			else if(inputString.toLowerCase().equals("comment")) {
				System.out.print("Enter Ava Id You'd Like To Comment : ");
				int avaId = scanner.nextInt();
				System.out.println("Enter Your Comment Content : ");
				String content = scanner.nextLine();
				content = scanner.nextLine();
				database.callCommentPrc(avaId, content);
			}
			else if(inputString.toLowerCase().equals("get_comments")) {
				System.out.print("Enter Ava Id You'd Like To See It's Comment : ");
				int avaId = scanner.nextInt();
				database.callGetCommentPrc(avaId);
			}
			else if(inputString.toLowerCase().equals("specific_hashtag_avas")) {
				System.out.print("Enter Your Hashtag : ");
				String hashtag = scanner.next();
				database.callAvasOfHashtagPrc(hashtag);
			}
			else if(inputString.toLowerCase().equals("like")) {
				System.out.print("Enter Ava Id You Want To Like : ");
				int avaId = scanner.nextInt();
				database.callLikePrc(avaId);
			}
			else if(inputString.toLowerCase().equals("likes_count")){
				System.out.print("Enter Ava Id You Want To See Number of Likes : ");
				int avaId = scanner.nextInt();
				database.callAvaLikesCountPrc(avaId);
			}
			else if(inputString.toLowerCase().equals("likers_username")){
				System.out.print("Enter Ava Id You Want To See Number of Likes : ");
				int avaId = scanner.nextInt();
				database.callAvaLikersUsernamePrc(avaId);
			}
			else if(inputString.toLowerCase().equals("best_avas")) {
				database.callBestAvasPrc();
			}
			else if(inputString.toLowerCase().equals("send_message")) {
				System.out.print("Choose : " + '\n' + "1. Send Text\n" + "2. Send Ava");
				int choice = scanner.nextInt();
				int avaId = 0;
				String text = new String();
				boolean isAva = (choice == 1) ? false:true;
				System.out.print("Enter Username You'd Like To Send Message : ");
				String recipientUsername = scanner.next();
				if(choice == 1) {
					System.out.println("Enter Yours Message Content: ");
					text = scanner.nextLine();
					text = scanner.nextLine();
				}
				else if(choice == 2) {
					System.out.println("Enter Ava Id : ");
					avaId = scanner.nextInt();
				}
				database.callSendMessagePrc(isAva, recipientUsername, avaId, text);
				
			}
			else if(inputString.toLowerCase().equals("get_message_user")) {
				System.out.print("Enter Transmitter Username : ");
				String transmitterUsername = scanner.next();
				database.callGetMessagePrc(transmitterUsername);
			}
			else if(inputString.toLowerCase().equals("get_transmitter_username_message")) {
				database.callTransmitterUserNamePrc();
			}
			
		}
		
		
		
		scanner.close();
	}

}
