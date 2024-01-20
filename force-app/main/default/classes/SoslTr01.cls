public class SoslTr01 {

    //ornek 4:Name field’inde ‘United’ gecen Account, Contact object’lerinin, Account Name’lerini
    //Contact FirstName ve LastName’lerini bulunuz. Bu kodu class’da yaziniz.

    public static void method01(){
    //Yine query'i [] icinde yazacagiz
     //Arama kelimesini de '' icinde yazacagiz
        
   list<List<sObject>> result = [FIND 'United' IN NAME FIELDS RETURNING Account (Name),Contact(FirstName,LastName)];
    system.debug(result);//Neden sObject yazdim? cunku Account ve Contact Salesforce Object’tir(sObject)
        //Listin icine List yazdim cunku Account’tan ayri bir list, Contact’tan ayri bir List gelecek.
        //SoslTr01.method01(); ile calistir.
    }
}