package asw.goodmusic.connessioni.api.event;

import lombok.*;
import asw.goodmusic.common.api.DomainEvent;
@Data @NoArgsConstructor @AllArgsConstructor
public class ConnessioneDeletedEvent implements DomainEvent {
	
	private Long id; 
	private String utente; 
	private String seguito; 
	private String ruolo; 

}

