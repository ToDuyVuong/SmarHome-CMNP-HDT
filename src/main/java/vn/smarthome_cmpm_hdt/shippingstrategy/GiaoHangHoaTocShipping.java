package vn.smarthome_cmpm_hdt.shippingstrategy;

public class GiaoHangHoaTocShipping implements IShipping{
    @Override
    public long calculateShippingCost(long total) {
        return 50000;
    }
}

