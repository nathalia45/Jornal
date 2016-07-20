package br.ufc.web.jornal.model;

public class Message {
	
	public enum Type {INFO, WARNING, SUCCESS, ERRO};
	
	private String text;
	private Type type;
	
	public Message() {}
	
	public Message(String text, Type type) {
		this.text = text;
		this.type = type;
	}

	public String getText() {
		return text;
	}
	
	public void setText(String text) {
		this.text = text;
	}

	public Type getType() {
		return type;
	}

	public void setType(Type type) {
		this.type = type;
	}
	
}
