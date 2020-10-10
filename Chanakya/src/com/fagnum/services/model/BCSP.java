/*package com.fagnum.services.model;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "BCSP")
public class BCSP {

	@Id
	@Column(name = "BLOG_ID")
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	private String blogId;

	
	@Column(name = "COURCES")
	private String cources;
	
	@Column(name = "SUBJECTS")
	private String subjects;
	
	@Column(name = "IS_PRIME")
	private Boolean isPrime;
	
	
	@Embedded
	private ByAndTimeStamp byAndTimeStamp;
	
	@ManyToOne
	@JoinColumn(name = "BLOGGER_ID")
	private Blogger blogger;
	

}
*/