using SampleASPNET.BLL.DTO;
using SampleASPNET.BO;
using SampleASPNET.DAL;
using System;
using System.Collections.Generic;
using System.Text;

namespace SampleASPNET.BLL
{
    public class CarBL : ICarBL
    {
        private ICar carDAL;
        public CarBL()
        {
            carDAL = new CarDAL();
        }

        public void AddCar(CarDTO car)
        {
            throw new NotImplementedException();
        }

        public void DeleteCar(int carID)
        {
            throw new NotImplementedException();
        }

        public List<CarDTO> GetAllCars()
        {
            List<CarDTO> carDtos = new List<CarDTO>();
            var results = carDAL.GetAll();
            foreach (var car in results)
            {
                carDtos.Add(new CarDTO
                {
                    CarID = car.CarID,
                    Model = car.Model,
                    Type = car.Type,
                    BasePrice = car.BasePrice,
                    Color = car.Color,
                    Stock = car.Stock
                });
            }
            return carDtos;
        }

        public CarDTO GetCarByID(int carID)
        {
            throw new NotImplementedException();
        }

        public void UpdateCar(CarDTO car)
        {
            throw new NotImplementedException();
        }
    }
}
