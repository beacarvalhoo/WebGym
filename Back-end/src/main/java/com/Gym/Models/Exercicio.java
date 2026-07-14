package com.Gym.Models;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "exercicios")
@Data
public class Exercicio {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true)
    private String nome;

    @ManyToOne
    @JoinColumn(name = "categoria_id", nullable = false)
    private Categoria categoria;
}
