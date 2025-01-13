public class comboBoxAccContact{
    @AuraEnabled
    public static List<Account> getAccounts(){
        List<Account>accList = [Select Id , Name from Account LIMIT 10];
        return accList;
    }


    @AuraEnabled
    public static List<Contact> getContacts(String selectedAccountId){
        List<Contact> conList =[Select id , Name , Email from Contact Where AccountId=: selectedAccountId];
        return conList;
    }
}