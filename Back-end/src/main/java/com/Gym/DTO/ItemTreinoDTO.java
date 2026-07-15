package com.Gym.DTO;

import com.Gym.Models.ItemTreino;

import java.math.BigDecimal;

public record ItemTreinoDTO(
        Long id,
        Long fichaId,
        Long exercicioId,
        String exercicioNome,
        Integer series,
        Integer repeticoes,
        BigDecimal peso
) {

    public static ItemTreinoDTO fromEntity(ItemTreino itemTreino) {
        Long fichaId = itemTreino.getFicha() != null ? itemTreino.getFicha().getId() : null;
        Long exercicioId = itemTreino.getExercicio() != null ? itemTreino.getExercicio().getId() : null;
        String exercicioNome = itemTreino.getExercicio() != null ? itemTreino.getExercicio().getNome() : null;

        return new ItemTreinoDTO(
                itemTreino.getId(),
                fichaId,
                exercicioId,
                exercicioNome,
                itemTreino.getSeries(),
                itemTreino.getRepeticoes(),
                itemTreino.getPeso()
        );
    }
}
