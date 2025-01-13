public class AccountInsert {
    public static void insertData(){
        Account acc= new Account();
        acc.name= 'Lakshyasoni454656';
        acc.Phone= '467465';
        insert acc;
        
        Contact con = new Contact();
        con.LastName = acc.name;
        con.AccountId= acc.Id;
        insert con;
        
        Opportunity opp = new Opportunity();
        opp.Name = acc.name;
        opp.StageName= 'Prospecting';
        opp.CloseDate= System.Today();
        opp.AccountId= acc.Id;
        insert opp;
        
    }
    
}