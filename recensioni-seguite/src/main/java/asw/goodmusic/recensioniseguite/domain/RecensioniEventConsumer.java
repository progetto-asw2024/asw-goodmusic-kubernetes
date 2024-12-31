package asw.goodmusic.recensioniseguite.domain;

import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import asw.goodmusic.common.api.DomainEvent;
import asw.goodmusic.recensioni.api.event.RecensioneCreatedEvent;
import asw.goodmusic.recensioni.api.event.RecensioneDeletedEvent;

@Service
public class RecensioniEventConsumer {
	
	@Autowired
	private RecensioniRepository recensioniRepository;

	private final Logger logger = Logger.getLogger(this.getClass().toString());

    public void onEvent(DomainEvent event) {
		if (event instanceof RecensioneCreatedEvent evt) {
			onRecensioneCreated(evt); 
		}else if (event instanceof RecensioneDeletedEvent evt){
			onRecensioneDeleted(evt); 
		} else {
			logger.info("UNKNOWN EVENT: " + event);			
		}
	}

	private void onRecensioneCreated(RecensioneCreatedEvent event) {
		RecensioneBreve recensione = new RecensioneBreve(event.getId(),event.getRecensore(),event.getAlbum(),event.getArtista(),event.getGenere(), event.getSunto());
		recensioniRepository.save(recensione);
		logger.info("CREATED RECENSIONE: " + recensione);
	}

	private void onRecensioneDeleted(RecensioneDeletedEvent event) {

		logger.info("DELETED RECENSIONE: ");
	}
}
