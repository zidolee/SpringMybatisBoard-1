package com.springbook.ioc.injection;

import java.util.Iterator;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class CollectionBeanClient {
	public static void main(String[] args) {
		AbstractApplicationContext factory = new GenericXmlApplicationContext("context.xml");
		
		CollectionBean bean = (CollectionBean)factory.getBean("collectionBean");
		
//		Map<String, String> addressList = bean.getAddressList();
//		
//		Iterator<String> key = addressList.keySet().iterator();
//		
//		while (key.hasNext()) {
//			String name = key.next();
//			System.out.println( addressList.get(key.next()));
//		}
		
		
		// 4. Properties 사용
		Properties addressList = bean.getAddressList();
		Set<Object> names = addressList.keySet();
		Iterator<Object> it = names.iterator();
		while (it.hasNext()) {
			String name = (String)it.next();
			String address = addressList.getProperty(name);
			
			System.out.println(name + " : " + address);
			
		}
		factory.close();
	}
}
