package com.fagnum.services.model;

public class AbstractTransEvents {
	private Object object;
	private String operationType;

	/**
	 * Accepted values for operation type are 
	 * 
	 *<br> 1. SAVE <br> 2. UPDATE <br> 3. DELETE
	 * 
	 * @param object Object to be operated
	 * @param operationType Operation type from above values
	 */
	public AbstractTransEvents(Object object, String operationType) {
		this.object = object;
		this.operationType = operationType;
	}
	
	public AbstractTransEvents() {

	}

	public Object getObject() {
		return object;
	}

	public void setObject(Object object) {
		this.object = object;
	}

	public String getOperationType() {
		return operationType;
	}

	public void setOperationType(String operationType) {
		this.operationType = operationType;
	}

}
