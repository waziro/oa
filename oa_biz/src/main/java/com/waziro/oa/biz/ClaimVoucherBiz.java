package com.waziro.oa.biz;

import com.waziro.oa.entity.ClaimVoucher;
import com.waziro.oa.entity.ClaimVoucherItem;
import com.waziro.oa.entity.DealRecord;

import java.util.List;

public interface ClaimVoucherBiz {

    void save(ClaimVoucher claimVoucher, List<ClaimVoucherItem> items);
    ClaimVoucher get(int id);
    List<ClaimVoucherItem> getItems(int cvid);
    List<DealRecord> getRecords(int cvid);

    List<ClaimVoucher> getForSelf(String sn);   // 根据创建人编号获取报销单
    List<ClaimVoucher> getForDeal(String sn);   // 根据处理人编号获取报销单

    void update(ClaimVoucher claimVoucher,List<ClaimVoucherItem> items);
    void submit(int id);
    void deal(DealRecord dealRecord);
}
