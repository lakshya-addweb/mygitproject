public class createOpportunity {
    public static void opportunity(List <Lead> alead){
        List <Opportunity> opplist = new List <Opportunity>();
        for(Lead ld: alead){
            if ( ld.Status == 'Closed - Converted'){
                Opportunity opp = new Opportunity();
                opp.Name = ld.LastName;
                opp.CloseDate = System.Today();
                opp.StageName= 'Closed Won';
                opplist.add(opp);}
            else if ( ld.Status == 'Closed - Not Converted'){
                Opportunity opp = new Opportunity();
                opp.Name = ld.LastName;
                opp.CloseDate = System.Today();
                opp.StageName= 'Closed Lost';
                opplist.add(opp);}}
        if(!opplist.isEmpty()){
            insert opplist;}}}