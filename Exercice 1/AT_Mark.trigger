/*-------------------------------------------------------------------------------------------------
Version: 			1.0
Created date: 		31/05/2021
Created by: 		Ángel Vela (avelamar@hotmail.es)
Last change date:	31/05/2021
Last change by:		Ángel Vela (avelamar@hotmail.es)
Function: 			CO_Mark__c trigger on inserts, updates and deletes
-------------------------------------------------------------------------------------------------*/
trigger AT_Mark on CO_Mark__c (after insert, after update, after delete) {
	
    AC_MarkHandler handler = new AC_MarkHandler();
    
    if(Trigger.isAfter){
        if(Trigger.isInsert){
            handler.OnAfterInsert(Trigger.newMap);
        } else if(Trigger.isUpdate){
            handler.OnAfterUpdate(Trigger.newMap);
        } else if(Trigger.isDelete){
            handler.OnAfterDelete(Trigger.oldMap);
        }
    }
}