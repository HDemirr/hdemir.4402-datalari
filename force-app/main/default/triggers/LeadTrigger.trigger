trigger LeadTrigger on Lead (before insert, before update) { 
    
    //ornek 19: 1-1)Yeni Lead kaydi yapmadan once (before insert) Lead Source bos ise "Other" olarak degistiren ve
    //1-2) Industry bos ise hata veren, 
    //2-1) Lead kaydi guncellenirken (before update) Lead Source bos ise "Web" olarak guncelleyen
    //2-2) ve Lead ile baglantiya gecilmeden kapatilmaya calisildiginda hata veren trigger'i olusturunuz. (Bu soruyu best practice olarak da cozunuz)

    //1-1)Yeni Lead kaydi yapmadan once (before insert) Lead Source bos ise "Other" olarak degistiren 
    switch on Trigger.operationType{
        when BEFORE_INSERT{
            for(Lead w : Trigger.new){ //List yapisinda
                if(String.isBlank(w.LeadSource)){
                    w.LeadSource = 'Other';
                }
     //1-2) Industry bos ise hata veren,
                if(String.isBlank(w.Industry)){
                    w.Industry.addError('industry bos birakilamaz'); //Industry'i zorunlu bir field yaptik
                }           
            }
        }
        when BEFORE_UPDATE{
     //2-1) Lead kaydi guncellenirken (before update) Lead Source bos ise "Web" olarak guncelleyen
            for(Lead w : Trigger.new){
                if(String.isBlank(w.LeadSource)){
                    w.LeadSource = 'Web';
                }
      //2-2) ve Lead ile baglantiya gecilmeden kapatilmaya calisildiginda hata veren trigger'i olusturunuz.
                Lead oldLead =Trigger.oldMap.get(w.Id);
                if(oldLead.Status == 'Open - Not Contacted' && (w.Status == 'Closed - Converted' || w.Status == 'Closed - Not Converted')){
                    w.Status.addError('Lead ile irtibata gecmeden Lead kaydi convert edilemez.');
                }
            }      
        }       
    }
}