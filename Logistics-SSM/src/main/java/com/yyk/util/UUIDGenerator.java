package com.yyk.util;

import java.util.UUID;

/**
 * <P>Description: 生成UUID业务?</P>
 * @ClassName: UUIDGenerator
 * @author YYK   2012-1-13 下午02:24:24
 * @see
 */
public class UUIDGenerator {
	/**
	 * <p>Title: createKey</p>
	 * <p>Description: 生成UUID公用业务方法</p>
	 * @return
	 * @author YYK   2012-1-13 下午02:25:11
	 */
	public static String createKey() {
		return UUID.randomUUID().toString();
	}

	/**
	 * 
	 * <p>Title: create32Key</p>
	 * <p>Description: 创建32位的UUID</p>
	 * @return
	 * @author YYK?  2012-1-16 下午03:29:32
	 */
	public static String create32Key() {
		//return UUID.randomUUID().toString().replaceAll("\\-", "");
		return UUID.randomUUID().toString().replace("-", "");
	}
	
	/**
	  * 创建指定数量的随机字符串
	  * @param length
	  * @return
	  */
	public static int createRandom(int length) {
		String retStr = "";
		String strTableFirst = "123456789";
		String strTable = "1234567890";

		for (int i = 0; i < length; i++) {
			if (i == 0) {
				double dblR = Math.random() * 9;
				int intR = (int) Math.floor(dblR);
				retStr += strTableFirst.charAt(intR);
			} else {
				double dblR = Math.random() * 10;
				int intR = (int) Math.floor(dblR);
				retStr += strTable.charAt(intR);
			}
		}
		return Integer.parseInt(retStr);
	}
}
