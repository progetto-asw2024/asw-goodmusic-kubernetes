package asw.goodmusic.recensioniseguite.domain;

import java.util.Collection;
import java.util.TreeSet;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

@Service
@Primary
public class RecensioniSeguiteServiceKafkaBasedImpl implements RecensioniSeguiteService {
    @Autowired
    private ConnessioniRepository connessioniRepository;

    @Autowired
    private RecensioniRepository recensioniRepository;

    @Override
    public Collection<RecensioneBreve> getRecensioniSeguite(String utente) {

        Collection<RecensioneBreve> recensioniSeguite = new TreeSet<>(); 
		
		Collection<Connessione> connessioni = connessioniRepository.findByUtente(utente); 

        Collection<String> artistiSeguiti = 
			connessioni
				.stream()
				.filter(c -> c.getRuolo().equals("ARTISTA"))
				.map(c -> c.getSeguito())
				.collect(Collectors.toSet()); 
		if (artistiSeguiti.size()>0) {
			Collection<RecensioneBreve> recensioniDiArtisti = recensioniRepository.findByArtistaIn(artistiSeguiti);
			recensioniSeguite.addAll(recensioniDiArtisti); 
		}

		Collection<String> recensoriSeguiti = 
			connessioni
				.stream()
				.filter(c -> c.getRuolo().equals("RECENSORE"))
				.map(c -> c.getSeguito())
				.collect(Collectors.toSet()); 
		if (recensoriSeguiti.size()>0) {
			Collection<RecensioneBreve> recensioniDiRecensori = recensioniRepository.findByRecensoreIn(recensoriSeguiti);
			recensioniSeguite.addAll(recensioniDiRecensori); 
		}

        Collection<String> generiSeguiti = 
			connessioni
				.stream()
				.filter(c -> c.getRuolo().equals("GENERE"))
				.map(c -> c.getSeguito())
				.collect(Collectors.toSet()); 
		if (generiSeguiti.size()>0) {
			Collection<RecensioneBreve> recensioniDiGeneri = recensioniRepository.findByGenereIn(generiSeguiti);
			recensioniSeguite.addAll(recensioniDiGeneri); 
		}

        return recensioniSeguite;
    }

}
