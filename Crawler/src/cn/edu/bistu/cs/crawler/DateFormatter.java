/**
 * 
 */
package cn.edu.bistu.cs.crawler;
import java.util.Hashtable;
/**
 * 日期类型的格式转换函数
 * @author chenruoyu
 *
 */
public class DateFormatter{

	private static Hashtable<String,String> monthTable = new Hashtable<String, String>();
	static{
		monthTable.put("DECEMBER", "12");
		monthTable.put("NOVEMBER", "11");
		monthTable.put("OCTOBER", "10");
		monthTable.put("SEPTEMBER", "09");
		monthTable.put("AUGUST", "08");
		monthTable.put("JULY", "07");
		monthTable.put("JUNE", "06");
		monthTable.put("MAY", "05");
		monthTable.put("APRIL", "04");
		monthTable.put("MARCH", "03");
		monthTable.put("FEBRUARY", "02");
		monthTable.put("JANUARY", "01");
	}

	/**
	 * 输入的日期格式为MAY 6, 2009
	 * 输出的日期格式为YYYY-MM-DD
	 */
	public String format(String raw) throws Exception {
		if(raw==null||"".equals(raw.trim())){
			return "";
		}
		String str[]=raw.trim().split(",");
		String year = str[1].trim();
		str=str[0].split(" ");
		String month = monthTable.get(str[0].toUpperCase());
		String day=Integer.parseInt(str[1])<10?"0"+str[1]:str[1];
		return year+month+day;
	}
}
