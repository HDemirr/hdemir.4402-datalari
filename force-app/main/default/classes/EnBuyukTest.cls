@isTest
public class EnBuyukTest {
	@isTest
    public static void test1(){
        Integer result = EnBuyuk.maksimum(new List<Integer>{5,12,7,65,13,41});
        System.assertEquals(65, result);
    }
}