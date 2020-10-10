package com.fagnum.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.security.Principal;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;
import java.util.Set;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.fagnum.services.model.Blog;
import com.fagnum.services.model.Blogger;
import com.fagnum.services.model.ByAndTimeStamp;
import com.fagnum.services.model.Category;
import com.fagnum.services.model.Course;
import com.fagnum.services.model.Genre;
import com.fagnum.services.model.Subject;
import com.fagnum.services.service.BlogService;
import com.fagnum.services.service.BloggerService;
import com.fagnum.services.service.CategoryService;
import com.fagnum.services.service.CourseService;
import com.fagnum.services.service.GenreService;
import com.fagnum.services.service.SubjectService;
import com.fagnum.services.util.Constants;

@Controller
public class BlogController extends BaseAppController{

	BlogService blogService = AppController.getBlogService();
	BloggerService bloggerService = AppController.getBloggerService();
	GenreService genreService = AppController.getGenreService();
	CategoryService categoryService = AppController.getCategoryService();
	CourseService courseService = AppController.getCourseService();
	SubjectService subjectService = AppController.getSubjectService();

	List<Blogger> bloggerList = bloggerService.getAllList(Blogger.class);
	List<Genre> genreList = genreService.getAllList(Genre.class);
	List<Category> categoryList = categoryService.getAllList(Category.class);

	/*************************
	 * Blog for user reading starts
	 ***********************************/

	@RequestMapping("/blogDetail")
	public String blogDetail() {
		return "blogDetail";
	}

	@RequestMapping("/blog/{blogUrl}")
	public String getBlogPreview(@PathVariable("blogUrl") String blogUrl, HttpServletRequest request) {
		Blog blog = blogService.getBlogByURL(blogUrl);
		request.setAttribute("blog", blog);
		request.setAttribute("recentBlogs", blogService.getBlogListByStatusAndBlogIdDesc(Constants._PUBLISH));

		List<Object> parameterList = new ArrayList<Object>();
		parameterList.add(blog.getBloggerUrl());
		parameterList.add(Constants._PUBLISH);
		String query = new String("from Blog where bloggerUrl = ? and status = ? order by blogId desc");
		List<Blog> authorBlogs = blogService.getDynamicList(parameterList, query, "0", "10");
		request.setAttribute("authorBlogs", authorBlogs);

		List<Object> parameterList1 = new ArrayList<Object>();
		parameterList1.add(blog.getBlogType());
		parameterList1.add(Constants._PUBLISH);
		String query1 = new String("from Blog where blogType = ? and status = ? order by blogId desc");
		List<Blog> relatedBlogs = blogService.getDynamicList(parameterList1, query1, "0", "10");
		request.setAttribute("relatedBlogs", relatedBlogs);
		return "blogDetails";
	}

	@RequestMapping("/blog/{year}/{month}/{date}/{blogUrl}")
	public String getBlogDetails(@PathVariable("blogUrl") String blogUrl, HttpServletRequest request) {
		Blog blog = blogService.getBlogByURL(blogUrl);
		request.setAttribute("blog", blog);
		request.setAttribute("recentBlogs", blogService.getBlogListByStatusAndBlogIdDesc(Constants._PUBLISH));

		List<Object> parameterList = new ArrayList<Object>();
		parameterList.add(blog.getBloggerUrl());
		parameterList.add(Constants._PUBLISH);
		String query = new String("from Blog where bloggerUrl = ? and status = ? order by blogId desc");
		List<Blog> authorBlogs = blogService.getDynamicList(parameterList, query, "0", "10");
		request.setAttribute("authorBlogs", authorBlogs);

		List<Object> parameterList1 = new ArrayList<Object>();
		parameterList1.add(blog.getBlogType());
		parameterList1.add(Constants._PUBLISH);
		String query1 = new String("from Blog where blogType = ? and status = ? order by blogId desc");
		List<Blog> relatedBlogs = blogService.getDynamicList(parameterList1, query1, "0", "10");
		request.setAttribute("relatedBlogs", relatedBlogs);
		return "blogDetails";
	}

