public class CreateNewContactHandler {
    
    public static void createNewContact(List<Account> accList){
        List<Contact> conList = new List<Contact>();
        
        for(Account acc : accList){
            if(acc.Industry == 'Banking' && acc.Id != null ){
                Contact con = new Contact();
                con.AccountId = acc.Id;
                con.LastName = acc.Name;
                con.Phone = acc.Phone;
                conList.add(con);
            }
        }
        
        if(!conList.isEmpty()){
            insert conList;
        }
    }
}