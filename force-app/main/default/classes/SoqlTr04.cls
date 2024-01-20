public class SoqlTr04 {
      
   // Farklı durumlara göre farklılasan dynamic query olusturalım
   // ör 4:'class1' icin Account Name ve Annual Revenue (yillik ciro) ama Rating i 'Hot' ve
   // Annual Revenue su 1000 den büyük olanlar icin secin
   //'Class2' icin  icin Account Name ve Annual Revenue (yillik ciro) ama Rating i 'Warm' ve
   // Annual Revenue su 1000 den büyük olanlar icin secin
   // Digerleri icin Account Name ve Annual Revenue (yillik ciro) ama Rating i 'Null' olanları secin

   // Secim yapabilmek icin dısardan string parametre alacagız.Class1,Class2 ve digerleri diye.
   // Farklı durumlara dallanmak icin if-else if -else kullanalım
   //1yol:iyi degil 

    
   //SoqlTr04.method01('Class1');SoqlTr04.method01('Class2');SoqlTr04.method01('xyz'); ile caıstır
    public static void method01(String className){
        
        if(className.equals('Class1')){
           
            List<Account> q1 =[SELECT Name,AnnualRevenue FROM Account WHERE Rating ='Hot' AND AnnualRevenue>1000];
            
            for(Account w:q1){
              system.debug(w.Name + '_' + w.AnnualRevenue);  
            }
       
        }else if(className.equals('Class2')){
            
            List<Account> q2 = [SELECT Name, AnnualRevenue FROM Account WHERE Rating='Warm' AND AnnualRevenue>1000];
            
            for(Account w : q2){
                System.debug(w.Name + '-' + w.AnnualRevenue);
            }
        
        }else{
            List<Account> q3 = [SELECT Name, AnnualRevenue FROM Account WHERE Rating=NULL];
            
            for(Account w : q3){
                System.debug(w.Name + '-' + w.AnnualRevenue);
            }
        }
    } 
   
   //2.yol: iyi...1.yol'da bir method'un icinde 3 tane list olusturduk. Bu memory'i yorar.
   //Uc tane for each loop kullandik. if'lerin icinde List'leri hallettikten sonra tek bir for each ile halledelim.
   // SoqlTr04.method01('Class1');SoqlTr04.method01('Class2');SoqlTr04.method01('xyz'); ile caıstır

    public static void method02(String className){
        
        List<Account> q1 = new List<Account>();
        
        if(className.equals('Class1')){ 
            q1 =[SELECT Name,AnnualRevenue FROM Account WHERE Rating ='Hot' AND AnnualRevenue>1000];
            
        }else if(className.equals('Class2')){ 
            q1 = [SELECT Name, AnnualRevenue FROM Account WHERE Rating='Warm' AND AnnualRevenue>1000];
            
        }else{
            q1 = [SELECT Name, AnnualRevenue FROM Account WHERE Rating=NULL];
        }
        for(Account w:q1){
            system.debug(w.Name + '-' + w.AnnualRevenue);
        }
    }
    //3.yol: En iyi cunku dynamic query
    //'SELECT Name, AnnualRevenue FROM Account' bolumu de 3 defa yazilmis. Orayida sadelestirelim
    //Filtreleme bolumu ayri oldugu icin WHERE kismini almayiz
    
    public static void method03(String className){
       String anaQuery =  'SELECT Name, AnnualRevenue FROM Account';
        
        //1.tekrarlayan query tirnak icine alinmali
        //2.tirnagin icinde tirnak kullanabilmek icin, ic tirnaklardan once ters slash kullanmaliyiz
        //3.anaQuery ile filtreleme(WHERE) arasinda 1 bosluk olmasi lazim
        //4.anaQuery'i concatination yapip atamayi yapalim 
        
        if(className.equals('Class1')){              
            anaQuery = anaQuery + ' WHERE Rating=\'Hot\' AND AnnualRevenue>1000';
                        
        }else if(className.equals('Class2')){            
            anaQuery = anaQuery + ' WHERE Rating=\'Warm\' AND AnnualRevenue>1000';
                
        }else{                
            anaQuery = anaQuery + ' WHERE Rating=NULL';
        }
        //Class'larda Query'lerde normalde String olmaz.[] ile kullanilir ama
        //Apex String query'leri kullanmamizi saglayan bir method olusturmus. Bunu da database'e yerlestrimis
        List<Account> result = Database.query(anaQuery);
        
        for(Account w : result){
            System.debug(w.Name + '-' + w.AnnualRevenue);
        }
        
    }
}