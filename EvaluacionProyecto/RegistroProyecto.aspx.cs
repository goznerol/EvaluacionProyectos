using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


namespace EvaluacionProyecto
{
    public partial class RegistroProyecto : System.Web.UI.Page
    {
        public string StringConexionName = System.Configuration.ConfigurationManager.ConnectionStrings["raceaward"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                

                txtfecha.Text = DateTime.Now.ToString("yyyy/MM/dd");
                txtSobreBenchmark.Attributes.Add(" MaxLength", "200");
                txtEconomia.Attributes.Add(" MaxLength", "200");
                txtCoreHab.Attributes.Add(" MaxLength", "200");
                txtHabEquipo.Attributes.Add(" MaxLength", "200");
                txtCaracter.Attributes.Add(" MaxLength", "200");
                txtCultura.Attributes.Add(" MaxLength", "200");
                txtBenchmark.Attributes.Add(" MaxLength", "200");
                txtEficiencia.Attributes.Add(" MaxLength", "200");
                txtImpacto.Attributes.Add(" MaxLength", "200");
                txtPosMercado.Attributes.Add(" MaxLength", "200");
                txtCortoLargoPlazo.Attributes.Add(" MaxLength", "200");
                txtVision.Attributes.Add(" MaxLength", "200");
                txtResumen.Attributes.Add(" MaxLength", "200");
                txtAlcance.Attributes.Add(" MaxLength", "200");
                txtEfectos.Attributes.Add(" MaxLength", "200");
            }
            
        }

        protected void guardargenerales_Click(object sender, EventArgs e)
        {
            
            SqlConnection conn = null;

            string error = "";
            conn = new SqlConnection(StringConexionName);
            try
            {
                conn.Open();
                SqlCommand query = new SqlCommand("SP_INSERTA_DATOS_GENERALES", conn);
                query.CommandType = CommandType.StoredProcedure;
                query.Parameters.AddWithValue("@idProyecto", Convert.ToInt32(lblIdProyecto.Text));
                query.Parameters.AddWithValue("@nomProyecto",txtNombre.Text);
                query.Parameters.AddWithValue("@fechaDefinicion", Convert.ToDateTime(txtfecha.Text));
                query.Parameters.AddWithValue("@catProyecto", ddlCategoria.SelectedItem.Text);
                query.Parameters.AddWithValue("@integrantesProyecto", txtIntegrantes.Text);
                query.Parameters.AddWithValue("@alcanceProyecto", txtAlcance.Text);
                query.Parameters.AddWithValue("@razonProyecto", ddlRazonConduccion.SelectedItem.Text);
                query.Parameters.AddWithValue("@efadvProyecto", txtEfectos.Text);
                query.Parameters.AddWithValue("@prioridadProyecto", rblPrioridad.SelectedItem.Text);
                query.Parameters.AddWithValue("@liderProyecto", txtLider.Text);

                query.Parameters.Add("@RETURN_VALUE", SqlDbType.Int).Direction = ParameterDirection.ReturnValue;

                query.ExecuteNonQuery();

                int idProyecto = (int)query.Parameters["@RETURN_VALUE"].Value;

                lblnomIDproyecto.Visible = true;
                lblIdProyecto.Visible = true;
                lblIdProyecto.Text = idProyecto.ToString();
                


            }
            catch (SqlException ex)
            {
                error = "No se pudo conectar con BD" + ex.Message.ToString();
                conn.Close();

            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
            }

            ClientScript.RegisterStartupScript(this.GetType(), "myScript", "cambiarvista('generalesResumen',mnuResmen)", true);
        }

       

