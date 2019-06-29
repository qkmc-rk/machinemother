package xyz.ruankun.machinemother.service.impl;

import org.springframework.stereotype.Service;
import xyz.ruankun.machinemother.entity.Addr;
import xyz.ruankun.machinemother.repository.AddrRepository;
import xyz.ruankun.machinemother.service.AddrService;
import xyz.ruankun.machinemother.util.DataCode;
import xyz.ruankun.machinemother.util.EntityUtil;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
public class AddrServiceImpl implements AddrService {

    @Resource
    private AddrRepository addrRepository;

    @Override
    public Boolean update(Addr addr) {
        Addr check = getAddr(addr.getId());
        if (check == null)
            return false;
        else {
            addr.setGmtModified(new Date());
            EntityUtil.update(addr, check);     //更新数据
            try {
                addrRepository.save(addr);
                return true;
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }
        }
    }

    @Override
    public Addr getAddr(int id) {
        try {
            Addr addr = addrRepository.findById(id);
            if (addr == null) {
                addr = new Addr();
            }
            return addr;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public Boolean add(Addr addr) {
        try {
            addrRepository.save(addr);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public List<Addr> myAddr(int userId) {
        return addrRepository.findAllByUserId(userId);
    }

    @Override
    public Integer delete(int id) {
        Addr addr = getAddr(id);
        if (addr == null)
            return DataCode.DATA_CONFLIC;
        try {
            Integer result = addrRepository.deleteById(id);
            if (result <= 0){
                return DataCode.DATA_OPERATION_FAILURE;
            }else {
                return DataCode.DATA_OPERATION_SUCCESS;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return DataCode.DATA_OPERATION_ERROR;
        }
    }

    @Override
    public Integer deleteMyAddr(int userId) {
        try {
            Integer result = addrRepository.deleteByUserId(userId);
            if(result>0) {
                return DataCode.DATA_OPERATION_SUCCESS;
            }else{
                return DataCode.DATA_OPERATION_FAILURE;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return DataCode.DATA_OPERATION_ERROR;
        }
    }


}
