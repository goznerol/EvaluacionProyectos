<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EvaluacionProyecto.aspx.cs" Inherits="EvaluacionProyecto.Main" %>

<DOCTYPE>
<html>

<head>
<script type="text/javascript" src="Scripts/evalProyectos.js"></script>
<script type="text/C#" src="EvaluacionProyecto.aspx.cs"></script>
<link  type="text/css" href="Styles/Site.css" rel="Stylesheet"/>
<title>EGS-Evaluación de proyectos</title>

<script type="text/javascript">
   function cambiarvista(idSeccion, opcion) {
        
       document.getElementById('divDatosGenerales').style.display = 'none';
       document.getElementById('divResumen').style.display = 'none';
       document.getElementById('divPruebasValidacion').style.display = 'none';
       document.getElementById('divVision').style.display = 'none';
       document.getElementById('divPortMetas').style.display = 'none';
       document.getElementById('divEstrategiasRed').style.display = 'none';
       document.getElementById('divDesgTrabajo').style.display = 'none';
       document.getElementById('divAreasGrises').style.display = 'none';
       document.getElementById('divImpactoMision').style.display = 'none';
       document.getElementById('divMetasCumplidas').style.display = 'none';
       document.getElementById('divAdmonRecu').style.display = 'none';
       document.getElementById('divMoviRecu').style.display = 'none';
       document.getElementById('divPlanEvaluacion').style.display = 'none';
       document.getElementById('divEvaluacion').style.display = 'none';
       

        document.getElementById(idSeccion).style.display = '';

        document.getElementById('menuDatosGenerales').className = 'a';
        document.getElementById('menuResumen').className = 'a';
        document.getElementById('menuPruebasValidacion').className = 'a';
        document.getElementById('menuVision').className = 'a';
        document.getElementById('menuPortMetas').className = 'a';
        document.getElementById('menuEstrategiasRed').className = 'a';
        document.getElementById('menuDesgTrabajo').className = 'a';
        document.getElementById('menuAreasGrises').className = 'a';
        document.getElementById('menuImpactoMision').className = 'a';
        document.getElementById('menuMetasCumplidas').className = 'a';
        document.getElementById('menuAdmonRecu').className = 'a';
        document.getElementById('menuMoviRecu').className = 'a';
        document.getElementById('menuPlanEvaluacion').className = 'a';
        document.getElementById('menuEvaluacion').className = 'a';

        opcion.className = "menu_selected";
    }
    function mostrarocultar(tr, chk) {
        document.getElementById(tr).style.display = chk.checked == true ? '' : 'none';

    }

</script>




</head>
<body>
<form runat="server">
    <div id="evaluacion">
    <h3>
        Indicadores de valor de negociación y puntos de referencia
    </h3>
</div>
<ul id="fases_evaluacion">
    <li class="selected" id="menuDatosGenerales" onclick="cambiarvista('divDatosGenerales',this)"><a href="#">Datos Generales</a></li>
    <li id="menuResumen" onclick="cambiarvista('divResumen',this)"><a href="#">Resumen</a></li>
    <li id="menuPruebasValidacion" onclick="cambiarvista('divPruebasValidacion',this)"><a href="#">Pruebas de Validacion</a></li>
    <li id="menuVision" onclick="cambiarvista('divVision',this)"><a href="#">Vision</a></li>
    <li id="menuPortMetas" onclick="cambiarvista('divPortMetas',this)"><a href="#">Portafolio de Metas</a></li>
    <li id="menuEstrategiasRed" onclick="cambiarvista('divEstrategiasRed',this)"><a href="#">Estrategias de Red</a></li>
    <li id="menuDesgTrabajo" onclick="cambiarvista('divDesgTrabajo',this)"><a href="#">Desgloce de Trabajo</a></li>
    <li id="menuAreasGrises" onclick="cambiarvista('divAreasGrises',this)"><a href="#">Supuestos y eventos sorpresas</a></li>
    <li id="menuImpactoMision" onclick="cambiarvista('divImpactoMision',this)"><a href="#">Impacto en la misión</a></li>
    <li id="menuMetasCumplidas" onclick="cambiarvista('divMetasCumplidas',this)"><a href="#">Metas Cumplidas</a></li>
    <li id="menuAdmonRecu" onclick="cambiarvista('divAdmonRecu',this)"><a href="#">Administración de Recursos</a></li>
    <li id="menuMoviRecu" onclick="cambiarvista('divMoviRecu',this)"><a href="#">Indicadores de Valor y Benchmark</a></li>
    <li id="menuPlanEvaluacion" onclick="cambiarvista('divPlanEvaluacion',this)"><a href="#">Plan de Evaluación</a></li>
    <li id="menuEvaluacion" onclick="cambiarvista('divEvaluacion',this)"><a href="#">Evaluación general del proyecto</a></li>
