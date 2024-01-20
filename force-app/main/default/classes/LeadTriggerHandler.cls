public class LeadTriggerHandler {
    
    public static void beforeInsertHandler(List<Lead> leadList){ //disardan parametre alacak.leadList variable ismidir.
        //1-1)Yeni Lead kaydi yapmadan once (before insert) Lead Source bos ise "Other" olarak degistiren 
        for(Lead w : leadList){ //List yapisinda
                if(String.isBlank(w.LeadSource)){
                    w.LeadSource = 'Other';
                }
      //1-2) Industry bos ise hata veren,
                if(String.isBlank(w.Industry)){
                    w.Industry.addError('industry bos birakilamaz'); //Industry'i zorunlu bir field yaptik
                }           
            }
        }
    public static void beforeUpdateHandler(List<Lead> leadList, Map<Id, Lead> leadOldMap){
        //2-1) Lead kaydi guncellenirken (before update) Lead Source bos ise "Web" olarak guncelleyen
            for(Lead w : leadList){
                if(String.isBlank(w.LeadSource)){
                    w.LeadSource = 'Web';
                }
      //2-2) ve Lead ile baglantiya gecilmeden kapatilmaya calisildiginda hata veren trigger'i olusturunuz.
      			Lead oldLead = leadOldMap.get(w.Id);
                if(oldLead.Status == 'Open - Not Contacted' && (w.Status == 'Closed - Converted' || w.Status == 'Closed - Not Converted')){
                    w.Status.addError('Lead ile irtibata gecmeden Lead kaydi convert edilemez.');
                }
            }      
    	}
    }