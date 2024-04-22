package util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import com.aliyun.oss.ClientException;
import com.aliyun.oss.OSS;
import com.aliyun.oss.OSSClientBuilder;
import com.aliyun.oss.OSSException;
import com.aliyun.oss.common.auth.EnvironmentVariableCredentialsProvider;
import com.aliyun.oss.model.GetObjectRequest;
import com.aliyun.oss.model.OSSObject;
import com.aliyun.oss.model.OSSObjectSummary;
import com.aliyun.oss.model.ObjectListing;
import com.aliyun.oss.model.PutObjectRequest;

public class AliyunOssUtil {
    private final OSS ossClient;
    //Bucket名称
    private String bucketName = "vivosp";
    //地域用于拼接regional
    private String regional = "guangzhou";
    // Endpoint以广州为例，其它Region请按实际情况填写。
    private String endpoint = "https://oss-cn-guangzhou.aliyuncs.com";
    
    public AliyunOssUtil() {
        // 从环境变量中获取访问凭证。运行本代码示例之前，请确保已设置环境变量OSS_ACCESS_KEY_ID和OSS_ACCESS_KEY_SECRET。
        EnvironmentVariableCredentialsProvider credentialsProvider = new EnvironmentVariableCredentialsProvider();
        // 创建OSSClient实例。
        this.ossClient = new OSSClientBuilder().build(endpoint, credentialsProvider);
    }
    /**
     * 构造方法
     * 
     * @param regional      OSS服务的地域
     * @param bucketName    Bucket名称
     */
    public AliyunOssUtil(String regional,String bucketName) {
    	this.regional = regional;
    	this.endpoint = "https://oss-cn-"+regional+".aliyuncs.com";
    	// 从环境变量中获取访问凭证。运行本代码示例之前，请确保已设置环境变量OSS_ACCESS_KEY_ID和OSS_ACCESS_KEY_SECRET。
    	
    	
        EnvironmentVariableCredentialsProvider credentialsProvider = new EnvironmentVariableCredentialsProvider();
        // 创建OSSClient实例。
        this.ossClient = new OSSClientBuilder().build(endpoint, credentialsProvider);
    }

    /**
     * 上传文件到OSS
     * 
     * @param objectName    存储的Object名称（包括路径）
     * @param inputStream   要上传的文件输入流
     * @throws OSSException     OSS异常
     * @throws ClientException  客户端异常
     */
    public void upload(String objectName, InputStream inputStream) throws OSSException, ClientException {
        // 创建上传Object的Request对象
        PutObjectRequest putObjectRequest = new PutObjectRequest(bucketName, objectName, inputStream);
        // 上传文件
        ossClient.putObject(putObjectRequest);
    }

    /**
     * 从OSS下载文件到本地
     * 
     * @param objectName    OSS存储的Object名称（包括路径）
     * @param savePath      本地文件保存路径
     * @throws OSSException     OSS异常
     * @throws ClientException  客户端异常
     * @throws IOException      IO异常
     */
    public void download(String objectName, String savePath) throws OSSException, ClientException, IOException {
        // 创建下载Object的Request对象
        GetObjectRequest getObjectRequest = new GetObjectRequest(bucketName, objectName);
        // 下载文件到本地
        OSSObject ossObject = ossClient.getObject(getObjectRequest);
        InputStream inputStream = ossObject.getObjectContent();
        OutputStream outputStream = new FileOutputStream(new File(savePath));

        byte[] buffer = new byte[4096];
        int length;
        while ((length = inputStream.read(buffer)) != -1) {
            outputStream.write(buffer, 0, length);
        }

        outputStream.close();
        inputStream.close();
    }

    /**
     * 删除OSS中的文件
     * 
     * @param objectName    OSS存储的Object名称（包括路径）
     * @throws OSSException     OSS异常
     * @throws ClientException  客户端异常
     */
    public void delete(String objectName) throws OSSException, ClientException {
    	//删除文件
    	ossClient.deleteObject(bucketName, objectName);
    }
    
    public void outObjectListing(String objectName) {
    	// 设置要列举的目录路径，并执行列举操作
        ObjectListing objectListing = ossClient.listObjects(bucketName, objectName);
        // 遍历目录下的对象信息
        for (OSSObjectSummary objectSummary : objectListing.getObjectSummaries()) {
            System.out.println(" - " + objectSummary.getKey());
        }
    }
    //返回拼接后的图片url
    public String getImageUrl(String objectName) {
        // 拼接图片的访问路径
        return "https://" + bucketName + ".oss-cn-"+this.regional+".aliyuncs.com/" + objectName;
    }

    /**
     * 从OSS下载文件到InputStream
     * 
     * @param objectName    OSS存储的Object名称（包括路径）
     * @return 文件的输入流
     * @throws OSSException     OSS异常
     * @throws ClientException  客户端异常
     * @throws IOException      IO异常
     */
    public InputStream downloadToInputStream(String objectName) throws OSSException, ClientException, IOException {
        // 创建下载Object的Request对象
        GetObjectRequest getObjectRequest = new GetObjectRequest(bucketName, objectName);
        // 下载文件到本地
        OSSObject ossObject = ossClient.getObject(getObjectRequest);
        return ossObject.getObjectContent();
    }
    
    /**
     * 关闭OSS客户端连接
     */
    public void close() {
        if (ossClient != null) {
            ossClient.shutdown();
        }
    }
    public static void main(String[] args) {
    	//AliyunOssUtil u = new AliyunOssUtil();
    	
    		//下载图片 第一个参数是服务器图片路径 第二个是本地路径
    		//u.download("images/1.jpg","F:/o.jpg");
    		
    		//上传图片
//    		File file = new File("F:/壁纸/2.jpg");//本地
//            InputStream inputStream = new FileInputStream(file);
//            //第一个是需要上传到服务器上的路径包括文件名 第二个是本地的图片
//    		u.upload("images/2.jpg",inputStream);
    		
    		//删除文件
    		//u.delete("images/2.jpg");
    		
    		//获取图片链接 用于发布到网页等 参数为服务器上的地址
			//System.out.println(u.getImageUrl("images/1.jpg"));
    	//u.outObjectListing("");
	}
}