public class SoqlTR1 {
      //Account Name'lerini ve telefon numaralarini console'a yazan bir method olusturunuz
   
    public void method01(){
       //Account veri gelecek.List'le karsilayalim
       List<Account> accs = [SELECT Name,Phone FROM Account ];
           System.debug(accs);  // SoqlTR1 a1 = new SoqlTR1();
								//a1.method01();  ile calistir
        //Class icinde query yazarken [] kullanilir
        //Tum data'yi ayni satirda yazdirir.
        //Class icinde ID otomatik gelir.
       
        //Ayri satirda yazdiralim
        
        for(Account w : accs){
            System.debug('Account.Name:' + w.Name + 'Account Phone:' + w.Phone);
        }
    }  


    //Account name'lerini ve telefon numaralarini console'a yazan bir method olusturunuz(Map kullanin)
  	
    public static void method02(){   //bunu da static yapalim
        //key'ler unique olmalidir. O yuzden ID kullanmaliyiz.
        //map'e query'i yuklerken parantezi icinden yukleriz
        
        Map<Id, Account> accsMap = new Map<Id, Account>([SELECT Name, Phone FROM Account]);
        System.debug(accsMap); // SoqlTR1.method02(); class ve method ile calistirdik cunku statik method olusturduk
        						//tek satirda yazdirdi
        
        //alt alta yazdiralim
        for(Account w : accsMap.values()){
            System.debug('Account Name :' + w.Name); //SoqlTR1.method02(); ile calistir.
        }
    }
    
   //Her bir Contact icin, Account Name, Account Rating, Contact Name, Contact Department,
   //Case Number ve Case Subject'i console'a yazdiran method olusturunuz
   //Account parent, Contact child, Case Contact'in child'i. Ana object Contact
     
   public static void method03(){
        List<Contact> contacts = [SELECT Contact.Name, 
                                  	Contact.Department, 
                                  	Account.Name, 
                                  	Account.Rating, 
                                  	(SELECT Case.CaseNumber, 
                                     		Case.Subject 
                                   	FROM Cases) 
                                  FROM Contact];
        for(Contact w : contacts){
            System.debug(w.Name + '-' + w.Department + '-' + w.Account.Name + '-' + w.Account.Rating);
            
            //Data'yi en kucuk child object'ten (case) almak. Her contact icin ayri ayri case'leri cagiracagimiz
            //icin nested for each loop kullanacagiz.
            for(Contact c : contacts){
                for(Case t : c.cases){
                    System.debug(t.CaseNumber + '-' + t.Subject); //SoqlTR1.method03(); ile calistirin
                }
            }
            System.debug('//-----------------------');
        }
    } 
}