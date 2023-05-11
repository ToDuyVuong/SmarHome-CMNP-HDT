package vn.smarthome_cnpm_hdt.shippingstrategy;

public class GiaoHangNhanhShipping  implements IShipping{
    @Override
    public long calculateShippingCost(long total) {
        return 30000;
    }
}
