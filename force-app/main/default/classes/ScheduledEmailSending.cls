public class ScheduledEmailSending implements Schedulable {
    public void execute(SchedulableContext sc) {
        sendEmail();
    }
    
    public static void sendEmail() {
        List<Messaging.SingleEmailMessage> emailList = new List<Messaging.SingleEmailMessage>();
        Messaging.SingleEmailMessage myEmail = new Messaging.SingleEmailMessage();
        
        String[] toAddress = new String[] { 'rajdeep@addwebsolution.in' };
        String[] ccAddress = new String[] { 'deepak.p@addwebsolution.in' };
        String[] bccAddress = new String[] { 'saransh@addwebsolution.in' };
        
        myEmail.setToAddresses(toAddress);
        myEmail.setCcAddresses(ccAddress);
        myEmail.setBccAddresses(bccAddress);
        myEmail.setReplyTo('lakshya.s@addwebsolution.in');
        myEmail.setSenderDisplayName('Team Salesforce');
        myEmail.setSubject('Reminder for Session ');
        myEmail.setPlainTextBody('Hello sir , this is gentle reminder for Salesforce Session/n Thankyou');

        emailList.add(myEmail);
        Messaging.sendEmail(emailList);
    }
}