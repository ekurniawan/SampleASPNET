using System;
using System.Collections.Generic;
using System.Text;

namespace SampleASPNET.BO
{
    public class Dealer
    {
        public int DealerID { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public string PhoneNumber { get; set; }
        public string Email { get; set; }
        public bool Status { get; set; }

        public ICollection<DealerCar> DealerCars { get; set; }
    }
}
