public class wireDemo {

    @AuraEnabled(cacheable =true)
    public static List<Account > getAccount(){
   List< Account>alist = [Select Id , Name from Account LIMIT 10];
    return alist;
        }
    
    }