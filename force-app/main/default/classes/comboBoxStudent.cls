public class comboBoxStudent {
    @AuraEnabled
    public static List<Student__c > getStudent(){
    List< Student__c>studList = [Select Id , Name__c from Student__c ];
    return studList;
        }
    
    }