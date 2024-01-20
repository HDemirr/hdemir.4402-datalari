public class SoqlTR02 {
    
    //ornek 1: Account object'lerinin minimum, maksimum ve ortalama isci sayilarini veren method olusturunuz
    //Object olusturmamak icin method'umuzu static yapalim. Isci sayilarinin Field Name'i numberOfEmployees'dur
    //Aggregate function'lar ile olusturulan veriler genelde Array'in icine konulur.
    //AggregateResult bir data tipidir(String, Integer gibi). Aynisi yazilmalidir.
    
    public static void method01(){
       AggregateResult[] result = [SELECT MIN(numberOfEmployees), MAX(numberOfEmployees), AVG(numberOfEmployees) FROM Account];
       
        System.debug(result); //(AggregateResult:{expr0=120, expr1=145000, expr2=21996.81818181818})
        
        //Bu Array'in icinde tek bir Record var. 1 satir yani.
        //Record'daki her data'yi ayri ayri alalim
        
        System.debug('Minimum number of employees =' + result[0].get('expr0'));
        System.debug('Maximum number of employees =' + result[0].get('expr1'));
        System.debug('Avarege number of employees =' + result[0].get('expr2'));
    }
    //expr0, expr1, expr2 yerine daha manali aciklamalar yazalim

  public static void method02(){
        //Alias ==> Takma isim(nick name) kullanalim. Genel kullanim max ise max yazilmasidir.
        
           AggregateResult[] result = [SELECT MIN(numberOfEmployees) min, MAX(numberOfEmployees) max, AVG(numberOfEmployees) avg FROM Account];
    
        System.debug(result); //AggregateResult:{min=120, max=145000, avg=21996.81818181818})
        //SoqlTr02.method02(); ile calistiriniz
        //Bu Array'in icinde tek bir Record var. 1 satir yani.
        //Record'daki her data'yi ayri ayri alalim
        
        System.debug('Minimum number of employees =' + result[0].get('min'));
        System.debug('Maximum number of employees =' + result[0].get('max'));
        System.debug('Avarege number of employees =' + result[0].get('avg'));
        
    }
    //Array'in icinde coklu data olabilir. 
    //ornek 2: Account ortalama isci sayilarini Industry'lere gore veren method olusturunuz
    //1.yol: Tavsiye edilen
    
   public static void method03(){
        
        AggregateResult[] result = [SELECT Industry, AVG(numberOfEmployees) avgByIndustry FROM Account GROUP BY Industry];
        //avgByIndustry nick name'dir.
        System.debug(result); //SoqlTr02.method03(); ile calistir.
        
        for(AggregateResult w : result){
            System.debug('Industry:' + w.get('Industry') + '===> Avarege Number Of Employees :' + w.get('avgByIndustry'));
        }
    }
    
    //2.yol: Tavsiye edilmez
    //Query olusturup, result variable'ina yukledik.Onu da for each loop ta kullandik. Direkt for'un icinde de 
    //kullanabiliriz.Ama bu okunurlugu azaltir. Query loop'un icinde oldugu icin disinda kullanilamaz.
    //Buna scope denir(kapsam). Scope'u gerektigi kadar acmak lazimdir. 
    //Bir de her loop ta query tekrar tekrar calistirilir. Buna hit denir. Hit durumu database'i zorlar.
    
    public static void method04(){
        for(AggregateResult w : [SELECT Industry, AVG(numberOfEmployees) avgByIndustry FROM Account GROUP BY Industry]){
            System.debug('Industry:' + w.get('Industry') + '===> Avarege Number Of Employees :' + w.get('avgByIndustry'));
        }
        
    }
}