using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data.SqlClient;

namespace wsEvaluacionProyecto
{
    /// <summary>
    /// Descripción breve de EvaluacionProyecto
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio Web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    // [System.Web.Script.Services.ScriptService]
    public class wsEvaluacionProyecto : System.Web.Services.WebService
    {

        string cad_conexion = "Data Source=.; Initial Catalog=NEG_MANDATE; Integrated Security=true";
        SqlConnection conn = null;

        [WebMethod]
        public bool testConection(string error)
        {
            conn = new SqlConnection(cad_conexion);
            try
            {
                conn.Open();
                return true;
            }
            catch (SqlException e)
            {
                error = "No se pudo conectar con BD" + e.Message.ToString();
                conn.Close();
                return false;
            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
            }
        }
    }
}
