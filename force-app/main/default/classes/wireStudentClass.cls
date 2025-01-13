public class wireStudentClass {
    @AuraEnabled(cacheable =true)
    public static List<Student__c > getStudent(){
    List< Student__c>studList = [Select Id , Name__c , Total_Paid_Fees__c from Student__c LIMIT 10];
    return studList;
        }
    
    }