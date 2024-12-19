package com.ozai.dao;

import java.sql.SQLException;
import java.util.List;

import com.ozai.model.BlogArticle;

public interface ArticleDAO {

	public List<BlogArticle> getBlogArtciles(String category, int limit,
			int offset);

	public List<BlogArticle> getRecentBlogArtciles(int limit);

	public BlogArticle getBlogArticle(int article_id);
	
	public List<String> getBlogArticleCategoryList();
	
	public int getNextOrPreviousBlogArticleCode(String category,int id, boolean next,
			boolean previous);

	public int getBlogArticlesCount(String category);

	public boolean saveArtcile(BlogArticle article);

	public List<BlogArticle> getUserBlogArtciles(String username, int limit, int offset);

	public boolean incNoOfViews(int id);
	
}
