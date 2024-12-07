package asw.goodmusic.connessioni.api.event;

import lombok.*;

@Data @NoArgsConstructor @AllArgsConstructor
public class ConnessioneCreatedEvent {

	private String utente; 
	private String seguito; 
	private String ruolo; 

}

