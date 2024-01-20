public class SoslTr02 {

     //ornek 5: Account Name’i ‘Un’ ile baslayan Account Object’lerinin, Account Name’lerini,
    //Contact FirstName ve LastName’lerini bulunuz. Bu kodu class’ta yaziniz.


    public static void method01(){
    List<List<sObject>> result = [FIND 'Un*' IN NAME FIELDS RETURNING Account (Name),Contact(FirstName,LastName)];
    system.debug(result); 
     //Un* ==> Un ile baslasin, devami ne olursa olsun. 
    }
     
     }