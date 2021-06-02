/*-------------------------------------------------------------------------------------------------
Version: 			1.0
Created date: 		31/05/2021
Created by: 		Ángel Vela (avelamar@hotmail.es)
Last change date:	31/05/2021
Last change by:		Ángel Vela (avelamar@hotmail.es)
Function: 			Handler secuencies for CO_Mark__c trigger
-------------------------------------------------------------------------------------------------*/
public class AC_MarkHandler {
	
    AC_MarkUtils utils = new AC_MarkUtils();
    
    public void OnAfterInsert(Map<Id,CO_Mark__c> newMap){
        utils.refreshAverageMark(newMap.values());
    }
    
    public void OnAfterUpdate(Map<Id,CO_Mark__c> newMap){
        utils.refreshAverageMark(newMap.values());
    }
    
    public void OnAfterDelete(Map<Id,CO_Mark__c> oldMap){
        utils.refreshAverageMark(oldMap.values());
    }
}