using System;
using System.Collections.Generic;
using System.Text;

namespace SampleASPNET.BLL.DTO
{
    public class CarAddDTO
    {
        public string Model { get; set; }
        public string Type { get; set; }
        public double? BasePrice { get; set; }
        public string Color { get; set; }
        public int? Stock { get; set; }
    }
}
