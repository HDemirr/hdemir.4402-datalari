trigger LeadTrigger6 on Lead (before delete) {
    
    //ornek 6: Bir Lead kaydinda Industry 'Education' ise, 
    //bir kullanicinin bu kaydi silmesini onleyen trigger'i yaziniz. 

    if(Trigger.isBefore && Trigger.isDelete){
        
        for(Lead w : Trigger.old){ //delete isleminde yeni hal yoktur, eski hal vardir.
            if(w.Industry == 'Education'){
                w.Industry.addError('Sektor egitimse kaydin silinmesi imkansizdir');
            }
        }        
    }
}