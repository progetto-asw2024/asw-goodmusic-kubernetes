package asw.goodmusic.connessioni.domain;
import  asw.goodmusic.common.api.DomainEvent;


public interface ConnessioniEventPublisherPort {
    public void publish(DomainEvent event);
}
