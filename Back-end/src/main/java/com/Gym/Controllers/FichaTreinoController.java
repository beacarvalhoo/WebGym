package com.Gym.Controllers;

import com.Gym.DTO.FichaTreinoDTO;
import com.Gym.DTO.ItemTreinoDTO;
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
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@RestController
@RequestMapping("/fichas-treino")
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

    @PostMapping
    public ResponseEntity<FichaTreinoDTO> criar(@RequestBody FichaTreinoDTO fichaTreinoDTO) {
        FichaTreino fichaTreino = toEntity(fichaTreinoDTO);
        FichaTreino novaFichaTreino = fichaTreinoRepository.save(fichaTreino);
        return ResponseEntity.status(HttpStatus.CREATED).body(FichaTreinoDTO.fromEntity(novaFichaTreino));
    }

    @GetMapping("/{id}")
    public ResponseEntity<FichaTreinoDTO> buscarPorId(@PathVariable Long id) {
        return fichaTreinoRepository.findById(id)
                .map(ficha -> ResponseEntity.ok(FichaTreinoDTO.fromEntity(ficha)))
                .orElse(ResponseEntity.notFound().build());
    }

    private FichaTreino toEntity(FichaTreinoDTO fichaTreinoDTO) {
        Usuario aluno = usuarioRepository.findById(fichaTreinoDTO.alunoId())
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.BAD_REQUEST, "Aluno nao encontrado"));
        Usuario instrutor = fichaTreinoDTO.instrutorId() == null
                ? null
                : usuarioRepository.findById(fichaTreinoDTO.instrutorId())
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.BAD_REQUEST, "Instrutor nao encontrado"));

        FichaTreino fichaTreino = new FichaTreino();
        fichaTreino.setNomeTreino(fichaTreinoDTO.nomeTreino());
        fichaTreino.setAluno(aluno);
        fichaTreino.setInstrutor(instrutor);

        if (fichaTreinoDTO.itens() != null) {
            List<ItemTreino> itens = fichaTreinoDTO.itens().stream()
                    .map(itemDTO -> toItemTreino(itemDTO, fichaTreino))
                    .toList();
            fichaTreino.setItens(itens);
        }

        return fichaTreino;
    }

    private ItemTreino toItemTreino(ItemTreinoDTO itemTreinoDTO, FichaTreino fichaTreino) {
        Exercicio exercicio = exercicioRepository.findById(itemTreinoDTO.exercicioId())
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.BAD_REQUEST, "Exercicio nao encontrado"));

        ItemTreino itemTreino = new ItemTreino();
        itemTreino.setFicha(fichaTreino);
        itemTreino.setExercicio(exercicio);
        itemTreino.setSeries(itemTreinoDTO.series());
        itemTreino.setRepeticoes(itemTreinoDTO.repeticoes());
        itemTreino.setPeso(itemTreinoDTO.peso());

        return itemTreino;
    }
}
