public class MDE {
    
//--------------------------------------------------------------------senkron    
    public static  void test (){
        Account acc = new Account (Name = 'Deneme');
        insert acc; //1.DML islemi
        MDE.assignPS('izin','hdemir.4402@gmail.com');
    }  
        //1- Permission islemini baska bir method icine alalim 
   //------------------------------------------------------------------------asenkron     
         @future
        public static void assignPS(String psName, String uName){
            
       PermissionSet ps = [SELECT Id FROM PermissionSet WHERE Name= :psName];
        User u = [SELECT Id FROM User WHERE userName= :uName];
        
        //Atamayi yapalim. PermissionSetAssignmentbaska bir object'tir ve AssigneeId ve PermissionSetId ile atama yapilir
        
        PermissionSetAssignment psa = new PermissionSetAssignment(AssigneeId=u.Id, PermissionSetId=ps.Id);
        insert psa;
    
    }
}