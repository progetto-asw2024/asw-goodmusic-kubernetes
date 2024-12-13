package asw.goodmusic.recensioniseguite.domain;

import jakarta.persistence.*; 

import lombok.*; 

/* Recensione di un album scritta da un recensore. */ 
@Entity 
@Data @NoArgsConstructor
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class Recensione implements Comparable<Recensione> {

	/* id della recensione */
	@Id 
	@EqualsAndHashCode.Include
	private Long id; 
	
	/* chi ha scritto la recensione */ 
	private String recensore; 
	/* album oggetto della recensione */ 
	private String album; 
	/* artista autore dell'album */ 
	private String artista; 
	/* genere dell'album */ 
	private String genere; 
	/* sunto del testo della recensione */ 
	private String sunto; 


	public Recensione(Long id, String recensore, String album, String artista, String genere, String sunto) {
		this();
		this.id = id;
		this.recensore = recensore; 
		this.album = album; 
		this.artista = artista; 
		this.genere = genere; 
		this.sunto = sunto; 
	}

	@Override
	public int compareTo(Recensione other) {
		return this.id.compareTo(other.id); 
	}
	
}
