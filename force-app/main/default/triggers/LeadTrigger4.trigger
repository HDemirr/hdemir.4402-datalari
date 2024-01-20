trigger LeadTrigger4 on Lead (before update) {
    //ornek 4: Bir Lead kaydi guncellenmeden once, Industry bossa veya Industry'si 'Tecnology' veya 'Finance' ise, 
    //Rating'i 'Cold' dan 'Hot'a guncelleyiniz. 
    
    for(Lead w : Trigger.new){
        if((String.isBlank(w.Industry) || w.Industry == 'Finance' || w.Industry == 'Technology') && w.Rating == 'Cold'){
            w.Rating = 'Hot';
        }
    }
}