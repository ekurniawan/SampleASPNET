using SampleASPNET.BO;
using System;
using System.Collections.Generic;
using System.Text;

namespace SampleASPNET.DAL
{
    public interface ICar : ICrud<Car>
    {
        IEnumerable<Car> GetByModel(string model);
        IEnumerable<Car> GetByType(string type);
        IEnumerable<Car> GetByColor(string color);
    }
}
