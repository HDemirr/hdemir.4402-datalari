trigger LeadTrigger3 on Lead (before insert, before update) {
    //ornek 3: Yeni bir Lead kaydi olusturuldugunda(insert) veya mevcut bir kayit guncellendiginde (update), 
    //eger Industry field'i bos ise Industry field'ini 'Education' olarak guncelleyen trigger'i olusturunuz.
    
    for(Lead w : Trigger.new){
        if(String.isBlank(w.Industry)){ //Dikkat: Sadece Industry bos ise calisir.
            w.Industry = 'Education'; 
            System.debug(Trigger.operationType); //BEFORE_UPDATE tetikledi.  operationType ile neyi tetikledigini görebiliriz!!              
        }
    }
}