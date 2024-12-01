package asw.goodmusic.connessioni.eventpublisher;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.kafka.core.KafkaTemplate;

import asw.goodmusic.common.api.DomainEvent;
import asw.goodmusic.connessioni.domain.ConnessioniEventPublisherPort;

public class ConnesioniEventKafkaPublisher implements ConnessioniEventPublisherPort  {

    @Value("${asw.kafka.channel.out}")
	private String channel;

    @Autowired
    private KafkaTemplate<String,DomainEvent> template;
    
    @Override
    public void publish(DomainEvent event) {
        template.send(channel,event);
    }

}
