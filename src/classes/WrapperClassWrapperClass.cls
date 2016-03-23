public class WrapperClassWrapperClass {
    public string lastName;
    public string email;
    public WrapperClassWrapperClass(string leadName , string leadEmail){
        lastName = leadName; 
        email = leadEmail;
        
    }
    
    public Boolean equals(Object obj) {
        if (obj instanceof WrapperClass){
            WrapperClassWrapperClass p = (WrapperClassWrapperClass)obj;
            return ((lastName==p.lastName) && (email==p.email)); 
        }
      return false;  
    }
    
    public Integer hashCode() {
        return (2 * lastName.hashCode()) ^ email.hashCode(); 
    }
}