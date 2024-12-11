package asw.goodmusic.recensioni.api.event;

import lombok.*;
import asw.goodmusic.common.api.DomainEvent;
@Data @NoArgsConstructor @AllArgsConstructor
public class RecensioneDeletedEvent implements DomainEvent {

	private String utente; 
	private String seguito; 
	private String ruolo; 

}

