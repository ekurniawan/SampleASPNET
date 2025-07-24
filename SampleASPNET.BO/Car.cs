using System;
using System.Collections.Generic;
using System.Text;

namespace SampleASPNET.BO
{
    public class Car
    {
        public int CarID { get; set; }
        public string Model { get; set; }
        public string Type { get; set; }
        public double? BasePrice { get; set; }
        public string Color { get; set; }
        public int? Stock { get; set; }

        public ICollection<DealerCar> DealerCars { get; set; }


    }
}