</ul>

 <div id="divConsultaProyectos">
        <asp:GridView ID="gvConsultaProyectos" runat="server" ShowHeaderWhenEmpty="true" AutoGenerateColumns="false"></asp:GridView>
        <div class="secbotones"><asp:Button CssClass="bttonregistro" runat="server" 
                        ID="btnConsultaProyecto" Text="Enviar" onclick="btnConsultaProyecto_Click"/></div>
    </div>

 <div id="divDatosGenerales" style="display:none">
        <asp:CheckBox ID="chkDatosGenerales" CssClass="chks" runat="server"/>
         0<asp:TextBox ID="txtEvalDatosGenerales" runat="server" min="2" MaxLength="10" step="2" type="range" ></asp:TextBox>10
         <asp:Label runat="server" >Observaciones:</asp:Label>
         <asp:TextBox ID="txtObsDatosGenerales" runat="server" MaxLength="10" TextMode="MultiLine" Rows="8"></asp:TextBox>
        
        <ul>
            
            <li><asp:Label CssClass="label" runat="server">ID Proyecto:</asp:Label><asp:Label ID="lblIdProyecto" CssClass="label" runat="server"></asp:Label></li>
            <li><asp:Label CssClass="label" runat="server">Fecha de definición:</asp:Label><asp:Label ID="lblFechaDefinicion" CssClass="label" runat="server"></asp:Label></li>
            <li><asp:Label CssClass="label" runat="server">Nombre del Proyecto:</asp:Label><asp:Label ID="lblNombreProyecto" CssClass="label" runat="server"></asp:Label></li>
            <li><asp:Label CssClass="label" runat="server">Definicion del alcance:</asp:Label><asp:Label ID="lblDefinicionAlcance" CssClass="label" runat="server"></asp:Label></li>
            <li><asp:Label CssClass="label" runat="server">Efectos adversos:</asp:Label><asp:Label ID="lblEfectosAdversos" CssClass="label" runat="server"></asp:Label></li>
            <li><asp:Label CssClass="label" runat="server">Lider de proyecto:</asp:Label><asp:Label ID="lblLiderProyecto" CssClass="label" runat="server"></asp:Label></li>
            <li><asp:Label CssClass="label" runat="server">Integrantes:</asp:Label><asp:Label ID="lblIntegrantes" CssClass="label" runat="server"></asp:Label></li>
            <li><asp:Label CssClass="label" runat="server">Categoría:</asp:Label><asp:Label ID="lblCategoria" CssClass="label" runat="server"></asp:Label></li>
            <li><asp:Label CssClass="label" runat="server">Razón de conducción:</asp:Label><asp:Label ID="lblRazonConduccion" CssClass="label" runat="server"></asp:Label></li>
            <li><asp:Label CssClass="label" runat="server">Prioridad/Peso:</asp:Label><asp:Label ID="lblPrioridadPeso" CssClass="label" runat="server"></asp:Label></li>
            
        </ul>
        <div class="secbotones"><asp:Button CssClass="bttonregistro" runat="server" 
                        ID="enviaDG" Text="Enviar" /></div>
    </div>

 <div id="divResumen" style="display:none">
        <asp:CheckBox ID="chkResumen" CssClass="chks" runat="server"/>
        0<asp:TextBox ID="txtEvalResumen" runat="server" min="2" MaxLength="10" step="2" type="range" ></asp:TextBox>10
        <asp:Label runat="server" >Observaciones:</asp:Label>
        <asp:TextBox ID="txtObsResumen" runat="server" MaxLength="10" TextMode="MultiLine" Rows="8"></asp:TextBox>
        
        <ul>
            <li><asp:Label CssClass="label" runat="server">Resumen:</asp:Label><asp:Label ID="lblResumen" CssClass="label" runat="server"></asp:Label></li>
        </ul>
        <div class="secbotones"><asp:Button CssClass="bttonregistro" runat="server" 
                        ID="Button2" Text="Enviar" /></div>
    </div>
    
 <div id="divPruebasValidacion" style="display:none">
        <asp:CheckBox ID="chkPruebasValidacion" CssClass="chks" runat="server"/>
        0<asp:TextBox ID="txtEvalPruebasValidacion" runat="server" min="2" MaxLength="10" step="2" type="range" ></asp:TextBox>10
        <asp:Label runat="server" >Observaciones:</asp:Label>
        <asp:TextBox ID="txtObsPruebasValidacion" runat="server" MaxLength="10" TextMode="MultiLine" Rows="8"></asp:TextBox>
        
          <table style="width: 100%" cellpadding="0" cellspacing="0">
              <tr>
                <td>
                    <label>Terminologia clara</label>
                </td>
                <td>
                    <input type="checkbox" id="chkMetasTerminologia" runat="server" class="chks" onclick="mostrarocultar('trMetas1',this)"/>
                </td>                
            </tr>
            <tr id="trMetas1" style="display:none">
                <td colspan="2" style="padding-left:10px">                
                    <asp:TextBox runat="server" ID="txtTeminologiaExplicacion" TextMode="MultiLine" Width="95%" Rows="4" MaxLength="200" ReadOnly="true"> </asp:TextBox>
                 </td>
            </tr>

            <tr>
                <td>
                    <label>Intéreses validados</label>
                </td>
                <td>
                    <input type="checkbox" id="chkMetasIntereses" runat="server"  class="chks" onclick="mostrarocultar('trMetas2',this)"/>
                </td>                
            </tr>
            <tr id="trMetas2" style="display:none">
                <td colspan="2" style="padding-left:10px">                
                    <asp:TextBox runat="server" ID="txtMetasIntereses" TextMode="MultiLine" Width="95%" Rows="4" MaxLength="200" ReadOnly="true"> </asp:TextBox>                    
                    <label class="instruccion">Explique en máximo de 200 caracteres como validó esta meta.</label>
                 </td>
            </tr>

            <tr>
                <td>
                    <label>Búsqueda de motivos ocultos</label>
                </td>
                <td>
                    <input type="checkbox" id="chkMetasMotivos" runat="server"  class="chks" onclick="mostrarocultar('trMetas3',this)"/>
                </td>                
            </tr>
            <tr id="trMetas3" style="display:none">
               <td colspan="2" style="padding-left:10px">                
                    <asp:TextBox runat="server" ID="txtMertasMotivos" TextMode="MultiLine" Width="95%" Rows="4" MaxLength="200" ReadOnly="true"> </asp:TextBox>                    
                    
                 </td>
            </tr>

            <tr>
                <td>
                    <label>Búsqueda de valores/ética</label>
                </td>
                <td>
                    <input type="checkbox" id="chkMetasValores" runat="server"  class="chks" onclick="mostrarocultar('trMetas4',this)"/>
                </td>                
            </tr>
            <tr id="trMetas4" style="display:none">
                <td colspan="2" style="padding-left:10px">                
                    <asp:TextBox runat="server" ID="txtMetasValores" TextMode="MultiLine" Width="95%" Rows="4" MaxLength="200" ReadOnly="true"> </asp:TextBox>                    
                    
                 </td>
            </tr>

            <tr>
                <td>
                    <label>Análisis de los interesados</label>
                </td>
                <td>
                    <input type="checkbox" id="chkMetasAnalisis" runat="server"  class="chks" onclick="mostrarocultar('trMetas5',this)"/>
                </td>                
            </tr>
            <tr id="trMetas5" style="display:none">
                <td colspan="2" style="padding-left:10px">                
                    <asp:TextBox runat="server" ID="txtMetasAnalisis" TextMode="MultiLine" Width="95%" Rows="4" MaxLength="200" ReadOnly="true"> </asp:TextBox>
                    
                 </td>
            </tr>
             </table>
        <div class="secbotones"><asp:Button CssClass="bttonregistro" runat="server" 
                        ID="Button1" Text="Enviar" /></div>
    </div>
    
 <div id="divVision" style="display:none">
        <asp:CheckBox ID="chkVision" CssClass="chks" runat="server"/>
        0<asp:TextBox ID="txtEvalVision" runat="server" min="2" MaxLength="10" step="2" type="range" ></asp:TextBox>10
        <asp:Label runat="server" >Observaciones:</asp:Label>
        <asp:TextBox ID="txtObsVision" runat="server" MaxLength="10" TextMode="MultiLine" Rows="8"></asp:TextBox>


        <ul>
            <li><asp:Label CssClass="label" runat="server">Visión:</asp:Label><asp:Label ID="lblVision" CssClass="label" runat="server"></asp:Label></li>
            
            
        </ul>
        <div class="secbotones"><asp:Button CssClass="bttonregistro" runat="server" 
                        ID="btnEnviaCV" Text="Enviar" /></div>
    </div>
    
 <div id="divPortMetas" style="display:none">
        <asp:CheckBox ID="chkPortMetas" CssClass="chks" runat="server"/>
        0<asp:TextBox ID="txtEvalPortMetas" runat="server" min="2" MaxLength="10" step="2" type="range" ></asp:TextBox>10
        <asp:Label runat="server" >Observaciones:</asp:Label>
        <asp:TextBox ID="txtObsPortMetas" runat="server" MaxLength="10" TextMode="MultiLine" Rows="8"></asp:TextBox>


        <ul>
            <li><asp:Label CssClass="label" runat="server">Objetivos/Metas:</asp:Label><asp:Label ID="lblPortMetas" CssClass="label" runat="server"></asp:Label></li>
            
            
        </ul>
        <div class="secbotones"><asp:Button CssClass="bttonregistro" runat="server" 
                        ID="btnPortMetas" Text="Enviar" /></div>
    </div>
 
 <div id="divEstrategiasRed" style="display:none">
        <asp:CheckBox ID="chkEstrategiasRed" CssClass="chks" runat="server"/>
        0<asp:TextBox ID="txtEvalEstrategiasRed" runat="server" min="2" MaxLength="10" step="2" type="range" ></asp:TextBox>10
        <asp:Label runat="server" >Observaciones:</asp:Label>
        <asp:TextBox ID="txtObsEstrategiasRed" runat="server" MaxLength="10" TextMode="MultiLine" Rows="8"></asp:TextBox>


        <ul>
            <li><asp:Label CssClass="label" runat="server">Entregables de Productos o Servicios:</asp:Label><asp:Label ID="lblEstrategiasRed" CssClass="label" runat="server"></asp:Label></li>
            
            
        </ul>
        <div class="secbotones"><asp:Button CssClass="bttonregistro" runat="server" 
                        ID="Button3" Text="Enviar" /></div>
    </div>
  
 <div id="divDesgTrabajo" style="display:none">
        <asp:CheckBox ID="chkDesgTrabajo" CssClass="chks" runat="server"/>
        0<asp:TextBox ID="txtEvalDesgTrabajo" runat="server" min="2" MaxLength="10" step="2" type="range" ></asp:TextBox>10
        <asp:Label runat="server" >Observaciones:</asp:Label>
        <asp:TextBox ID="txtObsDesgTrabajo" runat="server" MaxLength="10" TextMode="MultiLine" Rows="8"></asp:TextBox>

        <ul>
            <li><asp:Label CssClass="label" runat="server">Desgloce de Trabajo:</asp:Label><asp:Label ID="lblDesgloceTrabajo" CssClass="label" runat="server"></asp:Label></li>
            
            
        </ul>
        <div class="secbotones"><asp:Button CssClass="bttonregistro" runat="server" 
                        ID="Button4" Text="Enviar" /></div>
    </div>
 
 <div id="divAreasGrises" style="display: none">
        <asp:CheckBox ID="chkAreasGrises" CssClass="chks" runat="server"/>
        0<asp:TextBox ID="txtEvalAreasGrises" runat="server" min="2" MaxLength="10" step="2" type="range" ></asp:TextBox>10
        <asp:Label runat="server" >Observaciones:</asp:Label>
        <asp:TextBox ID="txtObsAreasGrises" runat="server" MaxLength="10" TextMode="MultiLine" Rows="8"></asp:TextBox>

        <ul>
            <li><asp:Label CssClass="label" runat="server">Responsabilidad (Calidad):</asp:Label><asp:Label ID="lblAGResponsabilidadC" CssClass="label" runat="server"></asp:Label></li>
            <li><asp:Label CssClass="label" runat="server">Procesos de Trabajo:</asp:Label><asp:Label ID="lblAGProcesosTrabajo" CssClass="label" runat="server"></asp:Label></li>
            <li><asp:Label CssClass="label" runat="server">Calidad, Tiempo, Costo:</asp:Label><asp:Label ID="lblAGCalTiCo" CssClass="label" runat="server"></asp:Label></li>
            <li><asp:Label CssClass="label" runat="server">Responsabilidad (Entorno Operativo):</asp:Label><asp:Label ID="lblAGResponsabilidadEO" CssClass="label" runat="server"></asp:Label></li>
            <li><asp:Label CssClass="label" runat="server">Gobernabilidad:</asp:Label><asp:Label ID="lblAGGobernabilidad" CssClass="label" runat="server"></asp:Label></li>
        </ul>
        <div class="secbotones"><asp:Button CssClass="bttonregistro" runat="server" 
                        ID="btnEnviaAG" Text="Enviar" /></div>
    </div>

 <div id="divImpactoMision" style="display: none">
       <asp:CheckBox ID="chkImpactoMision" CssClass="chks" runat="server"/>
       0<asp:TextBox ID="txtEvalImpactoMision" runat="server" min="2" MaxLength="10" step="2" type="range" ></asp:TextBox>10
        <asp:Label runat="server" >Observaciones:</asp:Label>
        <asp:TextBox ID="txtObsImpactoMision" runat="server" MaxLength="10" TextMode="MultiLine" Rows="8"></asp:TextBox>


       <ul>
            <li><asp:Label CssClass="label" runat="server">Retención del talento, innovación e indicadores financieros:</asp:Label><asp:Label ID="lblRetTalento" CssClass="label" runat="server"></asp:Label></li>
            <li><asp:Label CssClass="label" runat="server">Posición en el mercado:</asp:Label><asp:Label ID="lblPosMercado" CssClass="label" runat="server"></asp:Label></li>
            <li><asp:Label CssClass="label" runat="server">Impactos a largo y corto plazo:</asp:Label><asp:Label ID="lblImpacto" CssClass="label" runat="server"></asp:Label></li>
            
        
        </ul>
        <div class="secbotones"><asp:Button CssClass="bttonregistro" runat="server" 
                        ID="btnEnviaIndicadores" Text="Enviar" /></div>
    </div>

 <div id="divMetasCumplidas" style="display: none">
       <asp:CheckBox ID="chkMetasCumplidas" CssClass="chks" runat="server"/>
       0<asp:TextBox ID="txtEvalMetasCumplidas" runat="server" min="2" MaxLength="10" step="2" type="range" ></asp:TextBox>10
        <asp:Label ID="Label1" runat="server" >Observaciones:</asp:Label>
        <asp:TextBox ID="txtObsMetasCumplidas" runat="server" MaxLength="10" TextMode="MultiLine" Rows="8"></asp:TextBox>


       <ul>
            <li><asp:Label CssClass="label" runat="server">Metas Cumplidas:</asp:Label><asp:Label ID="lblMetasCumplidas" CssClass="label" runat="server"></asp:Label></li>
        
        </ul>
        <div class="secbotones"><asp:Button CssClass="bttonregistro" runat="server" 
                        ID="Button5" Text="Enviar" /></div>
    </div>

 <div id="divAdmonRecu" style="display: none">
       <asp:CheckBox ID="chkAdmonRecu" CssClass="chks" runat="server"/>
       0<asp:TextBox ID="txtEvaAdmonRecu" runat="server" min="2" MaxLength="10" step="2" type="range" ></asp:TextBox>10
        <asp:Label runat="server" >Observaciones:</asp:Label>
        <asp:TextBox ID="txtObsAdmonRecu" runat="server" MaxLength="10" TextMode="MultiLine" Rows="8"></asp:TextBox>


       <ul>
            <li><asp:Label CssClass="label" runat="server">Benchmark con la competencia:</asp:Label><asp:Label ID="lblBenchmarkComp" CssClass="label" runat="server"></asp:Label></li>
            
            <li><asp:Label CssClass="label" runat="server">La eficiencia, productividad, indicadores de avance y de control:</asp:Label><asp:Label ID="lblEficiencia" CssClass="label" runat="server"></asp:Label></li>
            
        </ul>
        <div class="secbotones"><asp:Button CssClass="bttonregistro" runat="server" 
                        ID="Button6" Text="Enviar" /></div>
    </div>

 <div id="divMoviRecu" style="display: none">
       <asp:CheckBox ID="chkMoviRecu" CssClass="chks" runat="server"/>
       0<asp:TextBox ID="txtEvaMoviRecu" runat="server" min="2" MaxLength="10" step="2" type="range" ></asp:TextBox>10
        <asp:Label runat="server" >Observaciones:</asp:Label>
        <asp:TextBox ID="txtObsMoviRecu" runat="server" MaxLength="10" TextMode="MultiLine" Rows="8"></asp:TextBox>


       <ul>
                <li><asp:Label CssClass="label" runat="server">Economía:</asp:Label><asp:Label ID="lblEconomia" CssClass="label" runat="server"></asp:Label></li>
            <li><asp:Label CssClass="label" runat="server">Competencias Principales:</asp:Label><asp:Label ID="lblCompPrincipales" CssClass="label" runat="server"></asp:Label></li>
            <li><asp:Label CssClass="label" runat="server">Habilidades de Equipo:</asp:Label><asp:Label ID="lblHabEquipo" CssClass="label" runat="server"></asp:Label></li>
            <li><asp:Label  CssClass="label" runat="server">Carácter:</asp:Label><asp:Label ID="lblCaracter" CssClass="label" runat="server"></asp:Label></li>
            <li><asp:Label CssClass="label" runat="server">Cultura:</asp:Label><asp:Label ID="lblCultura" CssClass="label" runat="server"></asp:Label></li>
        </ul>
        <div class="secbotones"><asp:Button CssClass="bttonregistro" runat="server" 
                        ID="Button7" Text="Enviar" /></div>
    </div>

 <div id="divPlanEvaluacion" style="display: none">
       <asp:CheckBox ID="chkPlanEvaluacion" CssClass="chks" runat="server"/>
       0<asp:TextBox ID="txtEvaPlanEvaluacion" runat="server" min="2" MaxLength="10" step="2" type="range" ></asp:TextBox>10
        <asp:Label runat="server" >Observaciones:</asp:Label>
        <asp:TextBox ID="txtObsPlanEvaluacion" runat="server" MaxLength="10" TextMode="MultiLine" Rows="8"></asp:TextBox>


       <ul>
            <li><asp:Label CssClass="label" runat="server">¿Qué necesitaría para informar el progreso y el impacto final?¿Quién debe hacerlo?:</asp:Label><asp:Label ID="lblBenchmark" CssClass="label" runat="server"></asp:Label></li>
            
        </ul>
        <div class="secbotones"><asp:Button CssClass="bttonregistro" runat="server" 
                        ID="btnEnviaPlanEv" Text="Enviar" /></div>
    </div>

    <div id="divEvaluacion" style="display:none">
      <ul>
            <li><asp:Label CssClass="label" runat="server">Datos Generales&nbsp=</asp:Label><asp:Label ID="lblEvDatosGenerales" CssClass="label" runat="server"></asp:Label><asp:Label CssClass="label" runat="server">&nbsp de&nbsp </asp:Label><asp:Label ID="lblPesoDatosGenerales" CssClass="label" runat="server"></asp:Label></li>
            <li><asp:Label CssClass="label" runat="server">Cadena de Valor&nbsp= </asp:Label><asp:Label ID="lblEvCadenaValor" CssClass="label" runat="server"></asp:Label><asp:Label CssClass="label" runat="server">&nbsp de&nbsp </asp:Label><asp:Label ID="lblPesoCadenaValor" CssClass="label" runat="server"></asp:Label></li>
            <li><asp:Label CssClass="label" runat="server">Áreas Grises&nbsp=</asp:Label><asp:Label ID="lblEvAreasGrises" CssClass="label" runat="server"></asp:Label><asp:Label CssClass="label" runat="server">&nbsp de&nbsp </asp:Label><asp:Label ID="lblPesoAreasGrises" CssClass="label" runat="server"></asp:Label></li>
            <li><asp:Label CssClass="label" runat="server">Indicadores de Valor y Benchmark&nbsp= </asp:Label><asp:Label ID="lblEvIndicadores" CssClass="label" runat="server"></asp:Label><asp:Label CssClass="label" runat="server">&nbsp de&nbsp </asp:Label><asp:Label ID="lblPesoInicadores" CssClass="label" runat="server"></asp:Label></li>
            <li><asp:Label CssClass="label" runat="server">Plan de Evaluacion&nbsp= </asp:Label><asp:Label ID="lblEvPlanEvaluacion" CssClass="label" runat="server"></asp:Label><asp:Label CssClass="label" runat="server">&nbsp de&nbsp </asp:Label><asp:Label ID="lblPesoPlanEvaluacion" CssClass="label" runat="server"></asp:Label></li>
            <li><asp:Label CssClass="label" runat="server">Total Etapa&nbsp= </asp:Label><asp:Label ID="lblEvTotalEtapa" CssClass="label" runat="server"></asp:Label><asp:Label CssClass="label" runat="server">&nbsp de&nbsp </asp:Label><asp:Label ID="lblPesoTotalEtapa" CssClass="label" runat="server"></asp:Label></li>

        </ul>
        <div class="secbotones"><asp:Button CssClass="bttonregistro" runat="server" 
                        ID="btnFinalizar" Text="Finalizar Evaluación" Height="32px" 
                Width="136px" /></div>
    </div>

   
    </form>
</body>
</html>