	@RequestMapping("/author/{authorUrl}/")
	public String author(@PathVariable("authorUrl") String authorUrl, HttpServletRequest request) {
		List<Object> parameterList = new ArrayList<Object>();
		parameterList.add(authorUrl);
		parameterList.add(Constants._PUBLISH);
		String query = new String("from Blog where bloggerUrl = ? and status = ? order by blogId desc");
		List<Blog> list = blogService.getDynamicList(parameterList, query);

		List<Object> parameterList1 = new ArrayList<Object>();
		parameterList1.add(authorUrl);
		String query1 = new String("from Blogger where url = ?");
		Blogger blogger = bloggerService.getDynamicEntity(query1, parameterList1);

		request.setAttribute("blogs", list);
		request.setAttribute("blogger", blogger);
		return "bloggerInfo";
	}

	/*************************
	 * Blog for user reading ends
	 ***********************************/

	/*************************
	 * Blog Crud Starts
	 ********************************************/

	@RequestMapping("/blogAdmin")
	public String blogList(Model model, Map<String, Object> map, HttpServletRequest request) {
		request.setAttribute("bloggerList", bloggerList);
		return "blogList";
	}

	@RequestMapping(value = "/listBlog", produces = "text/plain;charset=UTF-8")
	public @ResponseBody String listBlogs(HttpServletRequest request) {
		
		JSONObject jsonObject = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		String startIndex = request.getParameter("jtStartIndex");
		String pageSize = request.getParameter("jtPageSize");

		List<Object> parameterList = new ArrayList<Object>();
		parameterList.add(Constants._PUBLISH);
		parameterList.add(Constants._DRAFT);

		boolean isSearch = ServletRequestUtils.getBooleanParameter(request, "search", false);
		List<Blog> list = null;

		String query = "";
		if (isSearch) {
			String title = ServletRequestUtils.getStringParameter(request, "title", null);
			String type = ServletRequestUtils.getStringParameter(request, "type", null);
			String blogger = ServletRequestUtils.getStringParameter(request, "blogger", null);
			list = blogService.search(parameterList, title, blogger, type, startIndex, pageSize);

		} else {
			query = new String("from Blog blog where blog.status = ? or blog.status = ? order by blog.blogId desc");
			list = blogService.getDynamicList(parameterList, query, startIndex, pageSize);
		}

		for (Blog blog : list) {
			String button = "<a href='editBlog?id=" + blog.getBlogId() + "'>EDIT</a>";
			String preview = "<a href='blog/" + blog.getUrl()
					+ "'  target='_blank' >PREVIEW</a>";

			if ("DRAFT".equals(blog.getStatus())) {
				String publish = "<a href='" + request.getContextPath() + "/publishBlog?id=" + blog.getBlogId()
						+ "'>PUBLISH</a>";
				blog.setButton(button + " <br>  " + preview + "  <br> " + publish);
			} else {
				blog.setButton(button + " <br>  " + preview);
			}
			jsonArray.put(blog.toJSON());
		}
		jsonObject.put("Records", jsonArray);
		jsonObject.put("Result", "OK");
		jsonObject.put("TotalRecordCount", blogService.getTableRowCount(Blog.class));
		return jsonObject.toString();
	}

