/*
*    Description : Class to perform all basic operations 
*
*    Version        Author            Date            Description
*  
*    1.0            Kaajal Bhawale    03/03/2015      Initial Draft
*/

    public class StaticClass {
        
        integer nonStaticNumber = 6;
       
        public static void staticMethod(){
            system.debug('Call to static method from Non static is executed');
        }
    }