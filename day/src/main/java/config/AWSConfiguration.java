package config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;

@Configuration
public class AWSConfiguration {
    @Value("${cloud.aws.credentials.accessKey}")
    private String awsId;

    @Value("${cloud.aws.credentials.secretKey}")
    private String awsKey;

    
    @Value("${cloud.aws.region.static}")
    private String region;

    
    
    @Bean
    public AmazonS3 s3client() {
        AWSCredentials awsCredentials = new BasicAWSCredentials(awsId, awsKey);
        return AmazonS3ClientBuilder
                .standard()
                .withCredentials(new AWSStaticCredentialsProvider(awsCredentials))
                .withRegion(Regions.fromName(region))
                .build();
    }
}