package cn.edu.bistu.cs.crawler;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;

import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.queryparser.classic.MultiFieldQueryParser;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.queryparser.classic.QueryParserBase;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopScoreDocCollector;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;

public class LuceneSearch_queryparser {
	private static IndexSearcher searcher = null; 
	private static Integer hitsPerPage=10; //输出最符合要求的十个页面
	private static QueryParser parser;
	public LuceneSearch_queryparser() throws IOException{
		if(searcher == null){
			Directory dir=FSDirectory.open(new File("/Users/chanvain/Documents/workspace/NGPODCollector/index"));//打开索引文件
			IndexReader reader=DirectoryReader.open(dir);
			System.out.println(reader.getDocCount("title")); //统计数量
			searcher = new IndexSearcher(reader); 
			String[] fields = {"title","description"};//定义要搜索的两个field
			parser = new MultiFieldQueryParser(fields, new StandardAnalyzer());//定义parser
			parser.setDefaultOperator(QueryParserBase.AND_OPERATOR); //定义两个field出现的情况，这里是都要出现
		}
	}
	
	public void doSearch(String queryStr) throws ParseException, IOException, org.apache.lucene.queryparser.classic.ParseException{

		Query query = parser.parse(queryStr); //按照parse方式进行查询
		TopScoreDocCollector collector = TopScoreDocCollector.create(hitsPerPage, true);
		searcher.search(query, collector);
		ScoreDoc[] hits = collector.topDocs().scoreDocs; //评分定义
		for(ScoreDoc doc:hits){
            Document d = searcher.doc(doc.doc);     
            //按照评分输出
            System.out.println("["+doc.doc+"]:"+d.get("title") + ",["+d.get("pubTime")+"]"+",["+d.get("description")+"]");   
            }
	}
	
	public static void main(String[] args) throws IOException, ParseException, org.apache.lucene.queryparser.classic.ParseException {
		LuceneSearch_queryparser search = new LuceneSearch_queryparser(); 
		search.doSearch("full tiger");//按照两个单词索引
	}
}