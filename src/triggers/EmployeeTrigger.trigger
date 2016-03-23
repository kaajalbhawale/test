/*
*    Description : Apex Trigger on Employee
*
*    Version        Author            Date            Description
*  
*    1.0            Kaajal Bhawale    07/3/2016      Initial Draft
*/


trigger EmployeeTrigger on Employee__c (after delete, 
                                        after insert, 
                                        after undelete, 
                                        after update, 
                                        before delete, 
                                        before insert, 
                                        before update) {
 
    if(trigger.isBefore) {
        if(trigger.isinsert) {
            system.debug('ValueBeforeInsert NEW' +trigger.new);
        }
        if(trigger.isupdate){
            system.debug('ValueBeforeUpdate NEW' +trigger.new);
            system.debug('ValueBeforeUpdate NEWMAP' +trigger.newmap);
            system.debug('ValueBeforeUpdate OLD' +trigger.old);
            system.debug('ValueBeforeUpdate OLDMAP' +trigger.oldmap);
        }
        if(trigger.isdelete){
             system.debug('ValueBeforeDelete OLD' +trigger.old);
            system.debug('ValueBeforeDelete OLDMAP' +trigger.oldmap);
        }      
    }
    
    if(trigger.isAfter) {
        if(trigger.isinsert) {
           // system.debug('ValueAfterInsert NEW'+trigger.new);
            system.debug('ValueAfterInsert NEWMAP'+trigger.newmap);
        }
        if(trigger.isupdate){
            system.debug('ValueAfterUpdate NEW' +trigger.new);
            system.debug('ValueAfterUpdate NEWMAP' +trigger.newmap);
            system.debug('ValueAfterUpdate OLD' +trigger.old);
            system.debug('ValueAfterUpdate OLDMAP' +trigger.oldmap);
        }
        if(trigger.isdelete){
            system.debug('ValueAfterDelete OLD' +trigger.old);
            system.debug('ValueAfterDelete OLDMAP' +trigger.oldmap);
        }
        if(trigger.isundelete){
            system.debug('ValueAfterDelete NEWMAP'+trigger.newmap);
        }
        
    }

}