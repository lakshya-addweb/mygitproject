trigger OppoProduct on OpportunityLineItem (after insert , after update) {
    if(Trigger.isAfter){
        if(Trigger.isInsert || Trigger.isUpdate){
            AccountProductCount.countProduct(Trigger.New);
        }
    }

    
}