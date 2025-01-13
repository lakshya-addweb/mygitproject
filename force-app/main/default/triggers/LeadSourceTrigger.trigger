trigger LeadSourceTrigger on Lead (before insert ) {
    if(Trigger.isBefore && Trigger.isInsert){
LeadSourceHandler.updateLead(Trigger.New);}
}