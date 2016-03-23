/*    Description : Class to perform all basic operations 
*
*    Version        Author            Date            Description
*  
*    1.0            Kaajal Bhawale    03/03/2015      Initial Draft
*/


    public class fib {
    //Class to print fibonacci series
    public void fibonacciSeries( Integer inputNumber ){
        
        //List that stores fibonacci series values
        List<Integer> listElements = new List<Integer>();
        Integer result = 0;
        
        if(inputNumber < 0){
            system.debug('Fibonacci Series cannot be generated for negative numbers.');
        	system.debug('The Fibonacci Series is:');       
            //Adding first two elements of the series
            listElements.add(0);
            System.debug(listElements[0]);
            listElements.add(-1);
            System.debug(listElements[1]);           
           
                
            //Logic to find fibonacci series
            for(Integer listIndex = -2; result >= inputNumber; --listIndex){
    
                result = listElements[listIndex - 1] + listElements[listIndex - 2];
                if(result >= inputNumber){
                    listElements.add(result);
                    system.debug(+listElements[listIndex]);
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

}