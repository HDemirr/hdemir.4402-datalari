public class SoqlTr05 {
    //Data Manipulation Languange (DML)’de insert’u ogrenmek icin class actik.
    //Bir Account object olusturunuz, onu database’e insert ediniz.
    //Insert edildigini hem developer console’dan hem de Admin parttan dogrulayiniz
   
    public static void method01(){
        //sadece 1 tane  insert yapalım.Accountta zorunlu alan Name'dir
        Account acc1 = new Account(Name='Test1',Phone ='123');
        acc1.Rating='Hot';//bu sekilde  de verigirilebilir
        Insert acc1;
        //Debug only de bir sey göremeyiz.Debug only i kapatıp onun yanındaki arama bölümüne DML YAZDIK
        //aDMİN PARTTA aCCOUNTA GİDİP İNSERT EDİLEN 'Test1' i gördük
        //Datadae.inser(acc1); ile Databese.insert(acc1,true) aynıdır.Yani kısmi basarıya müsaade etmez.Ya Hep Ya Hiç
        //Databese.insert(acc1,false); kısmi basarıya müsaade eder
       
        // coklu insert yapalım
        Account acc2 = new Account(Name='Test2');
        Account acc3 = new Account(Name='Test3');
        Account acc4 = new Account(Name='Test4');
        Account acc5 = new Account(Phone='234');
        
        List<Account> accList = new List<Account>{acc2,acc3,acc4,acc5};
        Database.insert(accList,false); // ya hep ya hic..acc5 in zorunlu olan alanı olan Name girilmezse toplu insert yapılamaz hata verir.
        // Database.insert(accList,false);  true ye false a cevirirsek kısm basarıya izin verir vE  calısır.TRUE OLSA HİC CALISMAZ
        // SoqlTr05.method01(); İLE CALISTIRILIR

    }
}