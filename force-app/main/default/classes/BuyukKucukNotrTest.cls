@isTest
public class BuyukKucukNotrTest {
    
    @isTest
    static void testPozitif(){
        String buyuk = BuyukKucukNotr.display(5);
        system.assertEquals('Pozitif', buyuk);
        
        
    }
    @isTest
    static void testNotr(){
        String notr =BuyukKucukNotr.display(0);
        system.assertEquals('Notr', notr);
    }
     @isTest
    static void testNegatif(){
        String negatif = BuyukKucukNotr.display(-3);
        system.assertEquals('Negatif', negatif);
        system.assertEquals('Negativ', negatif);
        
            }
}