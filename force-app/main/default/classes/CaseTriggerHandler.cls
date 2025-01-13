public class CaseTriggerHandler {
    public static void updateCase(List<Case> clist){
        for(case cs:clist){
            if(cs.Origin == 'Email'){
                cs.Status ='New' ;
                cs.Priority='Medium';
            }
        }
        
    }

}