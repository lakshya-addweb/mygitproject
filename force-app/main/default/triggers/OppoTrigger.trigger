trigger OppoTrigger on Opportunity (after insert, after update) {
    if(Trigger.isAfter){
        if(Trigger.isInsert || Trigger.isUpdate){
            oppoTriggerHandler.maxOpp(Trigger.New);
            
        }
    }

}