	@RequestMapping(value = "/publishBlog", method = RequestMethod.GET)
	public String publishBlog(Model model, Map<String, Object> map, HttpServletRequest request, Principal principal) {
		String blogId = request.getParameter("id");
		Blog blog = blogService.read(Blog.class, blogId);
		blog.setDate(DateAndTimeFormat.clientDate(new java.sql.Date(new Date().getTime())));
		ByAndTimeStamp byAndTimeStamp = blog.getByAndTimeStamp();
		byAndTimeStamp.setCreatedBy(principal.getName());
		byAndTimeStamp.setCreatedTs(new Timestamp(new Date().getTime()));
		byAndTimeStamp.setModifiedBy(principal.getName());
		byAndTimeStamp.setModifiedTs(new Timestamp(new Date().getTime()));
		blog.setStatus(Constants._PUBLISH);
		blogService.update(blog);
		try {
			Blogger blogger = bloggerService.getEntityByEmailId(Blogger.class, principal.getName());
			blogger.setNoOfArticle(blogger.getNoOfArticle() + 1);
			bloggerService.update(blogger);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "blogList";
	}

	@RequestMapping(value = "/addBlog", method = RequestMethod.GET)
	public String addblog(Model model, Map<String, Object> map, HttpServletRequest request) {
		request.setAttribute("action", "ADD");
		request.setAttribute("bloggerList", bloggerList);
		request.setAttribute("categoryList", categoryList);
		request.setAttribute("genreList", genreList);
		request.setAttribute("courses", courseService.getAllList(Course.class));
		request.setAttribute("subjects", subjectService.getAllList(Subject.class));
		return "blogAddEdit";
	}

	@RequestMapping(value = "/editBlog", method = RequestMethod.GET)
	public String editblog(Model model, Map<String, Object> map, HttpServletRequest request) {
		String id = request.getParameter("id");
		Blog blog = blogService.read(Blog.class, id);
		request.setAttribute("blog", blog);
		request.setAttribute("action", "EDIT");
		request.setAttribute("bloggerList", bloggerList);
		request.setAttribute("categoryList", categoryList);
		request.setAttribute("genreList", genreList);
		request.setAttribute("courses", courseService.getAllList(Course.class));
		request.setAttribute("subjects", subjectService.getAllList(Subject.class));

		return "blogAddEdit";
	}

	@RequestMapping(value = "/saveblog", method = RequestMethod.POST)
	public String save(Model model, HttpServletRequest request, Principal principal) {
		ResourceBundle resource = ResourceBundle.getBundle("application");
		ByAndTimeStamp byAndTimeStamp = new ByAndTimeStamp();
		String content = request.getParameter("content");
		String title = request.getParameter("title");
		String metaKeyword = request.getParameter("metaKeyword");
		String metaDesc = request.getParameter("metaDesc");
		String bloggerUrl = request.getParameter("bloggerUrl");
		String action = request.getParameter("action");
		String blogId = request.getParameter("id");
		String status = request.getParameter("status");
		String url = request.getParameter("url");
		String genre = request.getParameter("genre");
		String blogImageName = request.getParameter("blogImageName");
		String blogType = request.getParameter("blogType");
		String fresh = request.getParameter("fresh");
		String isPrime = request.getParameter("isPrime");
		String[] courses = request.getParameterValues("courses[]");
		String[] subjects = request.getParameterValues("subjects[]");


		Blog blog = new Blog();
		if (blogId != null && !blogId.equals("")) {
			blog = blogService.read(Blog.class, blogId);
		}
		
		if (null != courses) {
			Set<Course> coursesSet = new java.util.HashSet<>();
			for (String course : courses) {
				coursesSet.add(courseService.read(Course.class, course));
			}
			blog.setCourses(coursesSet);
		}

		if (null != subjects) {
			Set<Subject> subjectsSet = new java.util.HashSet<>();
			for (String subject : subjects) {
				subjectsSet.add(subjectService.read(Subject.class, subject));
			}
			blog.setSubjects(subjectsSet);
		}
		
		blog.setContent(content);
		blog.setMetaDescription(metaDesc);
		blog.setMetaKeyword(metaKeyword);
		blog.setStatus(status);
		blog.setTitle(title);
		blog.setIsPrime(Boolean.valueOf(isPrime));
		blog.setUrl(url);
		blog.setButton("");
		blog.setBlogImage(resource.getString("siteUrl") + "newBlogImage/" + blogImageName);
		blog.setBlogImageName(blogImageName);
		blog.setBloggerUrl(bloggerUrl);
		blog.setGenre(genre);
		blog.setBlogType(blogType);
		blog.setFresh(fresh);
		blog.setPaymentStatus(Constants._PAYMENT_DUE);
		
		

		List<Object> parameterList = new ArrayList<Object>();
		parameterList.add(bloggerUrl);
		String query = new String("from Blogger where url = ?");
		Blogger blogger = bloggerService.getDynamicEntity(query, parameterList);
		blog.setBlogger(blogger);
		try {
			if (action.equals("ADD")) {
				blog.setViews(0);
				blog.setDate(DateAndTimeFormat.clientDate(new java.sql.Date(new Date().getTime())));
				byAndTimeStamp.setCreatedBy("");
				byAndTimeStamp.setCreatedTs(new Timestamp(new Date().getTime()));
				byAndTimeStamp.setModifiedBy("");
				byAndTimeStamp.setModifiedTs(new Timestamp(new Date().getTime()));
				blog.setByAndTimeStamp(byAndTimeStamp);
				blogService.save(blog);
			} else {
				byAndTimeStamp = blog.getByAndTimeStamp();
				byAndTimeStamp.setModifiedBy(principal.getName());
				byAndTimeStamp.setModifiedTs(new Timestamp(new Date().getTime()));
				blog.setByAndTimeStamp(byAndTimeStamp);
				blogService.update(blog);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "blogList";
	}

	/*************************
	 * Blog Crud Ends
	 ***********************************/

	/*************************
	 * Blog Image Starts
	 ***********************************/

	@RequestMapping(value = "/blogImages")
	public String blogImage(HttpServletRequest request) {
		ResourceBundle resource = ResourceBundle.getBundle("application");
		File dir = new File(resource.getString("imagePath") + resource.getString("nameOne") + "Image" + File.separator
				+ "blogImage");

		Map<Date, String> map = new TreeMap<Date, String>(new Comparator<Date>() {
			@Override
			public int compare(Date o1, Date o2) {
				return o2.compareTo(o1);
			}

		});
		if (dir.listFiles() != null) {
			for (File imgFile : dir.listFiles()) {
				// BasicFileAttributes attr =
				// Files.readAttributes(imgFile.toPath(),
				// BasicFileAttributes.class);
				javaxt.io.File file = new javaxt.io.File(imgFile);
				map.put(file.getCreationTime(), resource.getString("siteUrl") + "blogImage?" + imgFile.getName());
			}
		}
		request.setAttribute("blogImages", map);

		request.setAttribute("blogs", blogService.getAllList(Blog.class));
		return "blogImage";
	}

	@RequestMapping(value = "/blogImageSubmit", method = RequestMethod.POST)
	public ModelAndView blogImageSubmit(HttpServletRequest request, @RequestParam("blogImage") MultipartFile blogImage,
			Principal principal) {
		ResourceBundle resource = ResourceBundle.getBundle("application");
		String blogId = request.getParameter("blogId");

		File dir = new File(resource.getString("imagePath") + resource.getString("nameOne") + "Image" + File.separator
				+ "blogImage");
		if (!dir.exists()) {
			dir.mkdirs();
		}
		// Creating the directory to store file
		if (!blogImage.isEmpty()) {
			try {
				byte[] bytes = blogImage.getBytes();
				// Create the file on server
				File serverFile = new File(dir.getAbsolutePath() + File.separator + blogImage.getOriginalFilename());
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();
				if (!blogId.equals("Select")) {
					Blog blog = blogService.read(Blog.class, blogId);
					blog.setBlogImage(
							resource.getString("siteUrl") + "newBlogImage/" + blogImage.getOriginalFilename());
					ByAndTimeStamp byAndTimeStamp = blog.getByAndTimeStamp();
					byAndTimeStamp.setModifiedBy(principal.getName());
					byAndTimeStamp.setModifiedTs(new Timestamp(new Date().getTime()));
					blogService.update(blog);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		ModelAndView modelView = new ModelAndView(new RedirectView("blogImages"));
		return modelView;
	}

	/*************************
	 * Blog Image Ends
	 ***********************************/

	@RequestMapping(value = "/increaseBlogView")
	public @ResponseBody String increaseBlogView(HttpServletRequest request) {
		JSONObject jsonObject = new JSONObject();
		String blogUrl = request.getParameter("blogUrl");
		List<Object> parameterList = new ArrayList<Object>();
		parameterList.add(blogUrl);
		String query = new String("select blog from Blog blog where blog.url = ?");
		List<Blog> list = blogService.getDynamicList(parameterList, query);
		if (!list.isEmpty()) {
			for (Blog blog : list) {
				Blog blog2 = blog;
				blog2.setViews(blog2.getViews() + 1);
				blogService.update(blog2);
			}
		}
		jsonObject.put("Records", list);
		jsonObject.put("Result", "OK");
		// jsonObject.put("TotalRecordCount",
		// blogService.getTableRowCount(Blog.class));
		return jsonObject.toString();
	}
}
