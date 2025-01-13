trigger createnewcontact on Account (after insert) {
    if(Trigger.isInsert && Trigger.isAfter){
        createnewcontactHandler.Createnewcontact(Trigger.New);
    }

}