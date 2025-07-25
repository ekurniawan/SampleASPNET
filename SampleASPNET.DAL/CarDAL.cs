using SampleASPNET.BO;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;

namespace SampleASPNET.DAL
{
    public class CarDAL : ICar
    {
        public Car Add(Car entity)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(Helpers.GetConnectionString()))
                {
                    string strSql = @"INSERT INTO Car (Model, Type, BasePrice, Color, Stock) 
                                    VALUES (@Model, @Type, @BasePrice, @Color, @Stock);
                                    SELECT SCOPE_IDENTITY();";
                    SqlCommand cmd = new SqlCommand(strSql, conn);
                    cmd.Parameters.AddWithValue("@Model", entity.Model);
                    cmd.Parameters.AddWithValue("@Type", entity.Type);
                    cmd.Parameters.AddWithValue("@BasePrice", entity.BasePrice);
                    cmd.Parameters.AddWithValue("@Color", entity.Color);
                    cmd.Parameters.AddWithValue("@Stock", entity.Stock);
                    conn.Open();
                    int carId = Convert.ToInt32(cmd.ExecuteScalar());
                    entity.CarID = carId; // Set the CarID of the entity to the newly created ID
                    return entity; // Return the entity with the new CarID
                }
            }
            catch (SqlException sqlEx)
            {
                throw new ArgumentException($"{sqlEx.Number} - {sqlEx.Message}");
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while adding the car.", ex);
            }
        }

        public void Delete(int id)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(Helpers.GetConnectionString()))
                {
                    string strSql = @"DELETE FROM Car WHERE CarID = @CarID";
                    SqlCommand cmd = new SqlCommand(strSql, conn);
                    cmd.Parameters.AddWithValue("@CarID", id);
                    conn.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();
                    if (rowsAffected == 0)
                    {
                        throw new ArgumentException("No car found with the specified ID.");
                    }
                }
            }
            catch (SqlException sqlEx)
            {
                throw new ArgumentException($"{sqlEx.Number} - {sqlEx.Message}");
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public IEnumerable<Car> GetAll()
        {
            List<Car> cars = new List<Car>();
            using (SqlConnection conn = new SqlConnection(Helpers.GetConnectionString()))
            {
                string strSql = "SELECT * FROM Car order by Model asc";
                SqlCommand cmd = new SqlCommand(strSql, conn);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Car car = new Car
                    {
                        CarID = Convert.ToInt32(reader["CarID"]),
                        Model = reader["Model"].ToString(),
                        Type = reader["Type"].ToString(),
                        BasePrice = Convert.ToDouble(reader["BasePrice"]),
                        Color = reader["Color"].ToString(),
                        Stock = Convert.ToInt32(reader["Stock"])
                    };
                    cars.Add(car);
                }
            }
            return cars;
        }

        public IEnumerable<Car> GetByColor(string color)
        {
            throw new NotImplementedException();
        }

        public Car GetById(int id)
        {
            using (SqlConnection conn = new SqlConnection(Helpers.GetConnectionString()))
            {
                string strSql = @"SELECT * FROM Car WHERE CarID = @CarID";
                SqlCommand cmd = new SqlCommand(strSql, conn);
                cmd.Parameters.AddWithValue("@CarID", id);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    Car car = new Car
                    {
                        CarID = Convert.ToInt32(reader["CarID"]),
                        Model = reader["Model"].ToString(),
                        Type = reader["Type"].ToString(),
                        BasePrice = Convert.ToDouble(reader["BasePrice"]),
                        Color = reader["Color"].ToString(),
                        Stock = Convert.ToInt32(reader["Stock"])
                    };
                    return car;
                }
                else
                {
                    return null; // or throw an exception if preferred
                }
            }
        }

        public IEnumerable<Car> GetByModel(string model)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Car> GetByType(string type)
        {
            throw new NotImplementedException();
        }

        public Car Update(Car entity)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(Helpers.GetConnectionString()))
                {
                    string strSql = @"UPDATE Car 
                                  SET Model = @Model, Type = @Type, BasePrice = @BasePrice, 
                                      Color = @Color, Stock = @Stock 
                                  WHERE CarID = @CarID";
                    SqlCommand cmd = new SqlCommand(strSql, conn);
                    cmd.Parameters.AddWithValue("@CarID", entity.CarID);
                    cmd.Parameters.AddWithValue("@Model", entity.Model);
                    cmd.Parameters.AddWithValue("@Type", entity.Type);
                    cmd.Parameters.AddWithValue("@BasePrice", entity.BasePrice);
                    cmd.Parameters.AddWithValue("@Color", entity.Color);
                    cmd.Parameters.AddWithValue("@Stock", entity.Stock);
                    conn.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();
                    if (rowsAffected > 0)
                    {
                        return entity; // Return the updated entity
                    }
                    else
                    {
                        return null; // or throw an exception if preferred
                    }
                }
            }
            catch (SqlException sqlEx)
            {
                throw new ArgumentException($"{sqlEx.Number} - {sqlEx.Message}");
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}
