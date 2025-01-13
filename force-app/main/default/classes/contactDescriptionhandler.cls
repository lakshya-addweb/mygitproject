public class contactDescriptionhandler {
    public static void updateDecription(List<Contact > conlist, Map<Id, Contact>conoldMap){
        List < Account > alist = new List <Account>();
        for(Contact con: conlist){
            if(con.AccountId!= null && con.Description!= conoldMap.get(con.Id).Description){
                Account acc = [Select Id , Name , Description From Account where Id =: con.AccountId];
                acc.Description = con.Description;
                alist.add(acc);
            }
        }
        if(!alist.isEmpty()){
            update alist;}
    }
    
}