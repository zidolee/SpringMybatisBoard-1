package polymorphism;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class TVUser {
	public static void main(String[] args) {
//		SamsungTv tv = new SamsungTv();
//		tv.powerOn();
//		tv.volumeUp();
//		tv.volumeDown();
//		tv.powerOff();
		
		// 2. LG tv
//		LgTv tv = new LgTv();
//		tv.turnOn();
//		tv.soundUp();
//		tv.SoundDown();
//		tv.turnOff();
		
		// 결합도를 낮추는 방법
		//다형성 구현 ----> 결합도를 낮추기 위한 방법
//		TV tv = new LgTv();
//		
//		tv.powerOn();
//		tv.volumeUp();
//		tv.volumeDown();
//		v.powerOff();
		// 2. Factory 디자인 패턴 적용
//		BeanFactory factory  = new BeanFactory();
//		TV tv  = (TV)factory .getBean(args[0]);
//		
//		tv.powerOn();
//		tv.volumeUp();
//		tv.volumeDown();
//		tv.powerOff();
		
		// 3. applicationContext.xml 파일에 빈 생성
		// Spring 컨테이너 구동
		AbstractApplicationContext factory = new GenericXmlApplicationContext("applicationContext.xml");
		
		
		// Spring 컨테이너가 필요한 객체를 룩업(Look Up)한다 
		TV tv = (TV)factory.getBean("tv");
		tv.powerOn();
		tv.volumeUp();
		tv.volumeDown();
		tv.powerOff();
		
		
		// singleton 패턴 확인
//		TV tv1 = (TV)factory.getBean("tv");
//		TV tv2 = (TV)factory.getBean("tv");
//		TV tv3 = (TV)factory.getBean("tv");
		
		// Spring 컨테이너 종료
		factory.close();
	}
}
