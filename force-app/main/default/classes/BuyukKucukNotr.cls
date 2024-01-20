public class BuyukKucukNotr {
    public static String display(Integer i) {
         if(i>0){
            System.debug('Pozitif');
            return 'Pozitif';
            
        }else if(i==0){
            System.debug('Notr');
            return 'Notr';
        }else{
            
            System.debug('Negatif');
            return 'Negatif';
        }
    }
}