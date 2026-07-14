package com.Gym.Repository;

import com.Gym.Models.FichaTreino;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FichaTreinoRepository extends JpaRepository<FichaTreino, Long> {
}
