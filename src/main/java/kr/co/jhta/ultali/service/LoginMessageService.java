package kr.co.jhta.ultali.service;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
@PropertySource("classpath:sms.properties")
public class LoginMessageService {
	
	@Value("${apiKey}")
	private String api_key;
	
	@Value("${apiSecret}")
	private String api_secret;
	
	@Value("${fromNumber}")
	private String fromNumber;
	
	
	 public void sendMessage(String toNumber, String randomNumber) {
		    Message coolsms = new Message(api_key, api_secret);

		    // 4 params(to, from, type, text) are mandatory. must be filled
		    HashMap<String, String> params = new HashMap<String, String>();
		    params.put("to", toNumber);
		    params.put("from", fromNumber);
		    params.put("type", "SMS");
		    params.put("text", "[울타리] 인증번호 "+randomNumber+" 입력하세요.");
		    params.put("app_version", "test app 1.2"); // application name and version

		    try {
		      JSONObject obj = (JSONObject) coolsms.send(params);
		      System.out.println(obj.toString());
		    } catch (CoolsmsException e) {
		      System.out.println(e.getMessage());
		      System.out.println(e.getCode());
		    }
		  }
}
