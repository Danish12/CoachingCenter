package com.fagnum.services.model;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

@Entity
@Table(name = "IMAGES")
public class Images {

	public Images() {
	}

	@Id
	@Column(name = "IMAGES_ID")
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	private String imageId;

	@Column(name = "DESCRIPTION")
	private String description;

	@Column(name = "TYPE")
	//GALLERY SLIDER
	private String type;

	@Column(name = "URL")
	private String url;

	public String getImageId() {
		return imageId;
	}

	public void setImageId(String imageId) {
		this.imageId = imageId;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	@Embedded
	private ByAndTimeStamp byAndTimeStamp;

	public ByAndTimeStamp getByAndTimeStamp() {
		return byAndTimeStamp;
	}

	public void setByAndTimeStamp(ByAndTimeStamp byAndTimeStamp) {
		this.byAndTimeStamp = byAndTimeStamp;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
