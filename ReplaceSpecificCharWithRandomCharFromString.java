package org.random.com;

import java.util.Random;
import java.util.stream.Collectors;

public class  ReplaceSpecificCharWithRandomCharFromString {
    
    public static final String RANDOM_STRING = "a1b2c3d4";
    static String input = "abc#def#ghi#jkl";
     
    public static void main(String[] args) {
        System.out.println( replaceRandom1(input));
    }
    private static String replaceRandom1(String inputString) {
    	return 	inputString.chars().mapToObj(c -> (char) c).map(x->  x=='#'    
    			          ?  RANDOM_STRING.charAt( new Random().nextInt(RANDOM_STRING.length()))
    			    	  : x).map(String::valueOf).collect(Collectors.joining());
    }
    
}
    
