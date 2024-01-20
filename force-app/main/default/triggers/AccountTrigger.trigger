trigger AccountTrigger on Account (after update) {
//ornek 5: Account’un “Billing City” alani guncellendiginde, buradaki degeri Child Contact’lardaki “Mailing City” alanina
//atayan bir Trigger olusturup, sonrasinda testini yapiniz.
   
    if(Trigger.isAfter && Trigger.isUpdate){
        Set<Id> accIds = new Set<Id>(); //id'leri bunun icinde tutacagiz
        
        for(Account acc : Trigger.new){
            if(acc.BillingCity != Trigger.oldMap.get(acc.Id).BillingCity){ //eski hal ile yeni hal ayni degilse update olmustur
                accIds.add(acc.Id); //Update olan Account'un Id'sini Set'e ekledik
            }
        }
        List<Contact> conList = [SELECT Id, MailingCity, Account.BillingCity FROM Contact WHERE AccountId IN : accIds];
        //Update olan Account'larin Contact'larini aldik
        for(Contact w : conList){
            w.MailingCity = w.Account.BillingCity;
        }
        update conList;
    }
}