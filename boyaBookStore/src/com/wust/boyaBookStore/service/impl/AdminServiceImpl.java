package com.wust.boyaBookStore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import com.wust.boyaBookStore.mapper.AdminMapper;
import com.wust.boyaBookStore.po.Admin;
import com.wust.boyaBookStore.po.AdminExample;
import com.wust.boyaBookStore.po.AdminExample.Criteria;
import com.wust.boyaBookStore.service.AdminService;

public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminMapper adminMapper;
    @Override
    public Admin login(Admin form) {
        AdminExample adminExample=new AdminExample();
        Criteria criteria = adminExample.createCriteria();
        criteria.andAdminnameEqualTo(form.getAdminname());
        criteria.andAdminpwdEqualTo(form.getAdminpwd());
        List<Admin> list = adminMapper.selectByExample(adminExample);
        return list.size()>0?list.get(0):null;
    }

}
