trigger AccountsTrigger on Account (before insert) {
    
    if(Trigger.isBefore && Trigger.isInsert){
        
        for(Account w : Trigger.new){
            if(w.Name == 'TechProEducation'){
                w.Name.addError('Account ismi olarak TechProEducation kullanamazsiniz ');
                    }else{
                        w.Industry = 'Agriculture';
                    }
        }
    }
}