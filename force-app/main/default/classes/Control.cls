public class Control {
    
    public static String userControl(String userName, Integer password){
        
        String userMessage = ''; //disarda tanimladim ki, else if'lerin hepsinde kullanayim
        
        if(userName == 'serkan35' && password == 12345){
            userMessage = 'Giris basarili...';
            
            //yanlis ihtimalleri de yazalim
        }else if(userName == 'serkan35' && password != 12345 ){
            userMessage = 'Giris basarisiz cunku password yanlis';
            
        }else if(userName != 'serkan35' && password == 12345){
            userMessage = 'Giris basarisiz cunku userName yanlis';
            
        }else{
            userMessage = 'Giris basarisiz cunku userName ve password yanlis...';
        }
        return userMessage;
    }
}