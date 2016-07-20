package br.ufc.web.jornal.model;

import java.util.ArrayList;
import java.util.List;

import br.ufc.web.jornal.model.Message.Type;

public class MessageSet {

	private List<Message> messages;

	public MessageSet() {
		messages = new ArrayList<>();
	}

	public List<Message> getMessages() {
		return messages;
	}

	public MessageSet addMessage(String text, Message.Type type) {
		messages.add(new Message(text, type));
		return this;
	}

	public MessageSet addMessageInfo(String text) {
		return addMessage(text, Type.INFO);
	}
	
	public MessageSet addMessageWarning(String text) {
		return addMessage(text, Type.WARNING);
	}
	
	public MessageSet addMessageSuccess(String text) {
		return addMessage(text, Type.SUCCESS);
	}
	
	public MessageSet addMessageError(String text) {
		return addMessage(text, Type.ERRO);
	}

}
