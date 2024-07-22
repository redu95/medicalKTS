package com.bannershallmark.bean;
import java.util.Random;
public class RandomString {

	
	public String getRandomId() {

	    // create a string of all characters
	    String alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"+"0123456789"+"abcdefghijklmnopqrstuvxyz";
                
              
	    // create random string builder
	    StringBuilder sb = new StringBuilder();

	    // create an object of Random class
	    Random random = new Random();

	    // specify length of random string
	    int length = 8;

	    for(int i = 0; i < length; i++) {

	      // generate random index number
	      int index = random.nextInt(alphabet.length());

	      // get character specified by index
	      // from the string
	      char randomChar = alphabet.charAt(index);

	      // append the character to string builder
	      sb.append(randomChar);
	    }

	    String randonId = sb.toString();
	    System.out.println("Random String is: " + randonId);
        return randonId;
	  }
}
