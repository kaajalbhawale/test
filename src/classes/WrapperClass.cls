public class WrapperClass {
    public string lastName;
    public string email;

    public WrapperClass(string accountName , string accountEmail){
        lastName = accountName; 
        email = accountEmail;   
    }
   
    public Boolean equals(Object obj) {
        if (obj instanceof WrapperClass){
            WrapperClass p = (WrapperClass)obj;
            return ((lastName == p.lastName) && (email==p.email)); 
        }
      return false;  
    }
    
    public Integer hashCode() {
        return (2 * lastName.hashCode()) ^ email.hashCode(); 
    }   
   
}