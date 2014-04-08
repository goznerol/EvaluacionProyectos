using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Data;

namespace EvaluacionProyecto
{
    public partial class Main : System.Web.UI.Page
    {
        public string StringConexionName = System.Configuration.ConfigurationManager.ConnectionStrings["raceaward"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnConsultaProyecto_Click(object sender, EventArgs e)
        {
            int i = 14;
            obtieneDatosGenerales(i);
            obtienePruebasValidacion(i);
            obtieneVision(i);
            obtienePortafolioMetas(i);
            obtieneEstrategiasRed(i);
            obtieneDesgloceTrabajo(i);
            obtieneAreasGrises(i);
            obtieneImpactoMision(i);
            obtieneMetasCumplidas(i);
            obtieneAdmonRecursos(i);
            obtieneMovRecursos(i);
            obtieneBenchmark(i);
            ClientScript.RegisterStartupScript(this.GetType(), "myScript", "cambiarvista('divCadenaValor',menuCadenaValor)", true);
        }

        protected void obtieneDatosGenerales(int idProyecto) 
        {
            SqlConnection conn = null;
            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable();

            conn = new SqlConnection(StringConexionName);
            try
            {
                conn.Open();

                SqlCommand query = new SqlCommand("SP_OBTIENE_DATOS_GENERALES", conn);
                query.CommandType = CommandType.StoredProcedure;
                query.Parameters.AddWithValue("@idProyecto", idProyecto);
                da.SelectCommand = query;
                da.Fill(dt);

                lblIdProyecto.Text = dt.Rows[0]["idProyecto"].ToString();
                lblFechaDefinicion.Text = dt.Rows[0]["fechaDefinicion"].ToString();
                lblNombreProyecto.Text = dt.Rows[0]["nomProyecto"].ToString();
                lblDefinicionAlcance.Text = dt.Rows[0]["alcanceProyecto"].ToString();
                lblEfectosAdversos.Text = dt.Rows[0]["efadvProyecto"].ToString();
                lblLiderProyecto.Text = dt.Rows[0]["liderProyecto"].ToString();
                lblIntegrantes.Text = dt.Rows[0]["integrantesProyecto"].ToString();
                lblCategoria.Text = dt.Rows[0]["catProyecto"].ToString();
                lblRazonConduccion.Text = dt.Rows[0]["razonProyecto"].ToString();
                lblPrioridadPeso.Text = dt.Rows[0]["prioridadProyecto"].ToString();
                lblResumen.Text = dt.Rows[0]["resumenProyecto"].ToString();

            }
            catch (SqlException ex)
            {

                conn.Close();

            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
            }
        }

        protected void obtienePruebasValidacion(int idProyecto) 
        {
            SqlConnection conn = null;
            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable();

            conn = new SqlConnection(StringConexionName);
            try
            {
                conn.Open();

                SqlCommand query = new SqlCommand("SP_OBTIENE_VALIDACION_METAS", conn);
                query.CommandType = CommandType.StoredProcedure;
                query.Parameters.AddWithValue("@idProyecto", idProyecto);
                da.SelectCommand = query;
                da.Fill(dt);

                chkMetasTerminologia.Checked = Convert.ToBoolean(dt.Rows[0]["terminologiaClara"]);
                chkMetasIntereses.Checked = Convert.ToBoolean(dt.Rows[0]["interesesValidados"]);
                chkMetasMotivos.Checked = Convert.ToBoolean(dt.Rows[0]["motivosOcultos"]);
                chkMetasValores.Checked = Convert.ToBoolean(dt.Rows[0]["valoresEtica"]);
                chkMetasAnalisis.Checked = Convert.ToBoolean(dt.Rows[0]["anaInteresados"]);
                txtTeminologiaExplicacion.Text = dt.Rows[0]["descTermClara"].ToString();
                txtMetasIntereses.Text = dt.Rows[0]["descIntValidados"].ToString();
                txtMertasMotivos.Text = dt.Rows[0]["descMotOcultos"].ToString();
                txtMetasValores.Text = dt.Rows[0]["descValEtica"].ToString();
                txtMetasAnalisis.Text = dt.Rows[0]["descAnaInteresados"].ToString();
                
            }
            catch (SqlException ex)
            {

                conn.Close();

            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
            }
           
                ClientScript.RegisterStartupScript(this.GetType(), "myScript", "mostrarocultar('trMetas1',chkMetasTerminologia)", true);
            
                ClientScript.RegisterStartupScript(this.GetType(), "myScript", "mostrarocultar('trMetas2',chkMetasIntereses)", true);
            
                ClientScript.RegisterStartupScript(this.GetType(), "myScript", "mostrarocultar('trMetas3',chkMetasMotivos)", true);
            
                ClientScript.RegisterStartupScript(this.GetType(), "myScript", "mostrarocultar('trMetas4',chkMetasValores)", true);
            
                ClientScript.RegisterStartupScript(this.GetType(), "myScript", "mostrarocultar('trMetas5',chkMetasAnalisis)", true);
        }

        protected void obtieneVision(int idProyecto) 
        {
            SqlConnection conn = null;
            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable();

            conn = new SqlConnection(StringConexionName);
            try
            {
                conn.Open();

                SqlCommand query = new SqlCommand("SP_OBTIENE_VISION", conn);
                query.CommandType = CommandType.StoredProcedure;
                query.Parameters.AddWithValue("@idProyecto", idProyecto);
                da.SelectCommand = query;
                da.Fill(dt);

                lblVision.Text = dt.Rows[0]["misionProyecto"].ToString();
                
            }
            catch (SqlException ex)
            {

                conn.Close();

            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
            }
        }

        protected void obtienePortafolioMetas(int idProyecto)
        {
            SqlConnection conn = null;
            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable();

            conn = new SqlConnection(StringConexionName);
            try
            {
                conn.Open();

                SqlCommand query = new SqlCommand("SP_OBTIENE_METAS", conn);
                query.CommandType = CommandType.StoredProcedure;
                query.Parameters.AddWithValue("@idProyecto", idProyecto);
                da.SelectCommand = query;
                da.Fill(dt);

                for (int i = 0; i < dt.Rows.Count; i++ )
                     lblPortMetas.Text += dt.Rows[i]["descObjetivos"].ToString() + "<br/>";

            }
            catch (SqlException ex)
            {

                conn.Close();

            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
            }
        }

        protected void obtieneEstrategiasRed(int idProyecto)
        {
            SqlConnection conn = null;
            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable();

            conn = new SqlConnection(StringConexionName);
            try
            {
                conn.Open();

                SqlCommand query = new SqlCommand("SP_OBTIENE_ESTRATEGIAS_RED", conn);
                query.CommandType = CommandType.StoredProcedure;
                query.Parameters.AddWithValue("@idProyecto", idProyecto);
                da.SelectCommand = query;
                da.Fill(dt);

                for (int i = 0; i < dt.Rows.Count; i++)
                    lblEstrategiasRed.Text += dt.Rows[i]["descProductos"].ToString() + "<br/>";

            }
            catch (SqlException ex)
            {

                conn.Close();

            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
            }
        }

        protected void obtieneDesgloceTrabajo(int idProyecto)
        {
            SqlConnection conn = null;
            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable();

            conn = new SqlConnection(StringConexionName);
            try
            {
                conn.Open();

                SqlCommand query = new SqlCommand("SP_OBTIENE_DESGLOCE_TRABAJO", conn);
                query.CommandType = CommandType.StoredProcedure;
                query.Parameters.AddWithValue("@idProyecto", idProyecto);
                da.SelectCommand = query;
                da.Fill(dt);

                for (int i = 0; i < dt.Rows.Count; i++)
                    lblDesgloceTrabajo.Text += dt.Rows[i]["descRecursos"].ToString() + "<br/>";

            }
            catch (SqlException ex)
            {

                conn.Close();

            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
            }
        }

        protected void obtieneAreasGrises(int idProyecto)
        {
            SqlConnection conn = null;
            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable();

            conn = new SqlConnection(StringConexionName);
            try
            {
                conn.Open();

                SqlCommand query = new SqlCommand("SP_OBTIENE_DESCRIPCION_AREAS_GRIS", conn);
                query.CommandType = CommandType.StoredProcedure;
                query.Parameters.AddWithValue("@idProyecto", idProyecto);
                da.SelectCommand = query;
                da.Fill(dt);

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    if (dt.Rows[i]["descripcionArea"].ToString() == "Responsabilidad_Calidad")
                        lblAGResponsabilidadC.Text += dt.Rows[i]["descAreaGris"].ToString() + "<br/>";
                    else if (dt.Rows[i]["descripcionArea"].ToString() == "Proceso_Trabajo")
                        lblAGProcesosTrabajo.Text += dt.Rows[i]["descAreaGris"].ToString() + "<br/>";
                    else if (dt.Rows[i]["descripcionArea"].ToString() == "Calidad_Tiempo_Costo")
                        lblAGCalTiCo.Text += dt.Rows[i]["descAreaGris"].ToString() + "<br/>";
                    else if (dt.Rows[i]["descripcionArea"].ToString() == "Responsabilidad_Entorno")
                        lblAGResponsabilidadEO.Text += dt.Rows[i]["descAreaGris"].ToString() + "<br/>";
                    else if (dt.Rows[i]["descripcionArea"].ToString() == "Gobernabilidad")
                        lblAGGobernabilidad.Text += dt.Rows[i]["descAreaGris"].ToString() + "<br/>";

                }
            }
            catch (SqlException ex)
            {

                conn.Close();

            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
            }
        }

