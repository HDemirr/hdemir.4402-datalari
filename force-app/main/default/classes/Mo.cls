public class Mo {
    
    public Integer add(Integer a, Integer b){
        return a+b;
        
    }
    public Integer add(Integer a, Integer b, Integer c){ //a) Parametre sayisini degistirebilirsiniz
        return a+b+c;
        
    }
    public Decimal add(Decimal a, Integer b){  //b) Parametre data tiplerini degistirebilirsiniz.
        return a+b;
        
    }
    public Decimal add(Integer a, Decimal b){ //c) Parametre data tipleri farkli ise parametrelerin yerlerini degistirebilirsiniz.
        return a+b;
    }
    //method overloading ayni class icinde yapilir.
}