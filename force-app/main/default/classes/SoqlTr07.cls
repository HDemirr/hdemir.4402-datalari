public class SoqlTr07 {
    //DML'de Delete'i ogreemek icin class olusturduk
    //Opportunity Object olusturunuz
    //Opportunity'de Name, CloseDate ve StageName zorunlu alanlardir.
    
    public static void method01(){
        Opportunity obj = new Opportunity(Name='TechproEd', StageName='Closed Won', CloseDate=Date.today().addDays(2));
        
        //Opportunity obj = new Opportunity();
        //obj.Name='TechproEd'; bu sekilde de olusturabilirdik
        
        Database.insert(obj);
        //Delete icin Id'ye ihtiyac var.
        List<Opportunity> opps = [SELECT Id FROM Opportunity WHERE Name='TechproEd' AND StageName='Closed Won'];
        Database.delete(opps);
        //Admin partta sonucu gormek icin 'Recyle Bin' kontrol edilir.SoqlTr07.method01(); ile  calıstırılır
    }

}