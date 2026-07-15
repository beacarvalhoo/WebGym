package com.Gym.DTO;

import com.Gym.Models.FichaTreino;

import java.util.List;

public record FichaTreinoDTO(
        Long id,
        String nomeTreino,
        Long alunoId,
        String alunoNome,
        Long instrutorId,
        String instrutorNome,
        List<ItemTreinoDTO> itens
) {

    public static FichaTreinoDTO fromEntity(FichaTreino fichaTreino) {
        Long alunoId = fichaTreino.getAluno() != null ? fichaTreino.getAluno().getId() : null;
        String alunoNome = fichaTreino.getAluno() != null ? fichaTreino.getAluno().getNome() : null;
        Long instrutorId = fichaTreino.getInstrutor() != null ? fichaTreino.getInstrutor().getId() : null;
        String instrutorNome = fichaTreino.getInstrutor() != null ? fichaTreino.getInstrutor().getNome() : null;
        List<ItemTreinoDTO> itens = fichaTreino.getItens() == null
                ? List.of()
                : fichaTreino.getItens().stream()
                .map(ItemTreinoDTO::fromEntity)
                .toList();

        return new FichaTreinoDTO(
                fichaTreino.getId(),
                fichaTreino.getNomeTreino(),
                alunoId,
                alunoNome,
                instrutorId,
                instrutorNome,
                itens
        );
    }
}
