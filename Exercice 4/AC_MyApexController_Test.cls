/*-------------------------------------------------------------------------------------------------
Version: 			1.0
Created date: 		02/06/2021
Created by: 		Ángel Vela (avelamar@hotmail.es)
Last change date:	02/06/2021
Last change by:		Ángel Vela (avelamar@hotmail.es)
Function: 			Test class for AC_MyApexController
-------------------------------------------------------------------------------------------------*/
@isTest
public class AC_MyApexController_Test {
	
    static testmethod void searchRecordsTest(){
        List<Id> fixedSearch = new List<Id>();
        Campaign c = new Campaign (Name = 'Winter Season 21');
        insert c;
        fixedSearch.add(c.Id);
        Account a = new Account (Name = 'Ethan Winters');
        insert a;
        fixedSearch.add(a.Id);
        Opportunity o = new Opportunity(name = 'Winter games stadium cleaning', StageName='Prospecting', CloseDate = System.today()+15);
        insert o;
        fixedSearch.add(o.Id);
        Test.startTest();
        Test.setFixedSearchResults(fixedSearch);
        List<sObject> result = AC_MyApexController.searchRecords('Winter');
        for(sObject r : result){
            String type = r.Id.getSObjectType().getDescribe().getName();
            String name = (String) r.get('Name');
            System.debug(type+' '+name+' '+r.Id);
        }
        System.assertEquals('Ethan Winters', result[0].get('Name'));
        System.assertEquals('Winter Season 21', result[1].get('Name'));
        System.assertEquals('Winter games stadium cleaning', result[2].get('Name'));
        Test.stopTest();
    }
    
}