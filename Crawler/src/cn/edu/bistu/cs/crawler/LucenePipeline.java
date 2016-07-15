package cn.edu.bistu.cs.crawler;
/**
 * 
 */


import java.io.File;
import java.io.IOException;
import java.util.HashMap;

import org.apache.log4j.Logger;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field.Store;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;

import us.codecraft.webmagic.ResultItems;
import us.codecraft.webmagic.Task;
import us.codecraft.webmagic.pipeline.Pipeline;
import org.apache.lucene.document.IntField;
import org.apache.lucene.document.StringField;

/**
 * 将抓取的内容持久化到Lucene索引中的PipeLine实现
 * 
 * @author chenruoyu
 *
 */

public class LucenePipeline implements Pipeline {
	Logger log = Logger.getLogger(LucenePipeline.class);
	private IndexWriter writer = null;
	private static final String indexDir = "/Users/chanvain/Documents/workspace/NGPODCollector/index";

	public LucenePipeline() throws IOException {
		StandardAnalyzer analyzer = new StandardAnalyzer();
		File dir = new File(indexDir);
		Directory index = FSDirectory.open(dir);
		IndexWriterConfig config = new IndexWriterConfig(Version.LATEST,
				analyzer);
		writer = new IndexWriter(index, config);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * us.codecraft.webmagic.pipeline.Pipeline#process(us.codecraft.webmagic
	 * .ResultItems, us.codecraft.webmagic.Task)
	 */
	@Override
	public void process(ResultItems results, Task task) {
		Document doc = new Document();
		
		//用日期当作pageid
		String date=results.get("pubTime");
		DateFormatter trans=new DateFormatter();
		try {
			date=trans.format(date);
		} 
		catch (Exception e1) 
		{
			e1.printStackTrace();
		}
		
		//将日期转换为int型，用作pageid判断
		int datei=Integer.parseInt(date);
		if(doc.getField("datei")!=null)
			return;
		HashMap<String, String> map = new HashMap<>();
		for(String key :map.keySet()){
			System.out.println(key+":"+map.get(key));
		}
		//给当前页面打个标记
		String vv="1";
		if(doc.getField("title")!=null)//如果当前页面已经存在（除了页面id别的都一样），
			doc.add(new TextField("vis",vv,Store.YES));
		else doc.add(new TextField("vis","0",Store.YES));//如果当前页面不存在
		
		//添加索引
		doc.add(new TextField("title", results.get("title").toString(), Store.YES));
		
		//文字描述索引
		doc.add(new TextField("description",results.get("description").toString(),Store.YES));
		//摄影师索引
		doc.add(new StringField("credit",results.get("credit").toString(),Store.YES));
		//日期索引
		doc.add(new IntField("pubTime",datei,Store.YES));
		
		try {
			writer.addDocument(doc);
			writer.commit();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
