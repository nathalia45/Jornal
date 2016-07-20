package br.ufc.web.jornal.model;

import java.math.BigDecimal;

import javax.persistence.Embeddable;

@Embeddable
public class Price {

	public enum Type {
		A, B, C
	};

	private BigDecimal value;
	private Type type;

	public BigDecimal getValue() {
		return value;
	}

	public void setValue(BigDecimal value) {
		this.value = value;
	}

	public Type getType() {
		return type;
	}

	public void setType(Type type) {
		this.type = type;
	}

}
