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
import org.apache.lucene.search.BooleanClause;
import org.apache.lucene.search.BooleanQuery;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopScoreDocCollector;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;

public class LuceneSearch_boolean {
	private static IndexSearcher searcher = null; 
	private static QueryParser parser1 = null; 
	private static QueryParser parser2 = null; 
	private static Integer hitsPerPage=10;
	public LuceneSearch_boolean() throws IOException{
		if(searcher == null){
			Analyzer analyzer=new StandardAnalyzer();
			Directory dir=FSDirectory.open(new File("/Users/chanvain/Documents/workspace/NGPODCollector/index"));//打开索引文件
			IndexReader reader=DirectoryReader.open(dir);
			searcher = new IndexSearcher(reader); 
			//添加两个field到分析器中
			parser1 = new QueryParser("title", analyzer);
			parser2 = new QueryParser("description", analyzer);
		}
	}
	

	public void doSearch(String queryStr1,String queryStr2) throws ParseException, IOException, org.apache.lucene.queryparser.classic.ParseException{
		BooleanQuery query = new BooleanQuery();
		Query query1 = parser1.parse(queryStr1); //定义两个查询
		Query query2 = parser2.parse(queryStr2);
		BooleanClause.Occur occur=BooleanClause.Occur.MUST;//定义判定出现类型，有四种类型：must filter should must—not
		query.add(query1,occur);
		query.add(query2,occur);
		TopScoreDocCollector collector = TopScoreDocCollector.create(hitsPerPage, true); 
		searcher.search(query, collector);
		ScoreDoc[] hits = collector.topDocs().scoreDocs;
		for(ScoreDoc doc:hits){
            Document d = searcher.doc(doc.doc);     
            //按照评分输出如下格式
            System.out.println("["+doc.doc+"]:"+d.get("title") + ",["+d.get("pubTime")+"]"+",["+d.get("description")+"]");   
            }
	}
	
	public static void main(String[] args) throws IOException, ParseException, org.apache.lucene.queryparser.classic.ParseException {
		LuceneSearch_boolean search = new LuceneSearch_boolean(); 
		search.doSearch("full","tiger");//按照两个关键词索引
	}
}