        protected void btnResumen_Click(object sender, EventArgs e)
        {            
            SqlConnection conn = null;

            string error = "";
            conn = new SqlConnection(StringConexionName);
            try
            {
                conn.Open();
                SqlCommand query = new SqlCommand("SP_INSERTA_RESUMEN_PROYECTO", conn);
                query.CommandType = CommandType.StoredProcedure;
                query.Parameters.AddWithValue("@idProyecto", Convert.ToInt32(lblIdProyecto.Text));
                query.Parameters.AddWithValue("@resumenProyecto", txtResumen.Text);
                
                query.ExecuteNonQuery();

            }
            catch (SqlException ex)
            {
                error = "No se pudo conectar con BD" + ex.Message.ToString();
                conn.Close();

            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
            }

            ClientScript.RegisterStartupScript(this.GetType(), "myScript", "cambiarvista('generalesPruebas',mnuPruebas)", true);
        }

        protected void btnPruebas_Click(object sender, EventArgs e)
        {
            if (!chkMetasTerminologia.Checked)
            {
                txtTeminologiaExplicacion.Text = " ";
            }
            else if (!chkMetasIntereses.Checked)
            {
                txtMetasIntereses.Text = " ";
            }
            else if (!chkMetasMotivos.Checked)
            {
                txtMertasMotivos.Text = " ";
            }
            else if (!chkMetasValores.Checked)
            {
                txtMetasValores.Text = " ";
            }
            else if (!chkMetasAnalisis.Checked)
            {
                txtMetasAnalisis.Text = " ";
            }
            
            SqlConnection conn = null;

            string error = "";
            conn = new SqlConnection(StringConexionName);
            try
            {
                conn.Open();
                SqlCommand query = new SqlCommand("SP_INSERTA_VALIDACION_METAS", conn);
                query.CommandType = CommandType.StoredProcedure;
                query.Parameters.AddWithValue("@idProyecto", Convert.ToInt32(lblIdProyecto.Text));
                query.Parameters.AddWithValue("@terminologiaClara", chkMetasTerminologia.Checked);
                query.Parameters.AddWithValue("@interesesValidados", chkMetasIntereses.Checked);
                query.Parameters.AddWithValue("@motivosOcultos", chkMetasMotivos.Checked);
                query.Parameters.AddWithValue("@valoresEtica", chkMetasValores.Checked);
                query.Parameters.AddWithValue("@anaInteresados", chkMetasAnalisis.Checked);
                query.Parameters.AddWithValue("@descTermClara", txtTeminologiaExplicacion.Text);
                query.Parameters.AddWithValue("@descIntValidados", txtMetasIntereses.Text);
                query.Parameters.AddWithValue("@descMotOcultos", txtMertasMotivos.Text);
                query.Parameters.AddWithValue("@descValEtica", txtMetasValores.Text);
                query.Parameters.AddWithValue("@descAnaInteresados", txtMetasAnalisis.Text);

                query.Parameters.Add("@RETURN_VALUE", SqlDbType.Int).Direction = ParameterDirection.ReturnValue;

                query.ExecuteNonQuery();

                int idProyecto = (int)query.Parameters["@RETURN_VALUE"].Value;

                
            }
            catch (SqlException ex)
            {
                error = "No se pudo conectar con BD" + ex.Message.ToString();
                conn.Close();

            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
            }

            ClientScript.RegisterStartupScript(this.GetType(), "myScript", "cambiarvista('cadenaVision',mnuVision)", true);

        }


        protected void btnVision_Click(object sender, EventArgs e)
        {            
            SqlConnection conn = null;

            string error = "";
            conn = new SqlConnection(StringConexionName);
            try
            {
                conn.Open();
                SqlCommand query = new SqlCommand("SP_INSERTA_MISION", conn);
                query.CommandType = CommandType.StoredProcedure;
                query.Parameters.AddWithValue("@idProyecto", Convert.ToInt32(lblIdProyecto.Text));
                query.Parameters.AddWithValue("@misionProyecto", txtVision.Text);
                
                query.ExecuteNonQuery();

            }
            catch (SqlException ex)
            {
                error = "No se pudo conectar con BD" + ex.Message.ToString();
                conn.Close();

            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
            }

            ClientScript.RegisterStartupScript(this.GetType(), "myScript", "cambiarvista('cadenaPortafolios',mnuPortafolios)", true);
        }

        
       
