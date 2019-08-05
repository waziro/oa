package com.waziro.oa.dto;

import com.waziro.oa.entity.ClaimVoucher;
import com.waziro.oa.entity.ClaimVoucherItem;

import java.util.List;

public class ClaimVoucherInfo {

    private ClaimVoucher claimVoucher;          // 报销单
    private List<ClaimVoucherItem> items;       // 报销单条目

    public ClaimVoucher getClaimVoucher() {
        return claimVoucher;
    }

    public void setClaimVoucher(ClaimVoucher claimVoucher) {
        this.claimVoucher = claimVoucher;
    }

    public List<ClaimVoucherItem> getItems() {
        return items;
    }

    public void setItems(List<ClaimVoucherItem> items) {
        this.items = items;
    }
}
