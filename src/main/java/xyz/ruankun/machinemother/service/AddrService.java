package xyz.ruankun.machinemother.service;

import xyz.ruankun.machinemother.entity.Addr;

import java.util.List;

public interface AddrService {

    Addr update(Addr addr);

    Addr getAddr(int id);

    Addr add(Addr addr);

    List<Addr> myAddr(int userId);

    int delete(int id);

    int deleteMyAddr(int userId);
}
