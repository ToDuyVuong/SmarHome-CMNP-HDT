package vn.smarthome_cnpm_hdt.shipping;

public class GiaoHangNhanh implements IShipping{
    @Override
    public long calculateShippingCost(long total) {
        return 30000;
    }
}
