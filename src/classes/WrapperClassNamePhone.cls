public class WrapperClassNamePhone {
   public string lastName;
    public string phoneNumber;

    public WrapperClassNamePhone(string accountName , string accountPhoneNumber){
        lastName = accountName; 
        phoneNumber = accountPhoneNumber;   
    }
   
    public Boolean equals(Object obj) {
        if (obj instanceof WrapperClass){
            WrapperClass p = (WrapperClass)obj;
          //  return ((lastName == p.lastName) && (phoneNumber==p.phoneNumber)); 
        }
      return false;  
    }
    
    public Integer hashCode() {
        return (2 * lastName.hashCode()) ^ phoneNumber.hashCode(); 
    }   
}