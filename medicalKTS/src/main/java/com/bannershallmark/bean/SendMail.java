package com.bannershallmark.bean;

import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
@Controller
public class SendMail {
	
	private String techEmails;
	
    public  void sendMail(String fromEmail,String frompassword,String toEmail ,String randomId,String smtp,String port,String status) {
    	//
    }
    
    
    public  void sendSupportEmail(String senderName, String issueType, String issueDescription, String fromEmail, String frompassword, String smtp, String port, String status, String techEmails) {   	 
      //
   }

}