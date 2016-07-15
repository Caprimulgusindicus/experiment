package cn.edu.bistu.cs.crawler;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopScoreDocCollector;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;

public class LuceneSearch_repetition {
	private static IndexSearcher searcher = null; 
	private static IndexSearcher searcher2 = null; 
	private static QueryParser parser = null; 
	private static QueryParser parser2 = null; 

	private static Integer hitsPerPage=10;
	public LuceneSearch_repetition() throws IOException{
		if(searcher == null){
			Analyzer analyzer=new StandardAnalyzer();
			Directory dir=FSDirectory.open(new File("/Users/chanvain/Documents/workspace/NGPODCollector/index"));//加载索引文件
			IndexReader reader=DirectoryReader.open(dir);
			System.out.println(reader.getDocCount("title"));  //数文件数
	
			searcher = new IndexSearcher(reader);  //初始化搜索器
			parser = new QueryParser("vis", analyzer);//将vis的field作为搜索需要分析的地方
			parser2=new QueryParser("title",analyzer);//将title作为第二个搜索需要分析的地方
		}
	}
	//第二重搜索，搜索重复出现的页面
	public void doSearch2(String queryStr) throws ParseException, IOException, org.apache.lucene.queryparser.classic.ParseException{
		Query query2 = parser2.parse(queryStr);
		TopScoreDocCollector collector = TopScoreDocCollector.create(hitsPerPage, true);
		searcher.search(query2, collector); 
		ScoreDoc[] hits = collector.topDocs().scoreDocs; //对文档进行评分
		for(ScoreDoc doc:hits){
            Document d = searcher.doc(doc.doc);     //搜索
            System.out.println("["+doc.doc+"]:"+d.get("title") + ",["+d.get("pubTime")+"]");   //定义输出格式
            }
	}
	//第一重搜索，搜索带有标记的文件，找出重复出现的标题
	public void doSearch(String queryStr) throws ParseException, IOException, org.apache.lucene.queryparser.classic.ParseException{
		Query query = parser.parse(queryStr);
		TopScoreDocCollector collector = TopScoreDocCollector.create(hitsPerPage, true);
		searcher.search(query, collector); 
		ScoreDoc[] hits = collector.topDocs().scoreDocs; //对文档进行评分
		for(ScoreDoc doc:hits){
            Document d = searcher.doc(doc.doc);     //搜索
            doSearch2(d.get("title"));//把搜索到的文章的title再次作为搜索类型
            //这次搜索不输出
            //System.out.println("["+doc.doc+"]:"+d.get("title") + ",["+d.get("pubTime")+"]");   //定义输出格式
            }
	}
	public static void main(String[] args) throws IOException, ParseException, org.apache.lucene.queryparser.classic.ParseException {
		LuceneSearch_repetition search = new LuceneSearch_repetition();  //定义搜索类型
		search.doSearch("1"); //关键字
	}
}