public class Students {
    
    private String name ='Ali Can';
    private Integer age= 13;
    private Boolean successful= true;
    
   // name ,age ve successfull data larını okunabilir yapın
    public String getName(){
        return this.name;
    } 
    public integer getAge(){
        return this.age;
    }
    public Boolean isSuccessful(){ //is soru anlamı katar mı/mi? gibi
        
       return this.successful; 
    }
    // name,age ve successfull datalarını degistirilebilir yapın
    // yeni data üretmeyen metodların return typleri 'void' (bos,gecersiz) olur
    // set method yeni method üretmez varolan datayı degistirir.
    public void setName(String name) {
        this.name = name;
    }
    public void setAge(integer age){
        this.age=age;
    }
    public void setSuccessful(Boolean successful){
        this.successful = successful;
    }

}