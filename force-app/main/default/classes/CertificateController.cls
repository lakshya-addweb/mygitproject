public with sharing class CertificateController {
    public List<Contact> selectedContacts { get; set; }

    public CertificateController(ApexPages.StandardController stdController) {
        selectedContacts = new List<Contact>();
        String contactIds = ApexPages.currentPage().getParameters().get('ids');
        if (!String.isEmpty(contactIds)) {
            List<Id> ids = contactIds.split(',');
            selectedContacts = [SELECT Id, Name, Course__c, Email, MailingAddress, Birthdate FROM Contact WHERE Id IN :ids];
        } else {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Not found error: No contacts selected.'));
        }
    }

    @AuraEnabled
    public static void generateAndSendCertificates(List<Id> contactIds) {
        if (contactIds == null || contactIds.isEmpty()) {
            throw new AuraHandledException('Not found error: No contacts selected.');
        }
        
        List<Contact> contacts = [SELECT Id, Name, Course__c, Email, MailingAddress, Birthdate FROM Contact WHERE Id IN :contactIds];
        
        PageReference pdfPage = Page.Certificate; // The VF page created above
        pdfPage.getParameters().put('ids', String.join(contactIds, ','));
        Blob pdfBlob = pdfPage.getContentAsPDF();
        
        for (Contact contact : contacts) {
            sendCertificateEmail(contact, pdfBlob);
        }
    }

    private static void sendCertificateEmail(Contact contact, Blob pdfBlob) {
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        email.setToAddresses(new String[] {contact.Email});
        email.setSubject('Your Certificate of Completion');
        email.setPlainTextBody('Congratulations! Attached is your certificate of completion.');
        Messaging.EmailFileAttachment attachment = new Messaging.EmailFileAttachment();
        attachment.setFileName('Certificate.pdf');
        attachment.setBody(pdfBlob);
        email.setFileAttachments(new Messaging.EmailFileAttachment[] {attachment});
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});
    }
}