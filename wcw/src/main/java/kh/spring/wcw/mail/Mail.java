package kh.spring.wcw.mail;

import java.util.Date;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Mail {
	public static void sendMailForPwd(String mail, String randomNum) { // result = pwd
		 Properties p = System.getProperties();
	     p.put("mail.smtp.starttls.enable", "true");     // gmail은 true 고정
	     p.put("mail.smtp.host", "smtp.naver.com");      // smtp 서버 주소
	     p.put("mail.smtp.auth", "true");                // gmail은 true 고정
	     p.put("mail.smtp.port", "587");                 // 네이버 포트
	     
	     Authenticator auth = new MyAuthentication();
	     //session 생성 및  MimeMessage생성
	     Session session = Session.getDefaultInstance(p, auth);
	     MimeMessage msg = new MimeMessage(session);
	     
	     try{
	            //편지보낸시간
	            msg.setSentDate(new Date());
	            InternetAddress from = new InternetAddress() ;
	            from = new InternetAddress("6aseonbase@naver.com"); //발신자 아이디
	            // 이메일 발신자
	            msg.setFrom(from);
	            // 이메일 수신자
	            InternetAddress to = new InternetAddress(mail);
	            msg.setRecipient(Message.RecipientType.TO, to);
	            // 이메일 제목
	            msg.setSubject("[WCW] 인증번호 안내드립니다.", "UTF-8");
	            // 이메일 내용
	            msg.setText("안녕하세요, WCW입니다. \n 인증번호: " + randomNum, "UTF-8");
	            // 이메일 헤더
	            msg.setHeader("content-Type", "text/html");
	            //메일보내기
	            javax.mail.Transport.send(msg, msg.getAllRecipients());
	            System.out.println("이메일 send");
				return;
	             
	        }catch (AddressException addr_e) {
	            addr_e.printStackTrace();
	            System.out.println("이메일 send 실패1");
	        }catch (MessagingException msg_e) {
	            msg_e.printStackTrace();
	            System.out.println("이메일 send 실패2");
	        }catch (Exception msg_e) {
	            msg_e.printStackTrace();
	            System.out.println("이메일 send 실패3");
	        }
	     
	}
}

class MyAuthentication extends Authenticator {
    
    PasswordAuthentication pa;
    public MyAuthentication(){
         
        String id = "6aseonbase";  //네이버 이메일 아이디
        String pw = "dbqls7781";        //네이버 비밀번호
 
        // ID와 비밀번호를 입력한다.
        pa = new PasswordAuthentication(id, pw);
    }
 
    // 시스템에서 사용하는 인증정보
    public PasswordAuthentication getPasswordAuthentication() {
        return pa;
    }
} 