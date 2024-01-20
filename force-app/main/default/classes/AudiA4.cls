public class AudiA4  implements Motor,Klima,Fren {
    
    //interface'leri parent yapmak icin 'implements' keyword'u kullanilir
    //AudiA4 class'i motor interface'i icindeki tum method'lari override etmek zorundadir. Zorunda oldugundan
    //ust kisma 'override' yazmak gerekmez.
    //Class icinde access modifier yazilmazsa private kabul edildiginden mecbur public yazariz
    
    //motor interface'inden override edilenler
    
     public void eco(){
        System.debug('Audi A4 ekonomik motor kullanir.');
     }
     public void turbo(){
        System.debug('Audi A4 turbo motor kullanir.');
     }
    public void gas(){
        System.debug('Audi A4 sadece benzinli motor kullanir.');
    }
	//klima interface'inden override edilenler
    public void analog(){
        System.debug('Audi A4 analog klima kullanir');
    }
    public void dijital(){
        System.debug('Audi A4 dijital klima kullanir');
    }
    //fren interface'inden override edilenler
    public void abs(){
        System.debug('Audi A4 abs fren sistemi kullanir');
    }
    public void esp(){
        System.debug('Audi A4 esp fren sistemi kullanir');
    }
	
}