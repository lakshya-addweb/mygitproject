trigger LeadtoACOTrigger on Lead (after insert) {
    if(Trigger.isAfter){
        if(Trigger.isInsert){
            LeadtoACO.opportunity(Trigger.New);
        }
    }

}