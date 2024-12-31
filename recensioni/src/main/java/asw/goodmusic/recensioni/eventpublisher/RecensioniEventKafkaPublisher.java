package asw.goodmusic.recensioni.eventpublisher;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Service;

import asw.goodmusic.common.api.DomainEvent;
import asw.goodmusic.recensioni.domain.RecensioniEventPublisherPort;

@Service
public class RecensioniEventKafkaPublisher implements RecensioniEventPublisherPort  {

    @Value("${asw.kafka.channel.out}")
	private String channel;

    @Autowired
    private KafkaTemplate<String,DomainEvent> template;
    
    @Override
    public void publish(DomainEvent event) {
        template.send(channel,event);
    }

}
