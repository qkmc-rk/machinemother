package xyz.ruankun.machinemother.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import xyz.ruankun.machinemother.entity.Addr;

import java.util.List;

public interface AddrService {

    Boolean update(Addr addr);

    Addr getAddr(int id);

    Boolean add(Addr addr);

    Page<Addr> addrs(Pageable pageable);

    List<Addr> myAddr(int userId);

    Integer delete(int id);

    Integer deleteMyAddr(int userId);
}
