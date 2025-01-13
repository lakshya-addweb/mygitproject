trigger AccountPhone on Account (before insert , before update , after insert) {
    if(Trigger.isBefore ){
        if(Trigger.isUpdate || Trigger.isInsert){
       AccountPhoneHandler.AccountPhone(Trigger.New);
       AccountPhoneHandler.syncAddress(Trigger.New);
        }}
    if (Trigger.isAfter){
        if(Trigger.isUpdate || Trigger.isInsert){
            AccountPhoneHandler.ContactPhone(Trigger.New);
}
}

}