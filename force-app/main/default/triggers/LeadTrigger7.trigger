trigger LeadTrigger7 on Lead (before insert, before update) {
    
    //ornek 7: Yeni bir Lead kayit edildiginde 'Industry' bossa 'Education' a guncelleyen veya mevcut bir kayit
    //guncellendiginde eger 'Industry' bos ise 'Banking' e guncelleyen bir trigger olusturunuz.

    //insert ve update'te ayri ayri iki is yapilacagi icin ayirmak gerekir.
    
    //Yeni bir Lead kayit edildiginde 'Industry' bossa 'Education' a guncelleyen 
    if(Trigger.isBefore && Trigger.isInsert){
        for(Lead w : Trigger.new){
            if(String.isBlank(w.Industry)){
                w.Industry = 'Education';
            }
        }
    }
    //guncellendiginde eger 'Industry' bos ise 'Banking' e guncelleyen bir trigger olusturunuz.
    if(Trigger.isBefore && Trigger.isUpdate){
        for(Lead w : Trigger.new){
            if(String.isBlank(w.Industry)){
                w.Industry = 'Banking';
            }
        }
    }   
}