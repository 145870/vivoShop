package servlets.personalCenter;
import com.aliyun.dysmsapi20170525.Client;

import java.util.Random;


import com.aliyun.dysmsapi20170525.models.*;
import com.aliyun.teaopenapi.models.*;

public class Sample {
    
    public static String huoquduanxin(String phoneNum)throws Exception {
    	Random ran = new Random();
        
        // 生成一个10000以内的随机整数
        int randomNumber = ran.nextInt(9000)+1000;
  
    	
        Config config = new Config()
                //这里修改为我们上面生成自己的AccessKey ID
                .setAccessKeyId("LTAI5tGm6an8SjBUvDeJU8dH")
             
                //这里修改为我们上面生成自己的AccessKey Secret
                .setAccessKeySecret("TNCqc22IcD5kpHpJAfnkpIhLc2qCM8");
        // 访问的域名
        //config.endpoint = "dysmsapi.aliyuncs.com";
        Client client = new Client(config);
        SendSmsRequest sendSmsRequest = new SendSmsRequest()
                .setSignName("阿里云短信测试")//短信签名
                .setTemplateCode("SMS_154950909")//短信模板
                .setPhoneNumbers(phoneNum)//这里填写接受短信的手机号码
                .setTemplateParam("{\"code\":\""+randomNumber+"+\"}");//验证码
        // 复制代码运行请自行打印 API 的返回值
        client.sendSms(sendSmsRequest);
        
        return randomNumber+"";
    }
}
