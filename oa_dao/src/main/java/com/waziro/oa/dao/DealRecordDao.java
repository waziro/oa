package com.waziro.oa.dao;

import com.waziro.oa.entity.DealRecord;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository("dealRecordDao")
public interface DealRecordDao {

    void insert(DealRecord dealRecord);
    List<DealRecord> selectByClaimVoucher(int cvid);
}
