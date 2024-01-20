public  class Civic extends Honda {
    
    //Class Civic must implement the abstract method: void Honda.engine()
	//child class abstract class(Honda)daki abstract method'u override ederek kullanmali
    
     Override
         public void engine(){ 
     //override edilen method'un uzerine override yazilir ve normal bir method'a 
	//dondugu icin abstract kelimesi silinir.Normal method'a dondugu icin body eklenir.
     system.debug('Gas 1.6 Eco'); 
    }
   
}