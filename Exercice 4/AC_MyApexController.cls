/*-------------------------------------------------------------------------------------------------
Version: 			1.0
Created date: 		02/06/2021
Created by: 		Ángel Vela (avelamar@hotmail.es)
Last change date: 	02/06/2021
Last change by: 	Ángel Vela (avelamar@hotmail.es)
Function: 			Controller class of lightning web component My Component
-------------------------------------------------------------------------------------------------*/
public with sharing class AC_MyApexController {
    
    //Method which uses a SOSL query to retrieve all principal records which could have a term in his values
    @AuraEnabled(cacheable=true)
    public static List<sObject> searchRecords(String keyword) {
        List<List<SObject>> records = [FIND :keyword IN ALL FIELDS RETURNING Account(Id, Name), Campaign(Id, Name), Contact(Id, Name), Lead(Id, Name), Opportunity(Id, Name)];
        List<sObject> results = new List<sObject>();
        for (List<SObject> sobjs : records) {
            for (SObject sobj : sobjs) {
                results.add(sobj);
            }
        }
        return results;
    }
    
}