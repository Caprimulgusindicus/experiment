/**
 * 
 */

package cn.edu.bistu.cs.crawler;
import us.codecraft.webmagic.Page;
import us.codecraft.webmagic.Request;
import us.codecraft.webmagic.Site;
import us.codecraft.webmagic.Spider;
import us.codecraft.webmagic.scheduler.FileCacheQueueScheduler;
//import us.codecraft.webmagic.scheduler.component;
import us.codecraft.webmagic.processor.PageProcessor;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.File;   
import java.io.FileOutputStream;   

import java.util.ArrayList;
import java.io.FileWriter;   
import java.io.IOException;   
import java.io.PrintWriter;   
import java.io.RandomAccessFile;   
/**
 * 国家地理每日一图（National Geographic Photo of the Day, NGPOD），
 * 页面处理程序，单页面处理模式
 * @author chenruoyu
 *
 */

public class NgpodPageProcessor2 implements PageProcessor {
	static int flag=0;
	static int fff=0;
	static int count=0;
	String ini="http://photography.nationalgeographic.com/photography/photo-of-the-day/";
    //部分一：抓取网站的相关配置，包括编码、抓取间隔、重试次数等
    private Site site = Site.me().setRetryTimes(3).setSleepTime(1000);
	public Site getSite() {
		return site;
	}
	/**
	 *  定制爬虫逻辑的核心方法，在这里编写抽取逻辑
	 */
	public void process(Page page) 
	{
		String a=page.getUrl().toString();//获取当前url地址
		fff=0;
		
		//去除起始页
		if(a.equals("http://photography.nationalgeographic.com/photography/photo-of-the-day/animals"))
		{
			
			for(String str: page.getHtml().xpath("//div[@id='search_results']").links().all())
			{
				page.addTargetRequest(new Request(str));
			}
			
		}
		//不是起始页
		else {
			//部分二：定义如何抽取页面信息，并保存下来
			//图片标题 //*[@id="caption"]/p[2]
			
			String title = page.getHtml().xpath("//div[@id='caption']/h2/text()").toString();
			page.putField("title", title);
			//作者信息
			String credit = page.getHtml().xpath("//div[@id='caption']/p[@class='credit']/allText()").toString();
			page.putField("credit", credit);
			//发布日期
			String pubTime = page.getHtml().xpath("//div[@id='caption']/p[@class='publication_time']/text()").toString();
			page.putField("pubTime", pubTime);
			//中文字描述
			String description=page.getHtml().xpath("//div[@id='caption']//p[3]/text()").toString();
			page.putField("description", description);
			//地址
			String address=page.getHtml().xpath("//div[@id='content_top']/div[2]/a/img/@src").toString();
			page.putField("address", address);
			
		/*/部分三：从页面发现后续的url地址来抓取
		for(String str: page.getHtml().xpath("//div[@class='nav']/p/a/@href").all())
		{
				    page.addTargetRequest(new Request(str));
			  		  
		}*/
	}
		
	System.out.println("\n");		
}
	
	public static void main(String[] args) {
		
		Spider.create(new NgpodPageProcessor2())
		//设置起始URL
        .addUrl("http://photography.nationalgeographic.com/photography/photo-of-the-day/animals")
        //设置爬虫线程数
        .thread(2)
        //启动爬虫
		//.setScheduler(new FileCacheQueueScheduler("/Users/chanvain/Documents/"))
        .run();
	}
}
