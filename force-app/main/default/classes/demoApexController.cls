public class demoApexController {

    public String selectedCountry { get; set; }
    
    // Method to get country options for the dropdown
    public List<SelectOption> getCountryOptions() {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('No', 'Select Country'));
        options.add(new SelectOption('India', 'India'));
        options.add(new SelectOption('America', 'America'));
        return options;
    }
}