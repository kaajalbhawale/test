public class CheckRecursion {
    
    private static boolean flag = true;

       public static boolean runOnce()
        {
            if(flag)
            {
                flag = false;
                return true;
            }//end of is
            else
            {                
                flag = true;
                return false;
             }//end of else
        }//end of runOnce 
  }//end of recursive method