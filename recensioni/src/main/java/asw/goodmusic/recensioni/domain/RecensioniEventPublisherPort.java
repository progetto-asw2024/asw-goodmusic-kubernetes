package asw.goodmusic.recensioni.domain;
import  asw.goodmusic.common.api.DomainEvent;

public interface RecensioniEventPublisherPort {
    public void publish(DomainEvent event);
}
