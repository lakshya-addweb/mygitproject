public class Testcustom {
    public static void custom(){
        List <My_Custom_Mdt__mdt> mymdt = [Select Label, CallBack_Url__c,Client_Id__c,Scheduled_Date__c From My_Custom_Mdt__mdt];
        for(My_Custom_Mdt__mdt mydata : mymdt){
            System.debug(mydata);
        }
    
         mySetting__c mycustom = [Select CallBack_Url__c,Client_Id__c,Scheduled_Date__c from mySetting__c ];
        system.debug(mycustom);
        
        System.debug(Label.myLabel);
    }

}