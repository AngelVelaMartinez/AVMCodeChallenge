/*-------------------------------------------------------------------------------------------------
Version: 			1.0
Created date: 		01/06/2021
Created by: 		Ángel Vela (avelamar@hotmail.es)
Last change date: 	01/06/2021
Last change by: 	Ángel Vela (avelamar@hotmail.es)
Function: 			Test class for AC_ContactWrapper & AC_ContactOrganizer
-------------------------------------------------------------------------------------------------*/
@isTest
public class AC_ContactOrganizer_Test {
    
    //Test method which cover ContactOrganizer method in AC_ContactOrganizer
    static testmethod void contactOrganizerTest(){
        List<Contact> clist = new List<Contact>();
        clist.add(new Contact(LastName = 'ContactTest1', CF_Value__c=4));
        clist.add(new Contact(LastName = 'ContactTest2', CF_Value__c=7));
        clist.add(new Contact(LastName = 'ContactTest3', CF_Value__c=2));
        clist.add(new Contact(LastName = 'ContactTest4', CF_Value__c=1));
        clist.add(new Contact(LastName = 'ContactTest5', CF_Value__c=3));
        Test.startTest();
        clist = AC_ContactOrganizer.contactOrganizer(clist);
        List<Decimal> values = new List<Decimal>{2,1,4,3,7};
        for(Integer i = 0; i < clist.size(); i++){
            System.assertEquals(values.get(i), clist.get(i).CF_Value__c);
        }
        Test.stopTest();
    }
}