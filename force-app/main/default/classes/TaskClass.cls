public class TaskClass {
    
    //Disardan opp parametresi alacak ve her opp icin bir task olusturacak.
    
    public static void createTaskForOpp(List<Opportunity> oppList){ //ornegin 5 tane opp geldi
        
        List<Task> taskList = new List<Task>();
        
        for(Opportunity opp : oppList){
            Task newTask = new Task();
            newTask.Subject = opp.Name + ' Opportunity kontrolu gerekiyor';
            newTask.WhatId = opp.Id; //iliskili diger object'i tanimladik
            newTask.OwnerId = opp.OwnerId; //task'i yapacak kisiyi belirledik.
            taskList.add(newTask);
        }
        if(taskList.size()>0){ //ekstra kontrol iyidir
            insert taskList;
        }       
    }
}