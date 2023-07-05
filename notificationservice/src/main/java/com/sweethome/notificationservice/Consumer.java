package com.sweethome.notificationservice;

import java.time.Duration;
import java.util.Arrays;
import java.util.Properties;
import java.util.Set;

import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.apache.kafka.clients.consumer.ConsumerRecords;
import org.apache.kafka.clients.consumer.KafkaConsumer;

public class Consumer {
	
	public static void main(String[] args) {
		
        Properties props = new Properties();

        //Update the IP adress of Kafka server here//

//        properties.put("bootstrap.servers", "ec2-18-206-108.compute-1.amazonaws.com:9092");
        String kafkaConnectionstring = System.getenv("KAFKA_HOST")+":"+System.getenv("KAFKA_HOST_PORT");
//        System.out.println(kafkaConnectionstring);
        props.put("bootstrap.servers", kafkaConnectionstring);

        props.setProperty("group.id", "sweethome");
        props.setProperty("enable.auto.commit", "true");
        props.setProperty("auto.commit.interval.ms", "1000");
        props.setProperty("key.deserializer", "org.apache.kafka.common.serialization.StringDeserializer");
        props.setProperty("value.deserializer", "org.apache.kafka.common.serialization.StringDeserializer");
        KafkaConsumer<String, String> consumer = new KafkaConsumer<String, String>(props);
        consumer.subscribe(Arrays.asList("message"));
        //Prints the topic subscription list
        Set<String> subscribedTopics = consumer.subscription();
        for(String topic : subscribedTopics) {
        	System.out.println(topic);
        }
        
        
        try {
        	while(true) {
        		ConsumerRecords<String, String> records = consumer.poll(Duration.ofMillis(100));
        		for(ConsumerRecord<String, String> record : records) {
        			System.out.println(record.value());
        		}
        	}
        }finally {
			consumer.close();
		}

	}

}
