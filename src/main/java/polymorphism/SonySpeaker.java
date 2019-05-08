package polymorphism;

import org.springframework.stereotype.Component;


public class SonySpeaker implements Speaker{
	public SonySpeaker() {
		System.out.println("===> SonySpeaker 생성자-객체 생성");
	}
	
	@Override
	public void volumeUp() {
		System.out.println("SonySpaeker---소리 율린다.");
	}
	@Override
	public void volumeDown() {
		System.out.println("SonySpeaker---소리 내린다.");
	}
}