        protected void obtieneImpactoMision(int idProyecto) 
        {
            SqlConnection conn = null;
            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable();

            conn = new SqlConnection(StringConexionName);
            try
            {
                conn.Open();

                SqlCommand query = new SqlCommand("SP_OBTIENE_INDICADORES_IMPACTO", conn);
                query.CommandType = CommandType.StoredProcedure;
                query.Parameters.AddWithValue("@idProyecto", idProyecto);
                da.SelectCommand = query;
                da.Fill(dt);

                lblRetTalento.Text += dt.Rows[0]["retencionTalento"].ToString() + "<br/>";
                lblPosMercado.Text += dt.Rows[0]["porsicionMercado"].ToString() + "<br/>";
                lblImpacto.Text += dt.Rows[0]["impactoLarCortoPlazo"].ToString() + "<br/>";

            }
            catch (SqlException ex)
            {

                conn.Close();

            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
            }
        }

        protected void obtieneMetasCumplidas(int idProyecto)
        {
            SqlConnection conn = null;
            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable();

            conn = new SqlConnection(StringConexionName);
            try
            {
                conn.Open();

                SqlCommand query = new SqlCommand("SP_OBTIENE_INDICADORES_METAS_CUMPLIDAS", conn);
                query.CommandType = CommandType.StoredProcedure;
                query.Parameters.AddWithValue("@idProyecto", idProyecto);
                da.SelectCommand = query;
                da.Fill(dt);

                for (int i = 0; i < dt.Rows.Count; i++)
                    lblMetasCumplidas.Text += dt.Rows[i]["descMeta"].ToString() + "<br/>";

            }
            catch (SqlException ex)
            {

                conn.Close();

            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
            }
        }

