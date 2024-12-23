package asw.goodmusic.recensioni.api.event;

import lombok.*;
import asw.goodmusic.common.api.DomainEvent;
@Data @NoArgsConstructor @AllArgsConstructor
public class RecensioneCreatedEvent implements DomainEvent {
	private Long id; 
	private String recensore; 
	private String album; 
	private String artista; 
	private String genere; 
	private String sunto; 
}

