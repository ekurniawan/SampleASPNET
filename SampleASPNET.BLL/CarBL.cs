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

        public CarDTO AddCar(CarAddDTO newCar)
        {
            if (newCar == null)
            {
                throw new ArgumentNullException(nameof(newCar), "New car cannot be null");
            }
            var car = new Car
            {
                Model = newCar.Model,
                Type = newCar.Type,
                BasePrice = newCar.BasePrice,
                Color = newCar.Color,
                Stock = newCar.Stock
            };
            var addedCar = carDAL.Add(car);

            var results = new CarDTO
            {
                CarID = addedCar.CarID,
                Model = addedCar.Model,
                Type = addedCar.Type,
                BasePrice = addedCar.BasePrice,
                Color = addedCar.Color,
                Stock = addedCar.Stock
            };

            return results;
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
            var car = carDAL.GetById(carID);
            if (car == null)
            {
                return null;
            }

            return new CarDTO
            {
                CarID = car.CarID,
                Model = car.Model,
                Type = car.Type,
                BasePrice = car.BasePrice,
                Color = car.Color,
                Stock = car.Stock
            };
        }

        public CarDTO UpdateCar(CarUpdateDTO updateCar)
        {
            throw new NotImplementedException();
        }
    }
}
