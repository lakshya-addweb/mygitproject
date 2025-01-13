trigger OpportunityLineitem on OpportunityLineItem (after insert) {
    if(Trigger.isInsert && Trigger.isAfter){
        OpportunityLineItemHandler.updateAccountRecord(Trigger.New);
    }

}