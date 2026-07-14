package com.Gym.Models;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "fichas_treino")
@Data
public class FichaTreino {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "nome_treino", nullable = false)
    private String nomeTreino;

    @ManyToOne
    @JoinColumn(name = "aluno_id", nullable = false)
    private Usuario aluno;

    @ManyToOne
    @JoinColumn(name = "instrutor_id")
    private Usuario instrutor;
}
