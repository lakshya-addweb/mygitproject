public with sharing class LeadReportController {
    @AuraEnabled(cacheable=true)
    public static List<LeadWrapper> getLeadReport() {
        List<LeadWrapper> leadReport = new List<LeadWrapper>();

        AggregateResult[] results = [
            SELECT Industry, COUNT(Id) totalLeads
            FROM Lead
            WHERE Industry != NULL
            GROUP BY Industry
        ];

        for (AggregateResult result : results) {
            leadReport.add(new LeadWrapper(
                (String) result.get('Industry'),
                (Decimal) result.get('totalLeads')
            ));
        }

        return leadReport;
    }

    public class LeadWrapper {
        @AuraEnabled
        public String industry { get; set; }
        @AuraEnabled
        public Decimal totalLeads { get; set; }

        public LeadWrapper(String industry, Decimal totalLeads) {
            this.industry = industry;
            this.totalLeads = totalLeads;
        }
    }
}