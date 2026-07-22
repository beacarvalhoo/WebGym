package com.Gym.Controllers;

import com.Gym.DTO.FichaTreinoDTO;
import com.Gym.Models.Exercicio;
import com.Gym.Models.FichaTreino;
import com.Gym.Models.ItemTreino;
import com.Gym.Models.Usuario;
import com.Gym.Repository.ExercicioRepository;
import com.Gym.Repository.FichaTreinoRepository;
import com.Gym.Repository.UsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/fichas-treino")
@CrossOrigin(origins = "*")
public class FichaTreinoController {

    @Autowired
    private FichaTreinoRepository fichaTreinoRepository;

    @Autowired
    private UsuarioRepository usuarioRepository;

    @Autowired
    private ExercicioRepository exercicioRepository;

    @GetMapping
    public List<FichaTreinoDTO> listarTodas() {
        return fichaTreinoRepository.findAll().stream()
                .map(FichaTreinoDTO::fromEntity)
                .toList();
    }

    @GetMapping("/{id}")
    public ResponseEntity<FichaTreinoDTO> buscarPorId(@PathVariable Long id) {
        return fichaTreinoRepository.findById(id)
                .map(fichaTreino -> ResponseEntity.ok(FichaTreinoDTO.fromEntity(fichaTreino)))
                .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping
    public ResponseEntity<FichaTreinoDTO> criar(@RequestBody FichaTreinoDTO fichaTreinoDTO) {
        FichaTreino fichaTreino = toEntity(fichaTreinoDTO);
        FichaTreino novaFicha = fichaTreinoRepository.save(fichaTreino);

        return ResponseEntity.status(HttpStatus.CREATED).body(FichaTreinoDTO.fromEntity(novaFicha));
    }

    private FichaTreino toEntity(FichaTreinoDTO fichaTreinoDTO) {
        Usuario usuario = usuarioRepository.findById(fichaTreinoDTO.usuarioId())
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.BAD_REQUEST, "Usuário não encontrado"));

        FichaTreino fichaTreino = new FichaTreino();
        fichaTreino.setId(fichaTreinoDTO.id());
        fichaTreino.setNomeTreino(fichaTreinoDTO.nomeTreino());
        fichaTreino.setUsuario(usuario);
        fichaTreino.setItens(toItens(fichaTreinoDTO, fichaTreino));

        return fichaTreino;
    }

    private List<ItemTreino> toItens(FichaTreinoDTO fichaTreinoDTO, FichaTreino fichaTreino) {
        return Optional.ofNullable(fichaTreinoDTO.itens())
                .orElse(List.of())
                .stream()
                .map(itemTreinoDTO -> {
                    Exercicio exercicio = exercicioRepository.findById(itemTreinoDTO.exercicioId())
                            .orElseThrow(() -> new ResponseStatusException(
                                    HttpStatus.BAD_REQUEST,
                                    "Exercício não encontrado"
                            ));

                    ItemTreino itemTreino = new ItemTreino();
                    itemTreino.setId(itemTreinoDTO.id());
                    itemTreino.setFicha(fichaTreino);
                    itemTreino.setExercicio(exercicio);
                    itemTreino.setSeries(itemTreinoDTO.series());
                    itemTreino.setRepeticoes(itemTreinoDTO.repeticoes());
                    itemTreino.setPeso(itemTreinoDTO.peso());

                    return itemTreino;
                })
                .toList();
    }
}
