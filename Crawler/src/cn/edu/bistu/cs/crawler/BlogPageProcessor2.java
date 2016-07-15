/**
 * 
 */
package cn.edu.bistu.cs.crawler;

import us.codecraft.webmagic.Page;
import us.codecraft.webmagic.Request;
import us.codecraft.webmagic.Site;
import us.codecraft.webmagic.Spider;
import us.codecraft.webmagic.processor.PageProcessor;

/**
 * @author chenruoyu
 *
 */
public class BlogPageProcessor2 implements PageProcessor{

	//1926267847
    public static final String URL_LIST = "http://blog\\.sina\\.com\\.cn/s/articlelist_1926267847_0_\\d+\\.html";

    public static final String URL_POST = "http://blog\\.sina\\.com\\.cn/s/blog_\\w+\\.html";

    private Site site = Site
            .me()
            .setDomain("blog.sina.com.cn")
            .setSleepTime(3000);

    @Override
    public void process(Page page) {
        //列表页
    	if(page.getUrl().toString().startsWith("http://blog.sina.com.cn/s/articlelist")){
    		
    	}else if(page.getUrl().toString().startsWith("http://blog.sina.com.cn/s/blog")){
    		
    	}
        if (page.getUrl().regex(URL_LIST).match()) {
            page.addTargetRequests(page.getHtml().xpath("//div[@class=\"articleList\"]").links().regex(URL_POST).all());
            page.addTargetRequests(page.getHtml().links().regex(URL_LIST).all());
            //文章页
        } else {
            page.putField("title", page.getHtml().xpath("//div[@class='articalTitle']/h2/tidyText()").toString().trim());
            page.putField("date",
            page.getHtml().xpath("//div[@id='articlebody']//span[@class='time SG_txtc']").regex("\\((.*)\\)"));
            //博文正文全文
            String passage=page.getHtml().xpath("//div[@id='sina_keyword_ad_area2']/allText()").toString();
            page.putField("passage", passage);
            //博文标签 //*[@id='sina_keyword_ad_area']/table/tbody/tr/td[1]/h3/a
            String tag=page.getHtml().xpath("//div[@id='sina_keyword_ad_area']/table/tbody/tr/td[1]/h3/a/text()").toString().trim();
            page.putField("tag", tag);
            System.out.println("\n");
        }
    }

    @Override
    public Site getSite() {
        return site;
    }
//1926267847
    public static void main(String[] args) {
        Spider.create(new BlogPageProcessor2()).addUrl("http://blog.sina.com.cn/s/articlelist_1926267847_0_1.html")
                .run();
    }

}

////*[@id="page_head"]/h1
////*[@id="page_head"]/h1.text()