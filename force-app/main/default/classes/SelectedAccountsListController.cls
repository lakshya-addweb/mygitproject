public class SelectedAccountsListController {
    public List<Account> selectedAccounts { get; set; }
    
    public SelectedAccountsListController(ApexPages.StandardSetController controller) {
        // Initialize the selected accounts list
        selectedAccounts = new List<Account>();
        
        // Fetch the selected records from the standard set controller
        List<SObject> selectedSObjects = controller.getSelected();
        
        // Extract the Ids from the selected SObjects
        List<Id> selectedIds = new List<Id>();
        for (SObject sObj : selectedSObjects) {
            selectedIds.add(sObj.Id);
        }
        
        // Query the selected accounts with the necessary fields
        if (!selectedIds.isEmpty()) {
            selectedAccounts = [SELECT Id, Name , Industry,Type FROM Account WHERE Id IN :selectedIds];
        }
    }
}