public class B94Recap {
    public static void createAccount (){
        List<Account> accList = new List<Account>();
        for(Integer i=1; i<160; i++){
            Account acc = new Account(Name = 'Test Account ' + i);
            accList.add(acc);
            
        }
        insert accList;
    }
    
    public static void updateAccount(){
        List<Account> accList = [SELECT Id, Name FROM Account WHERE Name LIKE 'Test Account%'];
        for(Account acc : accList){
            acc.Industry = 'Education';
            acc.Rating = 'Hot';  
        }
        update accList;
        System.debug('Toplam Account Sayısı :: ' + accList.size());
    }
    
}