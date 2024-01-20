public class ScheduableOpportunity implements Schedulable{
    //Schedulable'u implement ettik. Asagida execute'u kullan diye uyari cikar
    
    public void execute(SchedulableContext context){ //kalibi bu
        //bana opp list lazim. Burada sorgulayip, parametre olarak gonderelim.
        
        List<Opportunity> oppList = [SELECT Id, Name, OwnerId, CloseDate FROM Opportunity WHERE isClosed__c = False AND CloseDate < TODAY];
        //TODAY yani yakin tarih daha buyuk sayiliyor.TODAY'i one yazamazsiniz.
        
        TaskClass.createTaskForOpp(oppList);// artık task olusumu asenkron hale geldi.
        //calısma zamanı anonymous windowsta belirleyecegiz
        
    }

}