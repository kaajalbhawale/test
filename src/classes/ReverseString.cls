//Class to reverse a string
public class ReverseString {
	 public  void reverse(String stringToReverse ){
	 	
		String Inputstring = stringToReverse;
		String stringReversed = Inputstring.reverse();    
		system.debug('Reversed string of '+stringToReverse+' is '+stringReversed);
	 }
	 public void reverse1(String InputString){
	 	String revStr = ' ';

		for (Integer i = InputString.length()-1; i >= 0; i--)
		{
			revStr += InputString.substring(i, i+1);
		}

			system.debug(revStr );
	 }
}