        protected void btnMetaAgregar_click(object sender, EventArgs e)
        {
            
            
            lblMeta1.Text += "<span id='' onclick='span_click' runat='server' >"+ txtMetaagregar.Text + "<br/></span>";
            lblMeta1.Visible = true;            
            txtMetaagregar.Text = "";
             
        }

        static int numEntregable = 0;
        protected void btnAgregarEntregable_click(object sender, EventArgs e)
        {
                                                    
            lblEntregable1.Text += "<span id='' onclick='span_click' runat='server' >" + txtEntregables.Text + "<br/></span>";
            lblEntregable1.Visible = true;            
            txtEntregables.Text = "";
            
        }

        static int numDesgloce = 0;
        protected void btnAgregarDesgloce_click(object sender, EventArgs e)
        {                                        
            lblRecursos1.Text += "<span id='' onclick='span_click' runat='server' >" + txtdesgloce.Text + "<br/></span>";
            lblRecursos1.Visible = true;            
            txtdesgloce.Text = "";             
        }

        protected void btnMetas_click(object sender, EventArgs e)
        {
            int i=0; 
            string auxiliarSpan;
            auxiliarSpan = lblMeta1.Text.Replace("<span id='' onclick='span_click' runat='server' >", "");
            auxiliarSpan = auxiliarSpan.Replace("<br/></span>", "\n");
            string[] metas = auxiliarSpan.Split('\n');
            
            SqlConnection conn = null;

            string error = "";
            conn = new SqlConnection(StringConexionName);
            try
            {
                conn.Open();
                SqlCommand query = new SqlCommand("SP_DELETE_OBJETIVOS", conn);
                query.CommandType = CommandType.StoredProcedure;
                query.Parameters.AddWithValue("@idProyecto", Convert.ToInt32(lblIdProyecto.Text));


                query.ExecuteNonQuery();

            }
            catch (SqlException ex)
            {
                error = "No se pudo conectar con BD" + ex.Message.ToString();
                conn.Close();

            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
            }
            do
            {
               
                try
                {
                    conn.Open();
                    SqlCommand query = new SqlCommand("SP_INSERTA_OBJETIVOS", conn);
                    query.CommandType = CommandType.StoredProcedure;
                    query.Parameters.AddWithValue("@idProyecto", Convert.ToInt32(lblIdProyecto.Text));
                    query.Parameters.AddWithValue("@descObjetivos", metas[i]);

                    query.ExecuteNonQuery();

                }
                catch (SqlException ex)
                {
                    error = "No se pudo conectar con BD" + ex.Message.ToString();
                    conn.Close();

                }
                finally
                {
                    if (conn != null)
                    {
                        conn.Close();
                    }
                }

                i++;
            } while (metas[i] != "");


            ClientScript.RegisterStartupScript(this.GetType(), "myScript", "cambiarvista('cadenaEstrategia',mnuEstrategia)", true);
        }

