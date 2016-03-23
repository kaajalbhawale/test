/*
*    Description : Class to perform all basic operations 
*
*    Version        Author            Date            Description
*  
*    1.0            Kaajal Bhawale    03/03/2015      Initial Draft
*/

public class  Fibonacci{
    
    //Class to print fibonacci series
    public void fibonacciSeries( Integer inputNumber ){
        
        //List that stores fibonacci series values
        List<Integer> listElements = new List<Integer>();
        Integer result = 0;
        Integer InputNegativeNumber = -(inputNumber);            
        
        if(inputNumber < 0){
            system.debug('The Fibonacci Series is:');       
            //Adding first two elements of the series
            listElements.add(0);
            System.debug(+listElements[0]);
            listElements.add(1);
            System.debug('-'+listElements[1]);         
            
            //Logic to find fibonacci series
            for(Integer listIndex = 2; result <= InputNegativeNumber; listIndex++){
    
                result = listElements[listIndex - 1] + listElements[listIndex - 2];
                if(result <= InputNegativeNumber ){
                    listElements.add(result);
                    system.debug('-'+listElements[listIndex]);
                }//end of if
            }//end of for
            
        }//end of if    

        else if(inputNumber == 0)
        {
           system.debug('The Fibonacci Series is:');
           listElements.add(0);
           system.debug(listElements[0]);
        }//end of if       
         
        else{ 
            system.debug('The Fibonacci Series is:');       
            //Adding first two elements of the series
            listElements.add(0);
            System.debug(listElements[0]);
            listElements.add(1);
            System.debug(listElements[1]);           
           
                
            //Logic to find fibonacci series
            for(Integer listIndex = 2; result <= inputNumber; listIndex++){
    
                result = listElements[listIndex - 1] + listElements[listIndex - 2];
                if(result <= inputNumber){
                    listElements.add(result);
                    system.debug(+listElements[listIndex]);
                }//end of if
            }//end of for
        }//end of else    
    }//end of fibonacciSeries Method
    
    //Method To reverse a string
    public void reverseString(String inputString){

        //To store result of reversed string
        String reversedString = ' ';

        //logic to find reversed string
        for (Integer stringIndex = inputString.length()-1; stringIndex >= 0; stringIndex--){
            reversedString += inputString.substring(stringIndex, stringIndex+1);
        }//end of for

        //Print the reversed string
        system.debug(reversedString);

    }//end of reverse Method


    //Method to perform all String Operations
    public void stringOperation(String inputString ){

        //Replace Occurence of @ with A
        system.debug('Original String-'+inputString+'After Replacing @ with A- Changed String is : ' 
                        + inputString.replace('@','A'));
                        
        String updatedString = inputString.replace('@','A');
        //Print the substring 
        system.debug('The Substring is : ' + updatedString.substring(11,updatedString.length()));

        //Split the String using space 
        system.debug('Splited String using Space is : '+ updatedString.split(' '));

        //Remove the spaces in the String 
        system.debug('The String without Whitespaces is: ' +updatedString.deleteWhitespace());

        //Convert the string to the upper case 
        system.debug('The Upper case String is: ' +updatedString.toUpperCase());

        //Convert the string to the lower case 
        system.debug('The Lower case String is: ' +updatedString.toLowerCase());

       }//end of 

 }