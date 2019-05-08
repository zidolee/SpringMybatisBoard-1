package com.springbook.ioc.injection;

import java.util.Map;
import java.util.Properties;

public class CollectionBean {
	// 1. List
//	private List<String> addressList;
//
//	public List<String> getAddressList() {
//		return addressList;
//	}
//
//	public void setAddressList(List<String> addressList) {
//		this.addressList = addressList;
//	}
	
	// 2. Set
//	private Set<String> addressList;
//
//	public Set<String> getAddressList() {
//		return addressList;
//	}
//
//	public void setAddressList(Set<String> addressList) {
//		this.addressList = addressList;
//	}
	
	// 3.Map
//	private Map<String, String> addressList;
//	
//	public void setAddressList(Map<String, String> addressList) {
//		this.addressList = addressList;
//	}
//	
//	public Map<String, String> getAddressList() {
//		return  addressList;
//	}
	
	// 4. Properties 활용 -key와 value의 String으로 특화된 Map
	private Properties addressList;
	
	public void setAddressList(Properties addressList) {
		this.addressList = addressList;
	}
	
	public Properties getAddressList() {
		return  addressList;
	}
}
