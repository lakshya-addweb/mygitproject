public class LeadSourceHandler {
    public static void updateLead(List<Lead>lsList){
        for(Lead ls:lsList){
            if(ls.LeadSource=='Web'){
                ls.Rating='Cold';
            }else{
                ls.Rating='Hot';
            }
        }
    }

}