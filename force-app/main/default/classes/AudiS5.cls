public class AudiS5 implements Motor, Klima, Fren {
      //motor interface'inden override edilenler
    public void eco(){
        System.debug('Audi S5 ekonomik motor kullanir');
    }
    public void turbo(){
        System.debug('Audi S5 turbo motor kullanir');
    }
    public void gas(){
        System.debug('Audi S5 sadece benzinli motor kullanir');
    }
    //klima interface'inden override edilenler
    public void analog(){
        System.debug('Audi S5 analog klima kullanir');
    }
    public void dijital(){
        System.debug('Audi S5 digital klima kullanir');
    }
    //fren interface'inden override edilenler
    public void abs(){
        System.debug('Audi S5 abs fren sistemi kullanir');
    }
    public void esp(){
        System.debug('Audi S5 esp fren sistemi kullanir');
    }
}