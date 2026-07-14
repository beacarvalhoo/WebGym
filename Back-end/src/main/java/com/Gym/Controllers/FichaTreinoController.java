package com.Gym.Controllers;

import com.Gym.Models.FichaTreino;
import com.Gym.Repository.FichaTreinoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/fichas-treino")
public class FichaTreinoController {

    @Autowired
    private FichaTreinoRepository fichaTreinoRepository;

    @GetMapping
    public List<FichaTreino> listarTodas() {
        return fichaTreinoRepository.findAll();
    }

    @PostMapping
    public ResponseEntity<FichaTreino> criar(@RequestBody FichaTreino fichaTreino) {
        FichaTreino novaFichaTreino = fichaTreinoRepository.save(fichaTreino);
        return ResponseEntity.status(HttpStatus.CREATED).body(novaFichaTreino);
    }
}
