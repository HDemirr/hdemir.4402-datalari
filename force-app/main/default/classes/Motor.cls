public interface Motor {
    //i) Interface icindeki method'lar otomatik olarak 'public' dir. Bu yuzden interface'lerde method 
    //olustururken access modifier yazmayiz.
    
	//ii) Interface icindeki method'lar otomatik olarak 'abstract' dir. Bu yuzden interface'lerde abstract
	//method olustururken 'abstract' keyword'unu ve method body'sini yazmayiz.
    
    void eco();
    void turbo();
    void gas();
    
}