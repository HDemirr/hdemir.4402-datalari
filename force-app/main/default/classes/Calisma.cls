public class Calisma {
       private String name = 'Ali Can';
       private integer age = 13;
       private Boolean successful = true;
       // name ,age ve successfull datalarını okunabilir yapın
    public String getName(){ // name camelcase yçntemi icin Name olarak yazıldı
        return this.name;
    } 
    public integer getAge(){
        return this.age;
    }
    public Boolean isSuccessful(){
        return this.successful;
    }
    // name,age ve successful datalarını degistirilebilir yapın
    // yeni data uretmeyen methodların return type ları 'void' olur
    // set method yenidata üretmez var olan datayı degistirir 
    public void setName(String name) {
        this.name= name; 
       }
    public void setAge(integer age){
        this.age=age;
    }
    public void setSuccessful(Boolean successful){
        this.successful=successful;
    }

}