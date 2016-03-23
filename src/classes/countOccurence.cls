/*
*    Description : Class to Accept a string as a parameter and count the occurrence of every 
                   character in it
*
*    Version        Author            Date            Description
*  
*    1.0            Kaajal Bhawale    03/03/2015      Initial Draft
*/


public class countOccurence {

    public void countCharacterOccurrence(String inputString){

        String[] charArray = inputString.split('');   //Split the string into particular character
        Integer count = 0;
        String character = charArray[count];
        Map<String,Integer> charCounter = new Map<String,Integer>();//Map to store character
                                                                    // and count
        for(Integer stringIndex = 0; stringIndex < inputString.length(); stringIndex++)
        {
            character = charArray[stringIndex];
            //Find if charcter present in map add 1 to the count
            if(charCounter.containsKey(character)){
                charCounter.put(character, charCounter.get(character)+1);
            }//end of if loop
            //if character not present in the map add to the map
            else{
                charCounter.put(character, 1);
            }
        }//end of for loop

        for(String key:charCounter.keySet())
        {
            System.debug('The letter '+key+ ' :'+charCounter.get(key));
        }//end of for loop

    }//end of method countCharacterOccurrence       
}//end of class