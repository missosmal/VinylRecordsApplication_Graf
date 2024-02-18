using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace VinylRecordsApplication_Graf.Classes
{
    public class DBConnection
    {
        public static DataTable Connection(string SQL)
        {
            DataTable dataTable = new DataTable("Datatable");
            SqlConnection sqlConnection = new SqlConnection("server=student.permaviat.ru; Trusted_Connection=No;DataBase=***;User=ISP_21_2_4;PWD=48W1fRIrB#");
            sqlConnection.Open();
            SqlCommand sqlCommand = sqlConnection.CreateCommand();
            sqlCommand.CommandText = SQL;
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            sqlDataAdapter.Fill(dataTable);
            return dataTable;
        }
    }
}
