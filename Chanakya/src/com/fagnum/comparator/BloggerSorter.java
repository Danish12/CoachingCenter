package com.fagnum.comparator;

import java.util.ArrayList;
import java.util.List;
import java.util.Collections;

import com.fagnum.services.model.Blogger;

public class BloggerSorter {
	
	  List<Blogger> blogger = new ArrayList<Blogger>();
	  
	  public BloggerSorter(List<Blogger> blogger) {         
	    this.blogger = blogger;     
	  } 
	  
	  public List<Blogger> getSortedBloggerByArticle() {         
	    Collections.sort(blogger, Blogger.noOfArticleComparator);         
	    return blogger;     
	  }       

}
