trigger LeadTrigger5 on Lead (before insert, before update) {
    //ornek 5: Yeni bir Lead kayit edildiginde veya mevcut bir kayit guncellendiginde, 
    //eger 'Industry' field'i bos ise
    //hata mesaji veren bir trigger olusturunuz.
    
    for(Lead leadRecord : Trigger.new){
        
        if(String.isBlank(leadRecord.Industry)){
            leadRecord.Industry.addError('Industry fieldi bos olamaz'); 
            //leadRecord.addError('Industry fieldi bos olamaz');
        }
    }
}