/*-------------------------------------------------------------------------------------------------
Version: 			1.0
Created date: 		31/05/2021
Created by: 		Ángel Vela (avelamar@hotmail.es)
Last change date:	31/05/2021
Last change by:		Ángel Vela (avelamar@hotmail.es)
Function: 			Test class for AT_Mark, AC_MarkHandler & AC_MarkUtils
-------------------------------------------------------------------------------------------------*/
@isTest
public class AC_MarkUtils_Test {
    
	//Test method which cover RefreshAverageMark util when a mark is created, updated or deleted
    static testMethod void refreshAverageMarkTest(){
        CO_Student__c student = new CO_Student__c();
        insert student;
        Test.startTest();
        CO_Mark__c m1 = new CO_Mark__c(CF_Student__c = student.Id, CF_Mark__c = 6.0);
        insert m1;
        CO_Mark__c m2 = new CO_Mark__c(CF_Student__c = student.Id, CF_Mark__c = 7.2);
        insert m2;
        CO_Mark__c m3 = new CO_Mark__c(CF_Student__c = student.Id, CF_Mark__c = 5.8);
        insert m3;
        student = [SELECT Id, CF_AverageMark__c FROM CO_Student__c WHERE Id =: student.Id];
        System.assertEquals(6.33, student.CF_AverageMark__c);
        m1.CF_Mark__c = 6.6;
        update m1;
        student = [SELECT Id, CF_AverageMark__c FROM CO_Student__c WHERE Id =: student.Id];
        System.assertEquals(6.53, student.CF_AverageMark__c);
        delete m1;
        student = [SELECT Id, CF_AverageMark__c FROM CO_Student__c WHERE Id =: student.Id];
        System.assertEquals(6.50, student.CF_AverageMark__c);
        delete m2;
        delete m3;
        student = [SELECT Id, CF_AverageMark__c FROM CO_Student__c WHERE Id =: student.Id];
        System.assertEquals(0, student.CF_AverageMark__c);
        Test.stopTest();
    }
    
}