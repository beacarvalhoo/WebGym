package com.Gym.Controllers;

import com.Gym.Models.Exercicio;
import com.Gym.Repository.ExercicioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/exercicios")
public class ExercicioController {

    @Autowired
    private ExercicioRepository exercicioRepository;

    @GetMapping
    public List<Exercicio> listarTodos() {
        return exercicioRepository.findAll();
    }

    @PostMapping
    public ResponseEntity<Exercicio> criar(@RequestBody Exercicio exercicio) {
        Exercicio novoExercicio = exercicioRepository.save(exercicio);
        return ResponseEntity.status(HttpStatus.CREATED).body(novoExercicio);
    }
}
