trigger CaseTrigger on Case (before insert) {
    if(Trigger.isBefore){
        if(Trigger.isInsert){
            CaseTriggerHandler.updateCase(Trigger.New);
            
        }
    }

}