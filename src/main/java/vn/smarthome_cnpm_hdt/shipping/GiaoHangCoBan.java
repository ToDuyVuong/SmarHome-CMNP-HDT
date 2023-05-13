package vn.smarthome_cnpm_hdt.shipping;

public class GiaoHangCoBan implements IShipping{
    @Override
    public long calculateShippingCost(long total) {
        if (total >= 300000) {
            return 0;
        }
        return 20000;
    }

}