        protected void obtieneAdmonRecursos(int idProyecto)
        {
            SqlConnection conn = null;
            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable();

            conn = new SqlConnection(StringConexionName);
            try
            {
                conn.Open();

                SqlCommand query = new SqlCommand("SP_OBTIENE_INDICADORES_ADMON_RECURSOS", conn);
                query.CommandType = CommandType.StoredProcedure;
                query.Parameters.AddWithValue("@idProyecto", idProyecto);
                da.SelectCommand = query;
                da.Fill(dt);

                lblBenchmarkComp.Text += dt.Rows[0]["benchmarkCompatencia"].ToString() + "<br/>";
                lblEficiencia.Text += dt.Rows[0]["eficienciaProAvControl"].ToString() + "<br/>";

            }
            catch (SqlException ex)
            {

                conn.Close();

            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
            }
        }

        protected void obtieneMovRecursos(int idProyecto)
        {
            SqlConnection conn = null;
            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable();

            conn = new SqlConnection(StringConexionName);
            try
            {
                conn.Open();

                SqlCommand query = new SqlCommand("SP_OBTIENE_INDICADORES_MOVILIZACION_RECURSOS", conn);
                query.CommandType = CommandType.StoredProcedure;
                query.Parameters.AddWithValue("@idProyecto", idProyecto);
                da.SelectCommand = query;
                da.Fill(dt);

                lblEconomia.Text += dt.Rows[0]["economia"].ToString() + "<br/>";
                lblCompPrincipales.Text += dt.Rows[0]["competenciasNucleo"].ToString() + "<br/>";
                lblHabEquipo.Text += dt.Rows[0]["habilidadesEquipo"].ToString() + "<br/>";
                lblCaracter.Text += dt.Rows[0]["caracter"].ToString() + "<br/>";
                lblCultura.Text += dt.Rows[0]["cultura"].ToString() + "<br/>";

            }
            catch (SqlException ex)
            {

                conn.Close();

            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
            }
        }

        protected void obtieneBenchmark(int idProyecto)
        {
            SqlConnection conn = null;
            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable();

            conn = new SqlConnection(StringConexionName);
            try
            {
                conn.Open();

                SqlCommand query = new SqlCommand("SP_OBTIENE_BENCHMARK", conn);
                query.CommandType = CommandType.StoredProcedure;
                query.Parameters.AddWithValue("@idProyecto", idProyecto);
                da.SelectCommand = query;
                da.Fill(dt);

                lblBenchmark.Text += dt.Rows[0]["benchmark"].ToString() + "<br/>";
                

            }
            catch (SqlException ex)
            {

                conn.Close();

            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
            }
        }

        protected void obtieneProyectos() 
        {

        }
    }
}