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

    @Column(name = "url_imagem")
    private String urlImagem;

    @ManyToOne
    @JoinColumn(name = "categoria_id", nullable = false)
    private Categoria categoria;
}
