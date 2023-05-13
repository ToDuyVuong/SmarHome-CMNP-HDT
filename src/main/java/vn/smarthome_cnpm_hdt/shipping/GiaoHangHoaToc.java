package vn.smarthome_cnpm_hdt.shipping;

public class GiaoHangHoaToc implements IShipping{
    @Override
    public long calculateShippingCost(long total) {
        return 50000;
    }
}

