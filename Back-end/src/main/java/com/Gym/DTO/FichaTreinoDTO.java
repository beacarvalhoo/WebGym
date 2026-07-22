package com.Gym.DTO;

import com.Gym.Models.FichaTreino;
import java.util.List;

public record FichaTreinoDTO(
        Long id,
        String nomeTreino,
        Long usuarioId,
        String usuarioNome,
        List<ItemTreinoDTO> itens
) {

    public static FichaTreinoDTO fromEntity(FichaTreino fichaTreino) {

        Long usuarioId = fichaTreino.getUsuario() != null ? fichaTreino.getUsuario().getId() : null;
        String usuarioNome = fichaTreino.getUsuario() != null ? fichaTreino.getUsuario().getNome() : null;

        List<ItemTreinoDTO> itens = fichaTreino.getItens() == null
                ? List.of()
                : fichaTreino.getItens().stream()
                        .map(ItemTreinoDTO::fromEntity)
                        .toList();

        return new FichaTreinoDTO(
                fichaTreino.getId(),
                fichaTreino.getNomeTreino(),
                usuarioId,
                usuarioNome,
                itens
        );
    }
}
