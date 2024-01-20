@isTest
public class AccountsTriggerTest {
    
	@isTest //if bolumu testi
    static void test1(){
        Account acc = new Account(Name = 'TechProEducation');
        
        try{
            insert acc; //hatayi baslatan durum buraya yazilir.
        }catch(Exception e){
            System.assert(e.getMessage().contains('Account ismi olarak TechProEducation kullanamazsiniz'));
        }
    }
	@isTest //else bolumu testi
    static void test2(){
    	Account acc = new Account(Name = 'Sony');
     	insert acc; //memory' de Sony isimli bir Account olusmaz.
     	//System.assertEquals('Agriculture', acc.Industry);
        //System.AssertException: Assertion Failed: Expected: Agriculture, Actual: null hatasi alinir
        acc = [SELECT Industry FROM Account WHERE Id = :acc.Id]; //gecici olarak olusan acc'nin Industry degerini sorguladik
        System.assertEquals('Agriculture', acc.Industry);
    }    
}