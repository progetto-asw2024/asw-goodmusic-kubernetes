package asw.goodmusic.recensioniseguite.messagelistner.kafka;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import asw.goodmusic.common.api.DomainEvent;
import asw.goodmusic.recensioniseguite.domain.ConnessioniEventConsumer;

import org.springframework.kafka.annotation.KafkaListener;

import java.util.logging.Logger;

import org.apache.kafka.clients.consumer.ConsumerRecord;
@Component
public class ConnessioniEventKafkaListener {
    @Autowired
    private ConnessioniEventConsumer connessioniEventConsumer;
    private final Logger logger = Logger.getLogger(this.getClass().toString());
    @Value("${asw.kafka.channel.in1}")
    private String channel;

    @Value("${asw.kafka.groupid}")
    private String groupId;
    
    @KafkaListener(topics =  "${asw.kafka.channel.in1}", groupId="${asw.kafka.groupid}")
    public void listen(ConsumerRecord<String, DomainEvent> record) throws Exception {
        logger.info("MESSAGE LISTENER: " + record.toString());
        DomainEvent event = record.value();
        connessioniEventConsumer.onEvent(event); 
    }
}
