package br.ufc.web.jornal.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Comment {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	private String text;
	
	@ManyToOne(fetch=FetchType.EAGER, cascade = CascadeType.REMOVE)
	private User author;
	@ManyToOne(fetch=FetchType.EAGER, cascade = CascadeType.REMOVE)
	private News news;
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getText() {
		return text;
	}
	
	public void setText(String text) {
		this.text = text;
	}
	
	public User getAuthor() {
		return author;
	}
	
	public void setAuthor(User author) {
		this.author = author;
	}
	
	public News getNews() {
		return news;
	}
	
	public void setNews(News news) {
		this.news = news;
	}

}
