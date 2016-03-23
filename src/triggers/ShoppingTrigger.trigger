trigger ShoppingTrigger on Shopping__c (after insert, after update, before insert, before update) {
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
    }
    
    if(trigger.isAfter) {
        if(trigger.isinsert) {
            system.debug('ValueAfterInsert NEW'+trigger.new);
            system.debug('ValueAfterInsert NEWMAP'+trigger.newmap);
        }
        if(trigger.isupdate){
            system.debug('ValueAfterUpdate NEW' +trigger.new);
            system.debug('ValueAfterUpdate NEWMAP' +trigger.newmap);
            system.debug('ValueAfterUpdate OLD' +trigger.old);
            system.debug('ValueAfterUpdate OLDMAP' +trigger.oldmap);
        }
    }  
    
    
}