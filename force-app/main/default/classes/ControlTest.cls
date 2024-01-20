@isTest
public class ControlTest {
    
    @isTest
    public static void status1(){
       String result = Control.userControl('serkan35', 12345); //dogru
       System.assertEquals('Giris basarili...', result);
    }
    @isTest
    public static void status2(){
       String result = Control.userControl('serkan35', 123); //sifre yanlis
       System.assertEquals('Giris basarisiz cunku password yanlis', result);
    }
    @isTest
    public static void status3(){
       String result = Control.userControl('serkan', 12345); //user yanlis
       System.assertEquals('Giris basarisiz cunku userName yanlis', result);
    }
    @isTest
    public static void status4(){
       String result = Control.userControl('serkan', 1234); //ikiside yanlis
       System.assertEquals('Giris basarisiz cunku userName ve password yanlis...', result);
    }
}