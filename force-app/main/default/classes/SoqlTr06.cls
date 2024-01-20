public class SoqlTr06 {
	//1) Database'e bir tane Lead Object'i insert ediniz.
    //2) Insert ettiginiz Lead Object'inin LastName'ini Xyz yapiniz.
    //3) Lead'de zorunlu alanlar Company, LastName ve Status'dur.
    
    public static void method01(){
        
        Lead obj = new Lead (FirstName='Ali',LastName ='Can',Company='TechPro Education',Status='Open-Not Contacted');
         Insert obj;
        
        //read haric digerleri tehlikelidir.
        //Update,Delete ,Undelete operasyonları kritik operasyonlardır.Bu operasyonlar 'Id' olmadan yapılamazlar
        
        List<Lead> leads = [SELECT Id FROM Lead WHERE FirstName='Ali' AND LastName='Can' AND Company ='TechPro Education'];
        for(Lead w:leads){
           w.lastName='Xyz'; 
        }
            
        Update leads ;//Database.update(leads);seklinde de yazılabilir.SoqlTr06.method01(); ile  calıstrıılır

    }
}