trigger LeadOppo on Lead (after insert , after update) {
    
    if (Trigger.isAfter){
        if(Trigger.isInsert || Trigger.isUpdate){
            createOpportunity.opportunity(Trigger.New);
        }
    }
    
}