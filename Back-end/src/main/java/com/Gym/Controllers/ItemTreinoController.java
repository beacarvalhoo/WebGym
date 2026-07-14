package com.Gym.Controllers;

import com.Gym.Models.ItemTreino;
import com.Gym.Repository.ItemTreinoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/itens-treino")
public class ItemTreinoController {

    @Autowired
    private ItemTreinoRepository itemTreinoRepository;

    @GetMapping
    public List<ItemTreino> listarTodos() {
        return itemTreinoRepository.findAll();
    }

    @PostMapping
    public ResponseEntity<ItemTreino> criar(@RequestBody ItemTreino itemTreino) {
        ItemTreino novoItemTreino = itemTreinoRepository.save(itemTreino);
        return ResponseEntity.status(HttpStatus.CREATED).body(novoItemTreino);
    }
}
