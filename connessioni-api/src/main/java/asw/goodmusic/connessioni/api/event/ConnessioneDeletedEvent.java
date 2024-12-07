package asw.goodmusic.connessioni.api.event;

import lombok.*;

@Data @NoArgsConstructor @AllArgsConstructor
public class ConnessioneDeletedEvent {

	private String utente; 
	private String seguito; 
	private String ruolo; 

}

