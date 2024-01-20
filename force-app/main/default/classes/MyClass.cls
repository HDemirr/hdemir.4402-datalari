public class MyClass {
    // rastgele bir harf üreten bir method  olusturunuz
    public static String rastgeleBirHarfVer() {
     String alfabe= 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
      // Mantık: Rastgele bir index bulup onu secmeliyim
     Integer maxIndex=alfabe.length()-1; //51
        // math.random( rastgele 0-1 arası (0 ve 1 dahil) sayılar verir
       
       Integer rastgeleIndex = Integer.valueOf(Math.random()*maxIndex); // 23,7
         // 0-51 arası sayılar üretir 
    
      return alfabe.substring(rastgeleIndex,rastgeleIndex+1);
           
           }


}