trigger contactDescr on Contact ( after update) {
    if(Trigger.isAfter){
        if(Trigger.isUpdate){
contactDescriptionhandler.updateDecription(Trigger.New, Trigger.oldMap);}
    }

}