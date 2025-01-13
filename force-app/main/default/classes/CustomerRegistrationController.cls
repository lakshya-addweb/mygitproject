public class CustomerRegistrationController {
public Customerr__c customerr { get; set; }
public String step { get; set; }
public Boolean isDuplicate { get; set; }

public CustomerRegistrationController() {
customerr = new Customerr__c();
step = '1';
isDuplicate = false;
}

public void nextStep() {
if (step == '1') {
step = '2';
} else if (step == '2') {
step = '3';
}
}

public void previousStep() {
if (step == '2') {
step = '1';
} else if (step == '3') {
step = '2';
}
}

public PageReference save() {
List<Customerr__c> existingCustomers = [SELECT Id FROM Customerr__c WHERE Email__c = :customerr.Email__c LIMIT 1];
if (existingCustomers.isEmpty()) {
insert customerr;
step = '1'; // Completion step
isDuplicate = false;
} else {
isDuplicate = true;
}
return null;
}

public PageReference downloadPDF() {
PageReference pdfPage = Page.CustomerRegistrationPDFpage;
pdfPage.getParameters().put('id', customerr.Id); // Pass any necessary parameters

// Return the PageReference to initiate the PDF download
return pdfPage;

}
}