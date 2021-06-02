/*-------------------------------------------------------------------------------------------------
Version: 			1.0
Created date: 		01/06/2021
Created by: 		Ángel Vela (avelamar@hotmail.es)
Last change date:	01/06/2021
Last change by:		Ángel Vela (avelamar@hotmail.es)
Function: 			Class which implements Comparable for wrapping numbers by ascending value
-------------------------------------------------------------------------------------------------*/
global class AC_ContactWrapper implements Comparable {
	
    public Contact con;
    
    // Constructor
    public AC_ContactWrapper(Contact c) {
        con = c;
    }
    
    // Compare contacts based on the contact value.
    global Integer compareTo(Object compareTo) {
        AC_ContactWrapper compareToOppy = (AC_ContactWrapper)compareTo;       
        Integer returnValue = 0;
        if (con.CF_Value__c > compareToOppy.con.CF_Value__c) {
            returnValue = 1;
        } else if (con.CF_Value__c < compareToOppy.con.CF_Value__c) {
            returnValue = -1;
        }        
        return returnValue;       
    }
    
}