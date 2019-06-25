package xyz.ruankun.machinemother.service.impl;

import org.springframework.stereotype.Service;
import xyz.ruankun.machinemother.entity.Addr;
import xyz.ruankun.machinemother.repository.AddrRepository;
import xyz.ruankun.machinemother.service.AddrService;
import xyz.ruankun.machinemother.util.EntityUtil;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
public class AddrServiceImpl implements AddrService {

    @Resource
    private AddrRepository addrRepository;

    @Override
    public Addr update(Addr addr) {
        Addr check = getAddr(addr.getId());
        if (check == null)
            return null;
        else {
            addr.setGmtModefied(new Date());
            EntityUtil.update(addr, check);     //更新数据
            return addrRepository.save(addr);
        }
    }

    @Override
    public Addr getAddr(int id) {
        return addrRepository.findById(id);
    }

    @Override
    public Addr add(Addr addr) {
        return addrRepository.save(addr);
    }

    @Override
    public List<Addr> myAddr(int userId) {
        return addrRepository.findAllByUserId(userId);
    }

    @Override
    public int delete(int id) {
        Addr addr = getAddr(id);
        if (addr == null)
            return -1;
        return addrRepository.deleteById(id);
    }

    @Override
    public int deleteMyAddr(int userId) {
        return addrRepository.deleteByUserId(userId);
    }


}
