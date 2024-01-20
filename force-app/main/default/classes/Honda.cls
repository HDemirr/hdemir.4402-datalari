public abstract class Honda {
    
     //Defining type for abstract methods must be declared as abstract
    //Abstract methodlar ancak abstract class'larin icinde olabilir.
    //public ile class arasina abstract yazilir.
    
    public void music(){
        system.debug('Pro');
    }
    
    public abstract void engine(); // Mehod must have a body
                         // hatayı gidermek icin public ile void arasına abstract yazıllır

}