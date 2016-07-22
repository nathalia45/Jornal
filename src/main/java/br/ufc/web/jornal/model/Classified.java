package br.ufc.web.jornal.model;

import java.math.BigDecimal;
import java.util.Calendar;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Classified {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	
	private String title;
	private String text;
	
	private BigDecimal price;
	private BigDecimal bestOffer;
	private Calendar bestOfferDate;
	
	private String phoneNumber;
	
	@ManyToOne(fetch=FetchType.EAGER, cascade = CascadeType.REFRESH)
	private User author;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public BigDecimal getBestOffer() {
		return bestOffer;
	}

	public void setBestOffer(BigDecimal bestOffer) {
		this.bestOffer = bestOffer;
	}

	public Calendar getBestOfferDate() {
		return bestOfferDate;
	}

	public void setBestOfferDate(Calendar bestOfferDate) {
		this.bestOfferDate = bestOfferDate;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public User getAuthor() {
		return author;
	}

	public void setAuthor(User author) {
		this.author = author;
	}
	
	public String getRawText() {
		return text.length() > 50? text.substring(0, 50): text;
	}
	
}
