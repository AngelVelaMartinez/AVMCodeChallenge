/*-------------------------------------------------------------------------------------------------
Version: 1.0
Created date: 01/06/2021
Created by: Ángel Vela (avelamar@hotmail.es)
Last change date: 01/06/2021
Last change by: Ángel Vela (avelamar@hotmail.es)
Function: Class which organice contacts by values interlocking and incremental odd and even values, starting with an even value
-------------------------------------------------------------------------------------------------*/
public class AC_ContactOrganizer {
    
    //Main function method
    public static List<Contact> contactOrganizer(List<Contact> contacts){
        //Using a wrapper for order contacts incrementally
        List<AC_ContactWrapper> conWrapperList = new List<AC_ContactWrapper>();
        for(Contact c : contacts){
            conWrapperList.add(new AC_ContactWrapper(c));
        }
        conWrapperList.sort();
        for(AC_ContactWrapper c : conWrapperList){
            System.debug('Contact: '+c);
        }
        //Using a loop for interlocking odd and even values
        Boolean isEven = true;
        Integer i = 0;
        contacts = new List<Contact>();
        do {
            Contact c = conWrapperList.get(i).con;
            Integer position = i;
            i++;
            if (math.mod(Integer.valueOf(c.CF_Value__c), 2) == 0 && isEven){
                System.debug('Even');
                contacts.add(c);
                isEven = false;
                conWrapperList.remove(position);
                i = 0;
            } else if (math.mod(Integer.valueOf(c.CF_Value__c), 2) != 0 && !isEven){
                System.debug('Odd');
                contacts.add(c);
                isEven = true;
                conWrapperList.remove(position);
                i = 0;
            } else if (conWrapperList.size() == 1) {
                System.debug('Last');
                contacts.add(c);
                conWrapperList.remove(position);
            }
        } while (conWrapperList.size() > 0);
        return contacts;
    }
    
}