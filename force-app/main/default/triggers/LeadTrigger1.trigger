trigger LeadTrigger1 on Lead (before insert) {
 //ornek 1: Bir Lead (musteri adayi) kaydi olusturulmadan once Lead Rating'i 'Cold' olarak degistiriniz.
//yani yeni bir lead olusturdugumuzda Lead rating otomatik olarak cold olur.Öncesinde ister bos ister baska olsun farketmez her türlü cold diye kaydeder.
 
    System.debug('Hello Trigger');
    
    for(Lead w : Trigger.new){
        w.Rating = 'Cold';
    }
}