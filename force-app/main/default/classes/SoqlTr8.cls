public class SoqlTr8 {
	//DML'de Undelete'i ogrenemek icin class olusturduk
    
    public static void method01(){
        List<Opportunity> opps = [SELECT Id FROM Opportunity WHERE isDeleted = true ALL ROWS]; //NAME= 'GENE POİNT'YAZILIRSA SADECE O GERİ GETİRİLİR
    
    Database.undelete(opps,false); // direkt eslesme olmayabiliyor.Bunu yazmak tavsiye ediliyor.SoqlTr8.method01(); ile  calıstırılır
    }
    
    }