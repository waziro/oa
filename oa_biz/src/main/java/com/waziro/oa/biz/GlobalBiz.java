package com.waziro.oa.biz;

import com.waziro.oa.entity.Employee;

public interface GlobalBiz {

    Employee login(String sn,String password);
    void changePassword(Employee employee);
}
