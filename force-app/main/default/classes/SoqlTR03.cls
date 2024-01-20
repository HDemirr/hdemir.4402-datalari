public class SoqlTR03 {
    //ornek 3: Account ismi 'GenePoint', 'Burlington Textiles Corp of America', 'sForce', 'Dickenson plc' olan
    //Account'larin Rating'lerini Account isimleri ile birlikte console'a yazdiran bir method olusturunuz.
    //1.yol: Tavsiye edilmez cunku IN'den sonra bir cok Account yazilabilir. Bu da query'i okunmaz hale getirir.

    public static void method01(){
        //query'de Aggregate function kullanmayacagimiz icin bunu List'e koyalim
        
        List<Account> accs = [SELECT Name, Rating FROM Account WHERE Name IN ('GenePoint', 'Burlington Textiles Corp of America', 'sForce', 'Dickenson plc')];
        
        for(Account w : accs){
            System.debug(w.Name + '-' + w.Rating);
            
        }
        
    }
    //2.yol : Tavsiye edilir. 1. Yolu sadelestirelim.
public static void method02(){
        //Data'lari List'in icinde tutalim
        //Bir tane List acip, sadelestrilmis query'e atalim.
        
        List<String> accountNames = new List<String>{'GenePoint', 'Burlington Textiles Corp of America', 'sForce', 'Dickenson plc'};
        //IN kullanimi
        
        List<Account> accs1 =[SELECT Name, Rating FROM Account WHERE Name IN :accountNames];
        for(Account w : accs1){
             System.debug(w.Name + '-' + w.Rating);
            
            //:accountNames ifadesine 'Binding Variable' denir (baglayici degisken)
            // 'Binding Variable' lar 'IN', 'NOT IN', '=', '!=', 'LIMIT', 'OFFSET' lerde kullanilir.
        }
        System.debug('==================================');

        //'NOT IN' kullanimi
        
        List<Account> accs2 =[SELECT Name, Rating FROM Account WHERE Name NOT IN :accountNames];
        for(Account w : accs2){
             System.debug(w.Name + '-' + w.Rating);
       }
       System.debug('==================================');
       //'=' kullanimi. IN ile = ayni isi yapar.     

    List<Account> accs3 =[SELECT Name, Rating FROM Account WHERE Name = :accountNames];
        for(Account w : accs3){
             System.debug(w.Name + '-' + w.Rating);  //SoqlTR03.method02(); ile calistiriniz.
        }
       System.debug('==================================');
        //'!=' kullanimi
    List<Account> accs4 =[SELECT Name, Rating FROM Account WHERE Name != :accountNames];
        for(Account w : accs4){
             System.debug(w.Name + '-' + w.Rating); //SoqlTR03.method02(); ile calistiriniz.
        }        
       System.debug('==================================');
    }
    //method02() ici fazla kalabaliklasti. Yeni method olusturalim.

    public static void method03(){
        //Account isimlerini alfabetik siraya koyduktan sonra 3. 4. ve 5. Accountlarin
        //Rating'lerini Account isimleri ile birlikte console'a yazdiran methou olusturunuz.
        //LIMIT ve OFFSET kullaniminda ORDER BY kullaniyoruz
        //1.yol
        List<Account> accs = [SELECT Name, Rating FROM Account ORDER BY Name LIMIT 3 OFFSET 2];
        
        for(Account w : accs){
            System.debug(w.Name + '-' + w.Rating); //SoqlTR03.method03(); ile calistiriniz.
        }
    }
    //2.yol : Binding variable kullanalim.
    // Query'e dokunmadan sadece Integer kisminda degisiklik yapariz. Kodu bozma riski azalir.
    public static void method04(){
    
        Integer lim = 3; 
        Integer oSet = 2;
        
        List<Account> accs = [SELECT Name, Rating FROM Account ORDER BY Name LIMIT :lim OFFSET :oSet];
        
        for(Account w : accs){
            System.debug(w.Name + '-' + w.Rating); //SoqlTR03.method04(); ile calistiriniz.
        }
     }
    
    //3.yol:En iyi yol.Methodu dinamikyapabilirz.Baslangıcta Parametre sorar
   
    public static void method05(Integer lim, integer oSet){
      
        List <Account> accs =[SELECT Name,Rating FROM Account ORDER BY Name LIMIT:lim OFFSET :oSet];
    
        for(Account w: accs){
            System.debug(w.Name + '-' + w.Rating); //SoqlTR03.method05(3,2); ile calistiriniz.
        }
     }
}