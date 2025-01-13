public class ScheduledEmailSender implements Schedulable {
    public void execute(SchedulableContext sc) {
        EmailSending.sendEmail();
    }
}