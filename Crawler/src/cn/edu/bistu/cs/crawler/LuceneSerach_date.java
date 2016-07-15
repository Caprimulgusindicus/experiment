package cn.edu.bistu.cs.crawler;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;

import org.apache.lucene.document.Document;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.NumericRangeQuery;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopScoreDocCollector;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;

public class LuceneSerach_date {
	private static IndexSearcher searcher = null; 
	private static Integer hitsPerPage=9;
	public LuceneSerach_date() throws IOException{
		if(searcher == null){
			Directory dir=FSDirectory.open(new File("/Users/chanvain/Documents/workspace/NGPODCollector/index"));//加载索引文件
			IndexReader reader=DirectoryReader.open(dir);
			System.out.println(reader.getDocCount("pubTime")); //对文件总数计数
			searcher = new IndexSearcher(reader); 
		}
	}
	public void doSearch(Integer queryInt) throws ParseException, IOException, org.apache.lucene.queryparser.classic.ParseException{
		Query query = NumericRangeQuery.newIntRange("pubTime", queryInt, queryInt+8, true, true);//定义开始和结束时间
		TopScoreDocCollector collector = TopScoreDocCollector.create(hitsPerPage, true);//开始搜索
		searcher.search(query, collector);
		ScoreDoc[] hits = collector.topDocs().scoreDocs;
		for(ScoreDoc doc:hits){
            Document d = searcher.doc(doc.doc);     
            System.out.println("["+doc.doc+"]:"+d.get("pubTime") + ",["+d.get("title")+"]");   //按照格式输出
            }
	}
	public static void main(String[] args) throws IOException, ParseException, org.apache.lucene.queryparser.classic.ParseException {
		LuceneSerach_date search = new LuceneSerach_date();//定义搜索类型 
		search.doSearch(20160501);//添加开始日期
	}
}
