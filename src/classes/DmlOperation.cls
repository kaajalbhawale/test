/*
*    Description : Class to perform all DML operations 
*
*    Version        Author            Date            Description
*  
*    1.0            Kaajal Bhawale    03/04/2015      Initial Draft
*/
public class DmlOperation {
    public void insertLeadRecords()
    {
       List<Lead> leadList = new List<Lead>();
      
      for(Integer leadIndex = 0; leadIndex < 100; leadIndex++) 
      {
            if(leadIndex < 50)
            {
                 Lead leadRecordAllField = new Lead(Name__c='',LastName = 'Shonali'+(leadIndex), Company = 'ESPL', status = 'Open');
                 leadList.add(leadRecordAllField);
            }//end of if
            else
            {
                Lead leadRecordNotAllField = new Lead(LastName = 'Pooja'+(leadIndex+100), Company = '', status = '');
                leadList.add(leadRecordNotAllField);
                system.debug('List is----------->'+leadRecordNotAllField);
            }//end of else
        }//end of for

        Database.SaveResult[] ListSavedResult = Database.insert(leadList, false);
        //Logs__c logObject = new Logs__c();

        for (Database.SaveResult savedResult : ListSavedResult) {
            if (savedResult.isSuccess()) {
                    System.debug('Successfully inserted account.Lead ID: ' + savedResult.getId());
            }//end of if
            else
            {
                for(Database.Error err : savedResult.getErrors()) 
                {        
                     Logs__c logObject = new Logs__c(); 
                     insert logObject;                       
                     logObject.Error__c = err.getMessage();                 
                }//end of for
              // System.debug(logObject);
            }//end of else
        }//end of for
    }

    
    
     
    //Delete all inactive Account records created in last 90 days.
    public void deleteInactiveAccount(){
        Account[] listDeleteAccount = [SELECT  Id, 
                                               Name 
                                       FROM Account 
                                       WHERE Active__c = 'No' 
                                       AND CreatedDate = LAST_N_DAYS:90];
                                       system.debug('Result---------->'+listDeleteAccount);
                 try{
                      
                      delete [SELECT  Id, 
                                               Name 
                                       FROM Account 
                                       WHERE Active__c = 'No' 
                                       AND CreatedDate = LAST_N_DAYS:90];
                      system.debug('Account is deleted');                                                 
                         
                    }//end of try block 
                 catch (DmlException e){
                    system.debug('NO inactive Account records created in last 90 days');
                }//end of catch block
     }//end of deleteInactiveAccount
 
  
    public void updateAsset(){  
             
        Asset assestRecord = new Asset(Name = 'kajal',  
                                       Line_Item_Id__c = '5678903',
                                       AccountId = '0012800000OHWho',
                                       ContactId = '0032800000GXe1e');                                  
     
        try 
        {
            upsert assestRecord Line_Item_Id__c ;            
            System.debug('Assest Record : ' +assestRecord);
        }//end of try block 
        catch (DmlException e) 
        {
            system.debug('Assest Record not inserted : '+e.getmessage());
        }//end of catch
    }//end of updateAssest
}