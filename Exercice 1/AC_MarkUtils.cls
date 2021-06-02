/*-------------------------------------------------------------------------------------------------
Version: 			1.0
Created date: 		31/05/2021
Created by: 		Ángel Vela (avelamar@hotmail.es)
Last change date:	31/05/2021
Last change by:		Ángel Vela (avelamar@hotmail.es)
Function: 			Code utils for CO_Mark__c
-------------------------------------------------------------------------------------------------*/
public class AC_MarkUtils {
	
    //Function which refresh Average Mark field in CO_Student__c when a mark is created, updated or deleted
    public void refreshAverageMark (List<CO_Mark__c> marks) {
        List<Id> studentIds = new List<Id>();
        for (CO_Mark__c m : marks){
            studentIds.add(m.CF_Student__c);
        }
        try{
            List<CO_Student__c> students = [SELECT Id, CF_AverageMark__c FROM CO_Student__c WHERE Id IN :studentIds];
        	Map<String, List<CO_Mark__c>> markMap = new Map<String, List<CO_Mark__c>>();
        	List<CO_Mark__c> allMarks = [SELECT Id, CF_Student__c, CF_Mark__c FROM CO_Mark__c WHERE CF_Student__c IN: studentIds];
        	for(CO_Mark__c m : allMarks){
            	List<CO_Mark__c> lm = markMap.get(m.CF_Student__c);
                if(lm == null || lm.isEmpty()){
                    lm = new List<CO_Mark__c>(); 
                }
                lm.add(m);
                markMap.put(m.CF_Student__c,lm);
            }
            if(students != null && !students.isEmpty()){
                for(CO_Student__c s : students){
                    List<CO_Mark__c> ml = markMap.get(s.Id);
                    Decimal totalMarks = 0;
                    if(ml != null && !ml.isEmpty()){
                        for(CO_Mark__c m : ml){
                            totalMarks = totalMarks + m.CF_Mark__c;
                        }
                        s.CF_AverageMark__c = (totalMarks/ml.size()).setScale(2);
                    } else {
                        s.CF_AverageMark__c = totalMarks;
                    }
                }
                UPDATE students;
            }
        } catch (Exception e) {
            e.setMessage('Error in Refresh Average Mark');
        }
    }
    
}