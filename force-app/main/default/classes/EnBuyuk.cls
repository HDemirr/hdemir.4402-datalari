public class EnBuyuk {
    
    public static Integer maksimum(List<Integer> myList){   // List<Integer> myList = new List<Integer>();
       
        Integer maks = myList.get(0); //ilk indextekini max kabul ettik.
        
        for(Integer i=0; i<myList.size(); i++){  //list'in size()'i kadar donecek
            if(myList.get(i)>maks){
                maks = myList.get(i);
            }
        }
        return maks;
    }
}