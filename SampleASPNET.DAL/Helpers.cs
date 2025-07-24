using System;
using System.Collections.Generic;
using System.Configuration;
using System.Text;

namespace SampleASPNET.DAL
{
    public static class Helpers
    {
        public static string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["AutomotiveDBConnectionString"].ConnectionString;
        }

    }
}