        protected void btnEstrategias_click(object sender, EventArgs e)
        {
            int i=0; 
            string auxiliarSpan;
            auxiliarSpan =  lblEntregable1.Text.Replace("<span id='' onclick='span_click' runat='server' >", "");
            auxiliarSpan = auxiliarSpan.Replace("<br/></span>", "\n");
            string[] estrategias = auxiliarSpan.Split('\n');
            
            SqlConnection conn = null;

            string error = "";
            conn = new SqlConnection(StringConexionName);
            try
            {
                conn.Open();
                SqlCommand query = new SqlCommand("SP_DELETE_PRODUCTOS", conn);
                query.CommandType = CommandType.StoredProcedure;
                query.Parameters.AddWithValue("@idProyecto", Convert.ToInt32(lblIdProyecto.Text));

                query.ExecuteNonQuery();

            }
            catch (SqlException ex)
            {
                error = "No se pudo conectar con BD" + ex.Message.ToString();
                conn.Close();

            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
            }
            do
            {
               
                try
                {
                    conn.Open();
                    SqlCommand query = new SqlCommand("SP_INSERTA_PRODUCTOS", conn);
                    query.CommandType = CommandType.StoredProcedure;
                    query.Parameters.AddWithValue("@idProyecto", Convert.ToInt32(lblIdProyecto.Text));
                    query.Parameters.AddWithValue("@descProductos", estrategias[i]);

                    query.ExecuteNonQuery();

                }
                catch (SqlException ex)
                {
                    error = "No se pudo conectar con BD" + ex.Message.ToString();
                    conn.Close();

                }
                finally
                {
                    if (conn != null)
                    {
                        conn.Close();
                    }
                }
                i++;
            } while (estrategias[i] != "");

            ClientScript.RegisterStartupScript(this.GetType(), "myScript", "cambiarvista('cadenaTrabajo',mnuTrabajo)", true);

        }

        protected void btnRecurso_click(object sender, EventArgs e)
        {
            int i=0; 
            string auxiliarSpan;
            auxiliarSpan = lblRecursos1.Text.Replace("<span id='' onclick='span_click' runat='server' >", "");
            auxiliarSpan = auxiliarSpan.Replace("<br/></span>", "\n");
            string[] recursos = auxiliarSpan.Split('\n');
            
            SqlConnection conn = null;

            string error = "";
            conn = new SqlConnection(StringConexionName);
            try
            {
                conn.Open();
                SqlCommand query = new SqlCommand("SP_DELETE_RECURSOS", conn);
                query.CommandType = CommandType.StoredProcedure;
                query.Parameters.AddWithValue("@idProyecto", Convert.ToInt32(lblIdProyecto.Text));


                query.ExecuteNonQuery();

            }
            catch (SqlException ex)
            {
                error = "No se pudo conectar con BD" + ex.Message.ToString();
                conn.Close();

            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
            }
            do
            {    
            
                try
                {
                    conn.Open();
                    SqlCommand query = new SqlCommand("SP_INSERTA_RECURSOS", conn);
                    query.CommandType = CommandType.StoredProcedure;
                    query.Parameters.AddWithValue("@idProyecto", Convert.ToInt32(lblIdProyecto.Text));
                    query.Parameters.AddWithValue("@descRecursos", recursos[i]);

                    query.ExecuteNonQuery();

                }
                catch (SqlException ex)
                {
                    error = "No se pudo conectar con BD" + ex.Message.ToString();
                    conn.Close();

                }
                finally
                {
                    if (conn != null)
                    {
                        conn.Close();
                    }
                }
                i++;
            }while(recursos[i] !="");
            ClientScript.RegisterStartupScript(this.GetType(), "myScript", "cambiarvista('areasGrises',mnuareasGrises)", true);

        }

