public class LeadtoACO {
    public static void opportunity(List<Lead> alead){
        List <Opportunity> opplist = new List <Opportunity>();
        List <Account> accList = new List <Account>();
        List <Contact> conList = new List <Contact>();

        for(Lead ld : alead){
            if(ld.Status == 'Closed - Converted'){
                // Create Account
                Account acc = new Account();
                acc.Name = ld.LastName + ' Account';
                accList.add(acc);

                // Create Contact
                Contact con = new Contact();
                con.LastName = ld.LastName + ' Contact';
                con.AccountId = acc.Id;
                conList.add(con);

                // Create Opportunity
                Opportunity opp = new Opportunity();
                opp.Name = ld.LastName + ' Opportunity';
                opp.CloseDate = System.today();
                opp.StageName = 'Closed Won';
                opp.AccountId = acc.Id;
                opplist.add(opp);
            }
        }
        if(!accList.isEmpty()){
            insert accList;
            for(Integer i = 0; i < accList.size(); i++){
                conList[i].AccountId = accList[i].Id;
                opplist[i].AccountId = accList[i].Id;
            }
            // Insert Contacts and Opportunities
            if(!conList.isEmpty()){
                insert conList;
            }
            if(!opplist.isEmpty()){
                insert opplist;
            }
        }
    }
}