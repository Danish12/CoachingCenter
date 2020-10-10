package com.fagnum.services.model;

import java.util.Set;
import java.util.Comparator; 

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "BLOGGER")
public class Blogger {

	@Id
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	@Column(name = "BLOGGER_ID")
	private String bloggerId;
	@Column(name = "NAME")
	private String name;
	@Column(name = "CONTACT_NUMBER")
	private String contactNumber;
	@Column(name = "ALT_CONTACT_NUMBER")
	private String altContactNumber;
	@Column(name = "EMAIL_ID")
	private String emailId;
	@Column(name = "GENDER")
	private String gender;
	@Lob
	@Column(name = "BIO")
	private String bio;
	@Column(name = "PROFILE_PIC")
	private String profilePic;
	@Column(name = "LINKEDIN_PROFILE")
	private String linkedinProfile;
	@Column(name = "FACEBOOK_PROFILE")
	private String facebookProfile;
	@Column(name = "TWITTER_PROFILE")
	private String twitterProfile;
	@Column(name = "JOINING_DATE")
	private String joiningDate;
	@Column(name = "LEAVING_DATE")
	private String leavingDate;
	@Column(name = "URL")
	private String url;
	@Column(name = "CITY")
	private String city;
	@Column(name = "REFERRED_BY")
	private String referredBy;
	@Column(name = "TYPE")
	private String type;
	@Lob
	@Column(name = "REVIEW")
	private String review;
	@Column(name = "PROMOTE")
	private String promote;
	@Column(name = "STATUS")
	private String status;
	@Column(name = "META_KEYWORD")
	private String metaKeyword;
	@Column(name = "BLOG_LINK")
	private String blogLink;
	@Column(name = "NO_OF_ARTICLE")
	private int noOfArticle;
	@Embedded
	private ByAndTimeStamp byAndTimeStamp;

	@OneToMany(mappedBy = "blogger", fetch = FetchType.LAZY)
	private Set<Blog> blog;
	
	public String getBloggerId() {
		return bloggerId;
	}

	public void setBloggerId(String bloggerId) {
		this.bloggerId = bloggerId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getBio() {
		return bio;
	}

	public void setBio(String bio) {
		this.bio = bio;
	}

	public String getProfilePic() {
		return profilePic;
	}

	public void setProfilePic(String profilePic) {
		this.profilePic = profilePic;
	}

	public String getLinkedinProfile() {
		return linkedinProfile;
	}

	public void setLinkedinProfile(String linkedinProfile) {
		this.linkedinProfile = linkedinProfile;
	}

	public String getFacebookProfile() {
		return facebookProfile;
	}

	public void setFacebookProfile(String facebookProfile) {
		this.facebookProfile = facebookProfile;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getJoiningDate() {
		return joiningDate;
	}

	public void setJoiningDate(String joiningDate) {
		this.joiningDate = joiningDate;
	}

	public String getLeavingDate() {
		return leavingDate;
	}

	public void setLeavingDate(String leavingDate) {
		this.leavingDate = leavingDate;
	}

	public ByAndTimeStamp getByAndTimeStamp() {
		return byAndTimeStamp;
	}

	public void setByAndTimeStamp(ByAndTimeStamp byAndTimeStamp) {
		this.byAndTimeStamp = byAndTimeStamp;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Set<Blog> getBlog() {
		return blog;
	}

	public void setBlog(Set<Blog> blog) {
		this.blog = blog;
	}

	public String getTwitterProfile() {
		return twitterProfile;
	}

	public void setTwitterProfile(String twitterProfile) {
		this.twitterProfile = twitterProfile;
	}

	public String getMetaKeyword() {
		return metaKeyword;
	}

	public void setMetaKeyword(String metaKeyword) {
		this.metaKeyword = metaKeyword;
	}

	public String getAltContactNumber() {
		return altContactNumber;
	}

	public void setAltContactNumber(String altContactNumber) {
		this.altContactNumber = altContactNumber;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getReferredBy() {
		return referredBy;
	}

	public void setReferredBy(String referredBy) {
		this.referredBy = referredBy;
	}

	public String getBlogLink() {
		return blogLink;
	}

	public void setBlogLink(String blogLink) {
		this.blogLink = blogLink;
	}

	public int getNoOfArticle() {
		return noOfArticle;
	}

	public void setNoOfArticle(int noOfArticle) {
		this.noOfArticle = noOfArticle;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public String getPromote() {
		return promote;
	}

	public void setPromote(String promote) {
		this.promote = promote;
	}
	
	public static Comparator<Blogger> noOfArticleComparator = new Comparator<Blogger>() {         
	    @Override         
	    public int compare(Blogger blogger1, Blogger blogger2) {             
	      return (blogger2.getNoOfArticle() < blogger1.getNoOfArticle() ? -1 :                     
	              (blogger2.getNoOfArticle() == blogger1.getNoOfArticle() ? 0 : 1));           
	    }     
	  };   
}
