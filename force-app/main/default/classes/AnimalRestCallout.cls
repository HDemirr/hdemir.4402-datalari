//Dis sistemden data cekmek
//ornek 1: Endpoint olarak (yanı bu sıteden data cekecegız) https://th-apex-http-callout.herokuapp.com/animals sitesini kullanarak veri cekiniz.
//1.yol:
public class AnimalRestCallout {
    
    public static void getAnimals(){
        //Postman'deki 1-new >> 2-HttpRequest >> 3-rest method >> 4-link >> 5-send
        Http http = new Http(); //1http ve alttakı request varıable dır.Yanı ıstedıgımız ısmı verebılırız
        HttpRequest request = new HttpRequest(); //2
        request.setMethod('GET'); //3 get ,post delete put patch metod adıdır ve büyük yazılır
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals'); //4
        HttpResponse response = http.send(request); //5
        
        if(response.getStatusCode() == 200){ //islem basarili
            
            //gelen data'yi parse (ayristirma) etmeliyiz. Bunun icin iki yontem var.
            //1.yol: Parse islemi request'i yapan class icerisinde yapilir.
            Map<String, Object> results = (Map<String, Object>)  JSON.deserializeUntyped(response.getBody());
            List<Object> animals = (List<Object>) results.get('animals');
            
            //2.yol: Bu yol kullanildiginda deserialize islemi icin ayri bir class olusturulur.JSON formatina uygun class
			//https://json2apex.herokuapp.com sitesinden olusturulabilir.Bu site JSON olarak verilen data icin uygun class 
			//yapisini otomatik olusturmaktadir.
			
            //Diger class'imizdan bir object olusturacagiz.
           // RestAnimalParse rap = RestAnimalParse.parse(response.getBody());
            
           for(Object w :animals){
              System.debug(w);
            }
        }
    }
}
//AnimalRestCallout.getAnimals(); ile calistir.