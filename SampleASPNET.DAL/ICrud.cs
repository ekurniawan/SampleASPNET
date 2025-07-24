using System;
using System.Collections.Generic;
using System.Text;

namespace SampleASPNET.DAL
{
    public interface ICrud<T>
    {
        IEnumerable<T> GetAll();
        T GetById(int id);
        T Add(T entity);
        T Update(T entity);
        void Delete(int id);
    }
}
