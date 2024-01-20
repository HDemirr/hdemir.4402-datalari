public class ContactRestCallout {
    
    public static void getContacts(){
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://jsonplaceholder.typicode.com/users/1');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        
        if(response.getStatusCode()==200){
            
            //Diger class'imizdan bir instance olusturacagiz
            RestContactParse myContact = RestContactParse.parse(response.getBody());
            //response.getBody() icinde String formatinda JSON yapisi vardir. Yanı JSON formatını strıng hale getırır
            
            System.debug(myContact.name);
            System.debug(myContact.email);
            System.debug(myContact.Company.name); //diger class'imizdan verileri cektik
            
            //Karsi sistemden gelen bu data ile Salesforce'da bir contact olusturalim
            Contact cont = new Contact();
            cont.LastName = myContact.name; 
            cont.Email = myContact.email;
            insert cont;
            
        }
    }
}