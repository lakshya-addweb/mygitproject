public class OpportunityLineItemHandler {

public static void updateAccountRecord(List<OpportunityLineItem> oppLineItems){
Opportunity opn;
Account acct;
Integer productCount;
Map<Id,Integer> accIds = new Map<Id,Integer>();
List<Account> accListData = new List<Account>();
if(oppLineItems.size()>0){
For(OpportunityLineItem opp: oppLineItems){
opn = [SELECT AccountId from Opportunity where id =: opp.OpportunityId];
productCount = [SELECT Count() from OpportunityLineItem where OpportunityId =: opp.OpportunityId];
accIds.put(opn.AccountId,productCount);
}

if(accIds.size()>0){
List<Account> accountsToUpdate = [SELECT Id, Number_of_Products__c FROM Account WHERE Id IN : accIds.KeySet()];

For(Account acc: accountsToUpdate){
Integer pCount = accIds.get(acc.Id);
acc.Number_of_Products__c = pCount;
accListData.add(acc);
}
if(accListData.size()>0){
update accListData;
}
}
}
}
}