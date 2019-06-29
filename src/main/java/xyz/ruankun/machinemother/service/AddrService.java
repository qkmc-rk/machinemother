package xyz.ruankun.machinemother.service;

import xyz.ruankun.machinemother.entity.Addr;

import java.util.List;

public interface AddrService {

    Boolean update(Addr addr);

    Addr getAddr(int id);

    Boolean add(Addr addr);

    List<Addr> myAddr(int userId);

    Integer delete(int id);

    Integer deleteMyAddr(int userId);
}
