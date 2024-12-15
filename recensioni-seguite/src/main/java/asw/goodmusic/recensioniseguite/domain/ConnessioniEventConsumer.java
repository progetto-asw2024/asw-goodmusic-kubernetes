package asw.goodmusic.recensioniseguite.domain;

import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import asw.goodmusic.common.api.DomainEvent;
import asw.goodmusic.connessioni.api.event.ConnessioneCreatedEvent;
import asw.goodmusic.connessioni.api.event.ConnessioneDeletedEvent;

@Service
public class ConnessioniEventConsumer {
	
	@Autowired
	private ConnessioniRepository connessioniRepository;

	private final Logger logger = Logger.getLogger(this.getClass().toString());

    public void onEvent(DomainEvent event) {
		if (event instanceof ConnessioneCreatedEvent evt) {
			onConnessioneCreated(evt); 
		}else if (event instanceof ConnessioneDeletedEvent evt){
			onConnessioneDeleted(evt); 
		} else {
			logger.info("UNKNOWN EVENT: " + event);			
		}
	}

	private void onConnessioneCreated(ConnessioneCreatedEvent event) {
		Connessione connessione = new Connessione(event.getId(),event.getUtente(),event.getSeguito(),event.getRuolo());
		connessioniRepository.save(connessione);
		logger.info("CREATED CONNESSIONE: " + connessione);
	}

	private void onConnessioneDeleted(ConnessioneDeletedEvent event) {
		Connessione connessione = new Connessione(event.getId(),event.getUtente(),event.getSeguito(),event.getRuolo());
		connessioniRepository.delete(connessione);
		logger.info("DELETED CONNESSIONE: ");
	}
}
