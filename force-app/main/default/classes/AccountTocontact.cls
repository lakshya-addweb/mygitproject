public class AccountTocontact {
    public static void createContact(List<Account> alist){
        List<Contact> conlist = new List<Contact>();
        for(Account acc: alist){
            if(acc.Id!=Null ){
            Contact con = new Contact();
            con.AccountId = acc.Id;
            con.FirstName = acc.FirstName;
            con.LastName= acc.LastName;  
                conlist.add(con);
        }
        }
    if(!conlist.isEmpty())
    {
        insert conlist;
    }}
    
}