package com.Gym.Repository;

import com.Gym.Models.ItemTreino;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ItemTreinoRepository extends JpaRepository<ItemTreino, Long> {
}
