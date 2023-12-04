package kr.spring.service;

import java.io.IOException;
import java.io.InputStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;

@Service
public class AwsService {

   @Autowired
   private AmazonS3 s3Client;
   
   
   public String uploadfile(MultipartFile multipartFile, String filename) throws IOException {
      String bucketName = "daydayday";
      ObjectMetadata metadata = new ObjectMetadata();
      
      String filePath = "day/" + filename;
      InputStream inputstream =  multipartFile.getInputStream();
      metadata.setContentLength(multipartFile.getSize());
      
      s3Client.putObject(new PutObjectRequest(bucketName, filePath, inputstream, metadata));
      
      
      return s3Client.getUrl(bucketName, filePath).toString();
   }
   
}