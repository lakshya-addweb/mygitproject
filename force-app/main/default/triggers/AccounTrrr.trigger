trigger AccounTrrr on Account (before insert) {
    if(Trigger.isBefore){
        if(Trigger.isInsert){
            AccountTriggerHandler.updatefield(Trigger.new);
        }
    }

}