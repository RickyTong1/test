import java.util.Scanner;

public class Test_1 {

	public static void main(String... strings) {

		Sqlist test = new Sqlist();
		Scanner scan = new Scanner(System.in);

		System.out.println("请输入数字，以任意字母结束；程序将去除重复数字并打印。");
		while (scan.hasNext()) {
			try {
				test.sqlist[test.length++] = scan.nextInt();
			} catch (Exception e) {
				test.length--;
				break;
			}
		}
		test.trimReptPro();//使用哈希表。
		/*
		 * 使用哈希表（n）比先排序（nlogn）后去重（n^2）效率更高。
		 * */
		
//		test.sort();//排序
//		test.trimRept();//去重
		
		test.show();
	}
}
