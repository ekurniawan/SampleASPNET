using System;
using System.Collections.Generic;
using System.Text;

namespace SampleASPNET.BO
{
    public class DealerCar
    {
        public int DealerCarID { get; set; }
        public int CarID { get; set; }
        public int DealerID { get; set; }
        public double Price { get; set; }
        public int Stock { get; set; }
        public double? DiscountPercent { get; set; }
        public double? FeePercent { get; set; }

        public Car Car { get; set; }
        public Dealer Dealer { get; set; }
    }
}
