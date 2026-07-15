package com.Gym.Controllers;

import com.Gym.DTO.ItemTreinoDTO;
import com.Gym.Models.Exercicio;
import com.Gym.Models.FichaTreino;
import com.Gym.Models.ItemTreino;
import com.Gym.Repository.ExercicioRepository;
import com.Gym.Repository.FichaTreinoRepository;
import com.Gym.Repository.ItemTreinoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@RestController
@RequestMapping("/itens-treino")
@CrossOrigin(origins = "*")
public class ItemTreinoController {

    @Autowired
    private ItemTreinoRepository itemTreinoRepository;

    @Autowired
    private FichaTreinoRepository fichaTreinoRepository;

    @Autowired
    private ExercicioRepository exercicioRepository;

    @GetMapping
    public List<ItemTreinoDTO> listarTodos() {
        return itemTreinoRepository.findAll().stream()
                .map(ItemTreinoDTO::fromEntity)
                .toList();
    }

    @PostMapping
    public ResponseEntity<ItemTreinoDTO> criar(@RequestBody ItemTreinoDTO itemTreinoDTO) {
        ItemTreino itemTreino = toEntity(itemTreinoDTO);
        ItemTreino novoItemTreino = itemTreinoRepository.save(itemTreino);
        return ResponseEntity.status(HttpStatus.CREATED).body(ItemTreinoDTO.fromEntity(novoItemTreino));
    }

    private ItemTreino toEntity(ItemTreinoDTO itemTreinoDTO) {
        FichaTreino fichaTreino = fichaTreinoRepository.findById(itemTreinoDTO.fichaId())
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.BAD_REQUEST, "Ficha de treino nao encontrada"));
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
