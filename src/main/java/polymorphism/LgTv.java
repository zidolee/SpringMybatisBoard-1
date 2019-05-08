package polymorphism;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("tv")
public class LgTv implements TV {
	
	@Autowired
	Speaker speaker;
	
	public LgTv() {
		System.out.println("===> LgTv 객체 생성");
	}
	
	@Override
	public void powerOn() {
		System.out.println("LgTv---전원켜다");
	}

	@Override
	public void volumeUp() {
//		System.out.println("LgTv---소리 올리다");
		speaker.volumeUp();
	}

	@Override
	public void volumeDown() {
//		System.out.println("LgTv---소리 내리다");
		speaker.volumeDown();
	}
	
	@Override
	public void powerOff() {
		System.out.println("LgTv---전원끄다");
	}
}
