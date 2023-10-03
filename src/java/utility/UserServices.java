/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utility;

import dao.UserDao;
import java.util.Date;
import java.util.Properties;
import java.util.Random;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import model.User;

/**
 *
 * @author Mido
 */
public class UserServices {
    private final String fromEmail = "dungcqhe163037@outlook.com.vn";
    private final String password = "dung1233210";
    
    public void generateOneTimePassword(User user) throws Exception {
        Random rand = new Random();
        int upperbound = 1000000;
        String OTP = rand.nextInt(upperbound) + "";
        while(OTP.length() < 6) OTP += "0" + OTP;
        user.setOtp(OTP);
        user.setOtpRequestTime(new Date());
        UserDao userDao = new UserDao();
        userDao.update(user);
        sendOTPEmail(user, OTP);
    }
     
    public void sendOTPEmail(User user, String OTP) throws AddressException, MessagingException {
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp-mail.outlook.com"); //SMTP Host
        props.put("mail.smtp.port", "587"); //TLS Port
        props.put("mail.smtp.auth", "true"); //enable authentication
        props.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS
        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        });
        MimeMessage message = new MimeMessage(session);
        message.setFrom(new InternetAddress(fromEmail));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(user.getEmail(), false));
        message.setSubject("Forget Password");
        String htmlContent = "<h1>OTP: " + OTP +   "</h1>";
        message.setContent(htmlContent, "text/html");
        Transport.send(message);    
    }
 
    public void clearOTP(User user) throws Exception {
        user.setOtp(null);
        user.setOtpRequestTime(null);
        UserDao userDao = new UserDao();
        userDao.update(user);
    }  
}
