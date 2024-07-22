package com.bannershallmark.bean;

import java.io.File;
import java.io.IOException;
import java.util.logging.FileHandler;
import java.util.logging.Logger;
import java.util.logging.SimpleFormatter;


import org.apache.log4j.PropertyConfigurator;
public class Logbean {
	
		public void logAdd(String url,String errorMessage) {	
	    Logger logger = Logger.getLogger(Logbean.class.getName());
	    //System.IO.Directory.GetFiles(Server.MapPath("/fonts"));
	    FileHandler fh;  
	    try {  
	    	
	    	fh = new FileHandler("LogFile.log");     	
	        logger.addHandler(fh);
	        SimpleFormatter formatter = new SimpleFormatter();  
	        fh.setFormatter(formatter);  
	      // logger.setLevel(Level.WARNING);
	        logger.info(url);
	        logger.severe(errorMessage);
	    } catch (SecurityException e) {  
	        e.printStackTrace();  
	    } catch (IOException e) {  
	        e.printStackTrace();  
	    }    
	}
	    static final Logger resultLog = Logger.getLogger("file");

	    public static void main(String[] args) {
	        PropertyConfigurator.configure("log4j.properties");
	        
	        resultLog.info("Hello reportsLog message");
	    }  
	  
	
}
