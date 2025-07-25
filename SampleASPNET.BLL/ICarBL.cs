using SampleASPNET.BLL.DTO;
using System;
using System.Collections.Generic;
using System.Text;

namespace SampleASPNET.BLL
{
    public interface ICarBL
    {
        /// <summary>
        /// Gets all cars.
        /// </summary>
        /// <returns>A list of car DTOs.</returns>
        List<CarDTO> GetAllCars();
        /// <summary>
        /// Gets a car by its ID.
        /// </summary>
        /// <param name="carID">The ID of the car.</param>
        /// <returns>A car DTO if found, otherwise null.</returns>
        CarDTO GetCarByID(int carID);
        /// <summary>
        /// Adds a new car.
        /// </summary>
        /// <param name="car">The car DTO to add.</param>
        void AddCar(CarDTO car);
        /// <summary>
        /// Updates an existing car.
        /// </summary>
        /// <param name="car">The car DTO with updated information.</param>
        void UpdateCar(CarDTO car);
        /// <summary>
        /// Deletes a car by its ID.
        /// </summary>
        /// <param name="carID">The ID of the car to delete.</param>
        void DeleteCar(int carID);
    }
}