        protected void btnAreasGrises_click(object sender, EventArgs e)
        {
            int centinela = -1;
            int i=0; 
            string auxiliarSpan;
            auxiliarSpan = lblResponsabilidad1.Text.Replace("<span id='' onclick='span_click' runat='server' >", "")
                + lblProcesoTrabajo1.Text.Replace("<span id='' onclick='span_click' runat='server' >", "")
                + lblCaltico1.Text.Replace("<span id='' onclick='span_click' runat='server' >", "")
                + lblResponsabilidadEo1.Text.Replace("<span id='' onclick='span_click' runat='server' >", "")
                + lblGobernabilidad1.Text.Replace("<span id='' onclick='span_click' runat='server' >", "");
            auxiliarSpan = auxiliarSpan.Replace("<br/></span>", "\n");
            auxiliarSpan = auxiliarSpan.Replace("<br />", "\n");
            
            string[] areaGris = auxiliarSpan.Split('\n');
          
            SqlConnection conn = null;

            string error = "";
            conn = new SqlConnection(StringConexionName);
            try
            {
                conn.Open();
                SqlCommand query = new SqlCommand("SP_DELETE_AREA_GRIS", conn);
                query.CommandType = CommandType.StoredProcedure;
                query.Parameters.AddWithValue("@idProyecto", Convert.ToInt32(lblIdProyecto.Text));


                query.ExecuteNonQuery();

            }
            catch (SqlException ex)
            {
                error = "No se pudo conectar con BD" + ex.Message.ToString();
                conn.Close();

            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
            }
            do
            {
                if (areaGris[i] == "")
                {
                    centinela++;
                    
                }
                else
                {
                   
                    try
                    {
                        conn.Open();
                        SqlCommand query = new SqlCommand("SP_INSERTA_AREA_GRIS", conn);
                        query.CommandType = CommandType.StoredProcedure;
                        query.Parameters.AddWithValue("@idProyecto", Convert.ToInt32(lblIdProyecto.Text));
                        query.Parameters.AddWithValue("@descAreaGris", areaGris[i]);
                        query.Parameters.AddWithValue("@idArea", centinela + 1);

                        query.ExecuteNonQuery();

                    }
                    catch (SqlException ex)
                    {
                        error = "No se pudo conectar con BD" + ex.Message.ToString();
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
                i++;
            } while (centinela < 5);


            ClientScript.RegisterStartupScript(this.GetType(), "myScript", "cambiarvista('indicadoresImpacto',mnuIndicadoresImpacto)", true);

        }


        protected void btnResponsabilidadCal_click(object sender, EventArgs e)
        {
            
            lblResponsabilidad1.Text += "<span id='' onclick='span_click' runat='server' >" + txtSupuestoRespCalidad.Text + "<br/></span>";
            lblResponsabilidad1.Visible = true;
            

            txtSupuestoRespCalidad.Text = "";

        }


        protected void btnProcesoTrabajo_click(object sender, EventArgs e)
        {
           
            lblProcesoTrabajo1.Text += "<span id='' onclick='span_click' runat='server' >" + txtSupuestoProcesoTrabajo.Text + "<br/></span>";
            lblProcesoTrabajo1.Visible = true;
            
            txtSupuestoProcesoTrabajo.Text = "";
        }


        protected void btnCaltico_click(object sender, EventArgs e)
        {
            
            lblCaltico1.Text += "<span id='' onclick='span_click' runat='server' >" + txtSupuestoCalidad.Text + "<br/></span>";
            lblCaltico1.Visible = true;
            
            txtSupuestoCalidad.Text = "";
        }


        protected void btnResponsabilidadEo_click(object sender, EventArgs e)
        {
            
            lblResponsabilidadEo1.Text += "<span id='' onclick='span_click' runat='server' >" + txtSupuestoRespProducto.Text + "<br/></span>";
            lblResponsabilidadEo1.Visible = true;
            
            txtSupuestoRespProducto.Text = "";
        }


        protected void btnGobernabilidad_click(object sender, EventArgs e)
        {
          
            lblGobernabilidad1.Text += "<span id='' onclick='span_click' runat='server' >" + txtSupuestoGobernabilidad.Text + "<br/></span>";
            lblGobernabilidad1.Visible = true;
            
            txtSupuestoGobernabilidad.Text = "";
        }


        protected void btnImpacto_click(object sender, EventArgs e)
        {          
            SqlConnection conn = null;

            string error = "";
            conn = new SqlConnection(StringConexionName);
            try
            {
                conn.Open();
                SqlCommand query = new SqlCommand("SP_INSERTA_IMPACTO", conn);
                query.CommandType = CommandType.StoredProcedure;
                query.Parameters.AddWithValue("@idProyecto", Convert.ToInt32(lblIdProyecto.Text));
                query.Parameters.AddWithValue("@retencionTalento", txtImpacto.Text);
                query.Parameters.AddWithValue("@posicionMercado", txtPosMercado.Text);
                query.Parameters.AddWithValue("@impactoLarCortoPlazo", txtCortoLargoPlazo.Text);
                
                query.ExecuteNonQuery();

            }
            catch (SqlException ex)
            {
                error = "No se pudo conectar con BD" + ex.Message.ToString();
                conn.Close();

            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
            }

            ClientScript.RegisterStartupScript(this.GetType(), "myScript", "cambiarvista('IndicadoresMetas',mnuIndicadoresMetas)", true);
        }


        protected void btnIndicadorMeta_click(object sender, EventArgs e)
        {
           
            lblMetaCumplida1.Text += "<span id='' onclick='span_click' runat='server' >"+ txtIndicadorMeta.Text + "<br/></span>";
            lblMetaCumplida1.Visible = true;
            txtIndicadorMeta.Text = "";

            
        }


        protected void btnEficiencia_click(object sender, EventArgs e)
        {          
            SqlConnection conn = null;

            string error = "";
            conn = new SqlConnection(StringConexionName);
            try
            {
                conn.Open();
                SqlCommand query = new SqlCommand("SP_INSERTA_ADMON_RECURSOS", conn);
                query.CommandType = CommandType.StoredProcedure;
                query.Parameters.AddWithValue("@idProyecto", Convert.ToInt32(lblIdProyecto.Text));
                query.Parameters.AddWithValue("@benchmarkCompatencia", txtBenchmark.Text);
                query.Parameters.AddWithValue("@eficienciaProAvControl", txtEficiencia.Text);
                
                query.ExecuteNonQuery();

            }
            catch (SqlException ex)
            {
                error = "No se pudo conectar con BD" + ex.Message.ToString();
                conn.Close();

            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
            }

            ClientScript.RegisterStartupScript(this.GetType(), "myScript", "cambiarvista('indicadoresMovilizacion',mnuIndicadoresMovil)", true);
        }

        
            protected void btnMetasCumplidas_click(object sender, EventArgs e)
        {
                int i=0; 
            string auxiliarSpan;
            auxiliarSpan = lblMetaCumplida1.Text.Replace("<span id='' onclick='span_click' runat='server' >", "");
            auxiliarSpan = auxiliarSpan.Replace("<br/></span>", "\n");
            auxiliarSpan = auxiliarSpan.Replace("<br/>", "");
            string[] metasCumplidas = auxiliarSpan.Split('\n');

            
            SqlConnection conn = null;

            string error = "";
            conn = new SqlConnection(StringConexionName);
            try
            {
                conn.Open();
                SqlCommand query = new SqlCommand("SP_DELETE_METAS", conn);
                query.CommandType = CommandType.StoredProcedure;
                query.Parameters.AddWithValue("@idProyecto", Convert.ToInt32(lblIdProyecto.Text));


                query.ExecuteNonQuery();

            }
            catch (SqlException ex)
            {
                error = "No se pudo conectar con BD" + ex.Message.ToString();
                conn.Close();

            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
            }
            do
            { 
                try
                {
                    conn.Open();
                    SqlCommand query = new SqlCommand("SP_INSERTA_METAS", conn);
                    query.CommandType = CommandType.StoredProcedure;
                    query.Parameters.AddWithValue("@idProyecto", Convert.ToInt32(lblIdProyecto.Text));
                    query.Parameters.AddWithValue("@descMeta", metasCumplidas[i]);


                    query.ExecuteNonQuery();

                }
                catch (SqlException ex)
                {
                    error = "No se pudo conectar con BD" + ex.Message.ToString();
                    conn.Close();

                }
                finally
                {
                    if (conn != null)
                    {
                        conn.Close();
                    }
                }
                i++;
            }while(metasCumplidas[i] != "");
            ClientScript.RegisterStartupScript(this.GetType(), "myScript", "cambiarvista('indicadoresAdministracion',mnuIndicadoresAdmin)", true);
            
        }

        
            protected void btnMoviRecursos_click(object sender, EventArgs e)
        {         
            SqlConnection conn = null;

            string error = "";
            conn = new SqlConnection(StringConexionName);
            try
            {
                conn.Open();
                SqlCommand query = new SqlCommand("SP_INSERTA_MOVILIZACION_RECURSOS", conn);
                query.CommandType = CommandType.StoredProcedure;
                query.Parameters.AddWithValue("@idProyecto", Convert.ToInt32(lblIdProyecto.Text));
                query.Parameters.AddWithValue("@economia", txtEconomia.Text);
                query.Parameters.AddWithValue("@competenciasNucleo", txtCoreHab.Text);
                query.Parameters.AddWithValue("@habilidadesEquipo", txtHabEquipo.Text);
                query.Parameters.AddWithValue("@caracter", txtCaracter.Text);
                query.Parameters.AddWithValue("@cultura", txtCultura.Text);
                
                query.ExecuteNonQuery();

            }
            catch (SqlException ex)
            {
                error = "No se pudo conectar con BD" + ex.Message.ToString();
                conn.Close();

            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
            }

            ClientScript.RegisterStartupScript(this.GetType(), "myScript", "cambiarvista('planBenchmark',mnuPlanBench)", true);
        }


            protected void btnBenchmark_Click(object sender, EventArgs e)
        {
            
            SqlConnection conn = null;

            string error = "";
            conn = new SqlConnection(StringConexionName);
            try
            {
                conn.Open();
                SqlCommand query = new SqlCommand("SP_INSERTA_BENCHMARK", conn);
                query.CommandType = CommandType.StoredProcedure;
                query.Parameters.AddWithValue("@idProyecto", Convert.ToInt32(lblIdProyecto.Text));
                query.Parameters.AddWithValue("@benchmark", txtSobreBenchmark.Text);
                
                query.ExecuteNonQuery();

            }
            catch (SqlException ex)
            {
                error = "No se pudo conectar con BD" + ex.Message.ToString();
                conn.Close();

            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
            }

            ClientScript.RegisterStartupScript(this.GetType(), "myScript", "cambiarvista('divMensajeFinal',this)", true);
        }


            protected void txtBeneficiosOfrecidos_TextChanged(object sender, EventArgs e) 
            {

                txtResumen.Text = "";
                txtResumen.Text = (txtBeneficiosOfrecidos.Text.Trim()!=""? "El proyecto permite  " + txtBeneficiosOfrecidos.Text.Trim() + " " : "") +
                    (txtPreguntaProducto.Text.Trim()!=""? "a través de " + txtPreguntaProducto.Text.Trim() + " ":"" ) +
                    (txtPreguntaMercado.Text.Trim()!=""? "enfocándose a " + txtPreguntaMercado.Text.Trim() + " " :"")+
                    (txtPreguntaBeneficiosObtenidos.Text.Trim()!=""?". Los resultados del proyecto son " + txtPreguntaBeneficiosObtenidos.Text.Trim() + " ":"") +
                    (txtPreguntaTiempo.Text.Trim()!=""?" en " + txtPreguntaTiempo.Text.Trim()+ ".":"");

                TextBox txtActual = (TextBox)sender;
                switch (txtActual.ID)
                {
                    case "txtBeneficiosOfrecidos":
                        txtPreguntaProducto.Focus();
                        break;

                    case "txtPreguntaProducto":
                        txtPreguntaMercado.Focus();
                        break;

                    case "txtPreguntaMercado":
                        txtPreguntaBeneficiosObtenidos.Focus();
                        break;

                    case "txtPreguntaBeneficiosObtenidos":
                        txtPreguntaTiempo.Focus();
                        break;
                }

            }
    }

}