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

public class LuceneSearch {
	private static IndexSearcher searcher = null; 
	private static QueryParser parser = null; 
	private static Integer hitsPerPage=10;
	public LuceneSearch() throws IOException{
		if(searcher == null){
			Analyzer analyzer=new StandardAnalyzer();
			Directory dir=FSDirectory.open(new File("/Users/chanvain/Documents/workspace/NGPODCollector/index"));//加载索引文件
			IndexReader reader=DirectoryReader.open(dir);
			System.out.println(reader.getDocCount("title"));  //数文件数
			searcher = new IndexSearcher(reader);  //初始化搜索器？
			parser = new QueryParser("title", analyzer);
		}
	}
	public void doSearch(String queryStr) throws ParseException, IOException, org.apache.lucene.queryparser.classic.ParseException{
		Query query = parser.parse(queryStr);
		TopScoreDocCollector collector = TopScoreDocCollector.create(hitsPerPage, true);
		searcher.search(query, collector); 
		ScoreDoc[] hits = collector.topDocs().scoreDocs; //对文档进行评分
		for(ScoreDoc doc:hits){
            Document d = searcher.doc(doc.doc);     //搜索
            System.out.println("["+doc.doc+"]:"+d.get("title") + ",["+d.get("pubTime")+"]");   //定义输出格式
            }
	}
	public static void main(String[] args) throws IOException, ParseException, org.apache.lucene.queryparser.classic.ParseException {
		LuceneSearch search = new LuceneSearch();  //定义搜索类型
		search.doSearch("night"); //关键字
	}
}