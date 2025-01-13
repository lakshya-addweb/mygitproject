trigger createcontact on Account (after insert) {
    if(Trigger.isInsert && Trigger.isAfter){
        AccountTocontact.createContact(Trigger.New);
 
    }

}