trigger LeadTrigger2 on Lead (before insert) {
    //ornek 2: Yeni bir Lead kaydi eklemeden once, Lead Source'u kontrol edin. Eger bossa onu 'Other' olarak degistirin,
    //aksi halde degistirmeyin.
    
    for(Lead w : Trigger.new){
        
        if(String.isBlank(w.LeadSource)){ //  if(w.LeadSource == null)
            w.LeadSource = 'Other'; //None birakilirsa 'Other' yapar. Diger durumlarda calismaz.
        }
    }
}