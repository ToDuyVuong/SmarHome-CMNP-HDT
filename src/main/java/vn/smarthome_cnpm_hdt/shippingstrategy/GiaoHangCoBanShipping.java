package vn.smarthome_cnpm_hdt.shippingstrategy;

public class GiaoHangCoBanShipping implements IShipping{
    @Override
    public long calculateShippingCost(long total) {
        if (total >= 300000) {
            return 0;
        }
        return 20000;
    }

}
