package xyz.ruankun.machinemother.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import xyz.ruankun.machinemother.entity.Item;

public interface ItemRepository extends JpaRepository<Item, Integer> {
}
