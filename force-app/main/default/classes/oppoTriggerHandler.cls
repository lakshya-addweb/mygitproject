public class oppoTriggerHandler {
    public static void maxOpp(List<Opportunity> oppList) {
        List<Account> aList = new List<Account>();

        for (Opportunity opp : oppList) {
            if (opp.AccountId != null) {
                Opportunity opp1 = [SELECT Id, Name, Amount FROM Opportunity WHERE AccountId = :opp.AccountId 
                                    ORDER BY Amount DESC LIMIT 1];
                Account acc = [SELECT Id, Name, maxOpp__c FROM Account  WHERE Id = :opp.AccountId];
                acc.maxOpp__c = opp1.Name;
                aList.add(acc);
            }
        }
        if (!aList.isEmpty()) {
            update aList;
        }
    }
}