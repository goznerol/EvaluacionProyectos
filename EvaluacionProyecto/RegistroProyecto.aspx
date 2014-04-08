<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistroProyecto.aspx.cs" Inherits="EvaluacionProyecto.RegistroProyecto" %>

<DOCTYPE>
<html>

<head>
<script type="text/javascript" src="Scripts/evalProyectos.js"></script>
<%--<script type="text/C#" src="Main.aspx.cs"></script>--%>

<script type="text/javascript">

    function cambiarvista(current,opcion) {
        try {
            document.getElementById('datosGenerales').style.display = 'none';
            document.getElementById('generalesResumen').style.display = 'none';
            document.getElementById('generalesPruebas').style.display = 'none';

            document.getElementById('cadenaVision').style.display = 'none';
            document.getElementById('cadenaPortafolios').style.display = 'none';
            document.getElementById('cadenaEstrategia').style.display = 'none';
            document.getElementById('cadenaTrabajo').style.display = 'none';

            document.getElementById('areasGrises').style.display = 'none';

            document.getElementById('indicadoresImpacto').style.display = 'none';
            document.getElementById('IndicadoresMetas').style.display = 'none';
            document.getElementById('indicadoresAdministracion').style.display = 'none';
            document.getElementById('indicadoresMovilizacion').style.display = 'none';

            document.getElementById('planBenchmark').style.display = 'none';
            document.getElementById('divMensajeFinal').style.display = 'none';

            document.getElementById(current).style.display = '';


            //Quitar selected a los items del menu
            document.getElementById('mnuDatosg').className = 'a';
            document.getElementById('mnuResmen').className = 'a';
            document.getElementById('mnuPruebas').className = 'a';
            document.getElementById('mnuVision').className = 'a';
            document.getElementById('mnuPortafolios').className = 'a';
            document.getElementById('mnuEstrategia').className = 'a';
            document.getElementById('mnuTrabajo').className = 'a';
            document.getElementById('mnuareasGrises').className = 'a';
            document.getElementById('mnuIndicadoresImpacto').className = 'a';
            document.getElementById('mnuIndicadoresMetas').className = 'a';
            document.getElementById('mnuIndicadoresAdmin').className = 'a';
            document.getElementById('mnuIndicadoresMovil').className = 'a';
            document.getElementById('mnuPlanBench').className = 'a';

            //Resaltar Selected
            opcion.className = 'menu_selected';
            
            if (current == 'divMensajeFinal') {
                document.getElementById('menu').style.display = 'none';
            }
        }
        catch (e) {
            alert(e.messange);
       }
    }

    function mostrarocultar(tr,chk) {
        document.getElementById(tr).style.display = chk.checked==true?'':'none';

    }

</script>
<link  type="text/css" href="Styles/Site.css" rel="Stylesheet"/>
<title>EGS-Registro de proyectos</title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager runat="server" ID="smgeneral"></asp:ScriptManager>
    <h2 style="text-align:center">Alcance de Proyecto</h2>
    <div id="contenedor">
        <div id="menu">
        <asp:Label runat="server" Visible="false" ID="lblnomIDproyecto">ID de proyecto:</asp:Label>
        <asp:Label runat="server" ID="lblIdProyecto" Visible ="false">0</asp:Label>
        <asp:TextBox runat="server" CssClass="text"  Width="100%" ID="txtfecha" ReadOnly="true" Visible="false"></asp:TextBox>
        <h4 class="seccionmenu">
            
            Información general</h4>
            <ul class="ulmenu">
                <li id="mnuDatosg" onclick="cambiarvista('datosGenerales',this)" class="menu_selected">Datos generales</li>
                <li id="mnuResmen" onclick="cambiarvista('generalesResumen',this)">Resumen</li>
                <li id="mnuPruebas" onclick="cambiarvista('generalesPruebas',this)">Pruebas de validación</li>
            </ul>

            <h4 class="seccionmenu">Cadena de valor</h4>            
            <ul class="ulmenu">
                <li id="mnuVision" onclick="cambiarvista('cadenaVision',this)">Visión del futuro</li>
                <li id="mnuPortafolios" onclick="cambiarvista('cadenaPortafolios',this)">Portafolio de metas </li>
                <li id="mnuEstrategia" onclick="cambiarvista('cadenaEstrategia',this)">Estrategia de red</li>
                <li id="mnuTrabajo" onclick="cambiarvista('cadenaTrabajo',this)">Desgloce del trabajo</li>                
            </ul>

            <h4 class="seccionmenu">Áreas grises</h4>
            <ul class="ulmenu">
                <li id="mnuareasGrises" onclick="cambiarvista('areasGrises',this)">Supuestos y eventos sorpresas</li>
            </ul>

            <h4 class="seccionmenu">Indicadores de valor y benchmark</h4>
            <ul class="ulmenu">
                <li id="mnuIndicadoresImpacto" onclick="cambiarvista('indicadoresImpacto',this)">Impacto en la misión</li>
                <li id="mnuIndicadoresMetas" onclick="cambiarvista('IndicadoresMetas',this)">Metas cumplidas</li>
                <li id="mnuIndicadoresAdmin" onclick="cambiarvista('indicadoresAdministracion',this)">Administracón de recursos</li>
                <li id="mnuIndicadoresMovil" onclick="cambiarvista('indicadoresMovilizacion',this)"> Movilización de recursos</li>                
            </ul>

            <h4 class="seccionmenu">Plan de evaluación</h4>
            <ul class="ulmenu">
                <li id="mnuPlanBench" onclick="cambiarvista('planBenchmark',this)">Sobre benchmarks</li>
            </ul>
        </div>

        <div id="datosGenerales"  class="formSecciones">
            <div class="tituloseccion">
            <h4>Información general: <label>Datos generales</label></h4>
            </div>
            <ul>                
                <li><div class="label">Nombre del proyecto:</div><div class="campo"><asp:TextBox CssClass="text" runat="server" Width="100%" ID="txtNombre" MaxLength="200"></asp:TextBox></div></li>
                <li><div class="label">Definición del alcance:</div><div class="campo"><asp:TextBox  TextMode="MultiLine" CssClass="textmulti" runat="server" Width="100%" ID="txtAlcance" MaxLength="200"></asp:TextBox></div></li>
                <li><div class="label">Efectos adversos:</div><div class="campo"><asp:TextBox  TextMode="MultiLine" CssClass="textmulti" runat="server" Width="100%" ID="txtEfectos" MaxLength="200"></asp:TextBox></div></li>
                
                <li><div class="label">Lider del proyecto:</div><div class="campo"><asp:TextBox CssClass="text" runat="server"  Width="100%" ID="txtLider" MaxLength="200"></asp:TextBox></div></li>
                <li><div class="label">Integrantes:</div><div class="campo"><asp:TextBox CssClass="text" runat="server"  Width="100%" ID="txtIntegrantes" MaxLength="200"></asp:TextBox></div></li>
                              
                <li>
                    <div class="label">
                        Categoría:</div>
                    <div class="campo">
                        <asp:DropDownList runat="server" ID="ddlCategoria">
                            <asp:ListItem Value="1">AGENTE EDUCATIVO</asp:ListItem>
                            <asp:ListItem Value="2">EMPRENDEDORES</asp:ListItem>
                            <asp:ListItem Value="3">EQUIDAD DE GÉNERO</asp:ListItem>
                            <asp:ListItem Value="4">PREVENCIÓN</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </li>
                <li>
                    <div class="label">
                        Razón de conducción:</div>
                    <div class="campo">
                        <asp:DropDownList runat="server" ID="ddlRazonConduccion">
                            <asp:ListItem Value="1">INGRESOS</asp:ListItem>
                            <asp:ListItem Value="2">PRODUCTIVIDAD</asp:ListItem>
                            <asp:ListItem Value="3">PROTECCIÓN</asp:ListItem>
                            <asp:ListItem Value="4">SEGURIDAD</asp:ListItem>
                            <asp:ListItem Value="5">INICIO DE UNA ALIANZA</asp:ListItem>
                            <asp:ListItem Value="6">AHORROS</asp:ListItem>
                            <asp:ListItem Value="7">CUMPLIMIENTOS-MANDATOS</asp:ListItem>
                            <asp:ListItem Value="8">COMUNIDAD</asp:ListItem>
                            <asp:ListItem Value="9">OTROS</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </li>
                <li><div class="label">Prioridad/Peso:</div>
                    <div class="campo">
                        <asp:RadioButtonList runat="server" ID="rblPrioridad">
                            <asp:ListItem Value="1" Selected="True">Vital-Esencial-Necesario</asp:ListItem>
                            <asp:ListItem Value="2">Importante-Deberia</asp:ListItem>
                            <asp:ListItem Value="3">Agradable de hacer</asp:ListItem>
                            <asp:ListItem Value="4">Ahorro-Seguridad</asp:ListItem>
                            <asp:ListItem Value="4">Conformidad</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                </li>
                <br />
                <br />
                <div class="secbotones"><asp:Button CssClass="bttonregistro" runat="server" 
                        ID="guardargenerales" Text="Guardar" onclick="guardargenerales_Click" /></div>
            </ul>
       </div>

        <div id="generalesResumen" class="formSecciones" style="display:none">
            <div class="tituloseccion">
            <h4>Información general:<label> Resumen del proyecto</label></h4>
            </div>
            
            <asp:UpdatePanel ID="UpdatePanel8" runat="server">
            <ContentTemplate>
            <ul>            

                <li><div class="label">1.¿Cuáles son los beneficios que ofreces con el proyecto?</div><div class="campo1">  <asp:TextBox AutoPostBack="true" ontextchanged="txtBeneficiosOfrecidos_TextChanged" CssClass="text" runat="server" Width="100%" ID="txtBeneficiosOfrecidos" MaxLength="70"></asp:TextBox></div></li>
                <li><div class="label">2.-¿Qué productos o servicios ofreces?</div><div class="campo1">                     <asp:TextBox AutoPostBack="true" ontextchanged="txtBeneficiosOfrecidos_TextChanged" CssClass="text" runat="server" Width="100%" ID="txtPreguntaProducto" MaxLength="70"></asp:TextBox></div></li>
                <li><div class="label">3.-¿Cuál es tu mercado meta?</div><div class="campo1">                               <asp:TextBox AutoPostBack="true" ontextchanged="txtBeneficiosOfrecidos_TextChanged" CssClass="text" runat="server" Width="100%" ID="txtPreguntaMercado" MaxLength="70"></asp:TextBox></div></li>                
                <li><div class="label">4.-¿Qué beneficios obtendrás del proyecto?</div><div class="campo1">                 <asp:TextBox AutoPostBack="true" ontextchanged="txtBeneficiosOfrecidos_TextChanged" CssClass="text" runat="server" Width="100%" ID="txtPreguntaBeneficiosObtenidos" MaxLength="70"></asp:TextBox></div></li>
                <li><div class="label">5.-¿En qué tiepo obtendrás los beneficios?</div><div class="campo1">                 <asp:TextBox AutoPostBack="true" ontextchanged="txtBeneficiosOfrecidos_TextChanged" CssClass="text" runat="server" Width="100%" ID="txtPreguntaTiempo" MaxLength="70"></asp:TextBox></div></li>
                
                <li>
                <br />
                <div><hr />RESUMEN:</div><div class="campo1">
                    <asp:TextBox runat="server" Width="100%" ID="txtResumen" Rows="8" TextMode="MultiLine" MaxLength="200" ></asp:TextBox>
                </div></li>
                
                
                <br />
                <br />
                                                 
            </ul>
            </ContentTemplate>
            <Triggers><asp:AsyncPostBackTrigger ControlID="txtPreguntaProducto" EventName="TextChanged" /> </Triggers>
            </asp:UpdatePanel>
            <div class="secbotones"><asp:Button CssClass="bttonregistro" runat="server" 
                        ID="btnResumen" Text="Guardar" onclick="btnResumen_Click" /></div>
       </div>
       
        <div id="generalesPruebas" class="formSecciones" style="display:none">
            <div class="tituloseccion">
            <h4>Información general: <label>Validación de metas</label></h4>
            </div>
            <br />
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
                    <asp:TextBox runat="server" ID="txtTeminologiaExplicacion" TextMode="MultiLine" Width="95%" Rows="4" MaxLength="200"> </asp:TextBox>
                    <label class="instruccion">Explique en máximo de 200 caracteres como validó esta meta.</label>
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
                    <asp:TextBox runat="server" ID="txtMetasIntereses" TextMode="MultiLine" Width="95%" Rows="4" MaxLength="200"> </asp:TextBox>                    
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
                    <asp:TextBox runat="server" ID="txtMertasMotivos" TextMode="MultiLine" Width="95%" Rows="4" MaxLength="200"> </asp:TextBox>                    
                    <label class="instruccion">Explique en máximo de 200 caracteres como validó esta meta.</label>
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
                    <asp:TextBox runat="server" ID="txtMetasValores" TextMode="MultiLine" Width="95%" Rows="4" MaxLength="200"> </asp:TextBox>                    
                    <label class="instruccion">Explique en máximo de 200 caracteres como validó esta meta.</label>
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
                    <asp:TextBox runat="server" ID="txtMetasAnalisis" TextMode="MultiLine" Width="95%" Rows="4" MaxLength="200"> </asp:TextBox>
                    <label class="instruccion">Explique en máximo de 200 caracteres como validó esta meta.</label>
                 </td>
            </tr>
             </table>
             
           
                           <br />
                <br />
                <div class="secbotones"><asp:Button CssClass="bttonregistro" runat="server" ID="btnPruebas" Text="Guardar" OnClick="btnPruebas_Click"/></div> 
       </div>

        <div id="cadenaVision" class="formSecciones" style="display:none">
            <div class="tituloseccion"><h4>Cadena de valor: <label>Visión</label></h4>
            </div>
            <ul>
                <li>
                    <div class="label">
                        Definición de la visión:</div>
                    <div class="1">
                        <asp:TextBox runat="server" Width="100%" ID="txtVision" Rows="8" TextMode="MultiLine" MaxLength="200"></asp:TextBox>
                    </div>
                </li>
            </ul>
            <div class="secbotones"><asp:Button CssClass="bttonregistro" runat="server" ID="btnVision" Text="Guardar" OnClick="btnVision_Click"/></div> 
        </div>

        <div id="cadenaPortafolios" class="formSecciones" style="display:none">
            <div class="tituloseccion">
                <h4>Cadena de valor: <label> Portafolio de metas</label></h4>
            </div>
            <asp:UpdatePanel runat="server" id="upMetas">
            <ContentTemplate>
            
            <ul>
                <li>                    
                <li><label class="instruccion">Objetivos/metas (Expresadas en terminos de beneficios/objetivos)</label></li>
                    <div class="label">Descripción de meta:</div>
                    <div class="campo"><asp:TextBox runat="server" CssClass="text" Text="" Width="80%" ID="txtMetaagregar"></asp:TextBox>
                    <asp:Button runat="server" Text="Agregar" ID="btnMetaAgregar" OnClick="btnMetaAgregar_click"/>
                    <asp:Label runat="server" ID="lblMeta1" Visible="false"></asp:Label>
                    
                    </div>
                </li>
            </ul>
            
           </ContentTemplate>
            </asp:UpdatePanel>
             <div class="secbotones"><asp:Button CssClass="bttonregistro" runat="server" ID="btnMetas" Text="Guardar" OnClick="btnMetas_click"/></div> 
        </div>

        <div id="cadenaEstrategia" class="formSecciones" style="display:none">
            <div class="tituloseccion"><h4>Cadena de valor:<label>Estrategias de red</label></h4>
            </div>
            <asp:UpdatePanel runat="server" id="UpdatePanel1">
            <ContentTemplate>
            <ul>
                <li>
                <li><label class="instruccion">Entregables de productos/servicios (siendo el primero el de más importancia)</label></li>
                    <div class="label">Estrategias de red:</div>
                    <div class="campo"><asp:TextBox runat="server" CssClass="text" Text="" Width="80%" ID="txtEntregables" MaxLength="200"></asp:TextBox>
                    <asp:Button runat="server" Text="Agregar" ID="btnAgregarEntregable" OnClick="btnAgregarEntregable_click"/>
                    <asp:Label runat="server" ID="lblEntregable1" Visible="false"></asp:Label>
                    
                    </div>
                </li>
            </ul>
            
           </ContentTemplate>
            </asp:UpdatePanel>
            <div class="secbotones"><asp:Button CssClass="bttonregistro" runat="server" ID="btnEstrategias" Text="Guardar" OnClick="btnEstrategias_click" /></div>
        </div>

        <div id="cadenaTrabajo" class="formSecciones" style="display:none">
            <div class="tituloseccion"><h4>Cadena de valor:<label>Desgloce de trabajo</label></h4>
            </div>
           <asp:UpdatePanel runat="server" id="UpdatePanel2">
            <ContentTemplate>
            
            <ul>
                <li>                    
                <li><label class="instruccion">Recursos, aliados, información, tecnólogia, inteligencia, aportaciones</label></li>
                    <div class="label">Desgloce del trabajo:</div>
                    <div class="campo"><asp:TextBox runat="server" CssClass="text" Text="" Width="80%" ID="txtdesgloce" MaxLength="200"></asp:TextBox>
                    <asp:Button runat="server" Text="Agregar" ID="btnAgregarDesgloce" OnClick="btnAgregarDesgloce_click" />
                    <asp:Label runat="server" ID="lblRecursos1" Visible="false"></asp:Label>
                    
                    </div>
                </li>
            </ul>
            
           </ContentTemplate>
            </asp:UpdatePanel>
            <div class="secbotones"><asp:Button CssClass="bttonregistro" runat="server" ID="btnRecurso" Text="Guardar" OnClick="btnRecurso_click" /></div>
        </div>


        <div id="areasGrises" class="formSecciones" style="display:none">
            <div class="tituloseccion"><h4>Áreas grises:<label>Supuestos y eventos sorprsa</label></h4>
            </div>            
            <label class="instruccion">Enumerar aquí las condiciones más alla de su control (Esto es la base para la mitigación de riesgos)</label>
            <br />
            <br />
            <div class="horizontalaccordion">
                <ul>
                    <li>
                        <h4>
                            Responsabilidad (calidad)</h4>
                        <div>
                            <asp:UpdatePanel runat="server" ID="UpdatePanel3">
                                <ContentTemplate>
                                    <ul>
                                        <li>                                            
                                            <div class="label1">
                                                Supuesto/Evento:</div>
                                            <div class="campo1">
                                                <asp:TextBox runat="server" CssClass="text" Text="" Width="75%" ID="txtSupuestoRespCalidad" MaxLength="200"></asp:TextBox>
                                                <asp:Button runat="server" Text="Agregar" ID="btnResponsabilidadCal" OnClick="btnResponsabilidadCal_click" />
                                                <asp:Label runat="server" ID="lblResponsabilidad1" Visible="false"><br /></asp:Label>
                                                
                                            </div>
                                        </li>
                                    </ul>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                         </div>
                    </li>
                    <li>
                        <h4>
                            Procesos de trabajo</h4>
                        <div>
                        <asp:UpdatePanel runat="server" ID="UpdatePanel4">
                                <ContentTemplate>
                                    <ul>
                                        <li>                                            
                                            <div class="label1">
                                                Supuesto/Evento:</div>
                                            <div class="campo1">
                                                <asp:TextBox runat="server" CssClass="text" Text="" Width="75%" ID="txtSupuestoProcesoTrabajo" MaxLength="200"></asp:TextBox>
                                                <asp:Button runat="server" Text="Agregar" ID="btnProcesoTrabajo" OnClick="btnProcesoTrabajo_click" />
                                                <asp:Label runat="server" ID="lblProcesoTrabajo1" Visible="false"><br /></asp:Label>
                                                
                                            </div>
                                        </li>
                                    </ul>
                                </ContentTemplate>
                            </asp:UpdatePanel>

                        </div>
                    </li>
                    <li>
                        <h4>
                            Calidad, Tiempo, Costo</h4>
                        <div>
                        <asp:UpdatePanel runat="server" ID="UpdatePanel5">
                                <ContentTemplate>
                                    <ul>
                                        <li>                                            
                                            <div class="label1">
                                                Supuesto/Evento:</div>
                                            <div class="campo1">
                                                <asp:TextBox runat="server" CssClass="text" Text="" Width="75%" ID="txtSupuestoCalidad" MaxLength="200"></asp:TextBox>
                                                <asp:Button runat="server" Text="Agregar" ID="btnCaltico" OnClick="btnCaltico_click"/>
                                                <asp:Label runat="server" ID="lblCaltico1" Visible="false"><br /></asp:Label>
                                                
                                            </div>
                                        </li>
                                    </ul>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </li>
                    <li>
                        <h4>
                            Responsablidad (Entorno operativo)</h3>
                        <div>

                        <asp:UpdatePanel runat="server" ID="UpdatePanel6">
                                <ContentTemplate>
                                    <ul>
                                        <li>                                            
                                            <div class="label1">
                                                Supuesto/Evento:</div>
                                            <div class="campo1">
                                                <asp:TextBox runat="server" CssClass="text" Text="" Width="75%" ID="txtSupuestoRespProducto" MaxLength="200"></asp:TextBox>
                                                <asp:Button runat="server" Text="Agregar" ID="btnResponsabilidadEo" OnClick="btnResponsabilidadEo_click" />
                                                <asp:Label runat="server" ID="lblResponsabilidadEo1" Visible="false"><br /></asp:Label>
                                                
                                            </div>
                                        </li>
                                    </ul>
                                </ContentTemplate>
                            </asp:UpdatePanel>

                        </div>
                    </li>
                    <li>
                        <h4>
                         Gobernabilidad</h4>
                        <div>
                         <asp:UpdatePanel runat="server" ID="UpdatePanel7">
                                <ContentTemplate>
                                    <ul>
                                        <li>                                            
                                            <div class="label1">
                                                Supuesto/Evento:</div>
                                            <div class="campo1">
                                                <asp:TextBox runat="server" CssClass="text" Text="" Width="76%" ID="txtSupuestoGobernabilidad" MaxLength="200"></asp:TextBox>
                                                <asp:Button runat="server" Text="Agregar" ID="btnGobernabilidad" OnClick="btnGobernabilidad_click" />
                                                <asp:Label runat="server" ID="lblGobernabilidad1" Visible="false"><br /></asp:Label>
                                                
                                            </div>
                                        </li>
                                    </ul>
                                    
                                </ContentTemplate>

                            </asp:UpdatePanel>
                            
                        </div>
                        
                    </li>
                </ul>
                <div class="secbotones"><asp:Button CssClass="bttonregistro" runat="server" ID="btnAreasGrises" Text="Guardar" OnClick="btnAreasGrises_click" /></div>
            </div>

        </div>

        <div id="indicadoresImpacto" class="formSecciones" style="display:none">
            <div class="tituloseccion"><h4>Indicadores: <label> Impacto en la misión</label></h4>
            </div>
            <ul>
                <li>
                    <div class="label">
                        Retención del talento, innovación, indicadores financieros:</div>
                    <div class="campo1">
                        <asp:TextBox runat="server" CssClass="text" Width="100%" ID="txtImpacto" MaxLength="200" TextMode="MultiLine" Rows="4"></asp:TextBox></div>
                </li>
                <li>
                    <div class="label">
                     Posición en el mercado (ventaja competitiva a corto y largo plazo):</div>
                    <div class="campo1">
                        <asp:TextBox runat="server" CssClass="text" Width="100%" ID="txtPosMercado" MaxLength="200" TextMode="MultiLine" Rows="4"></asp:TextBox>
                    </div>
                </li>

                <li>
                    <div class="label">
                        Impactos a corto y largo plazo (ecosistemas, seguridad, salud, equidad):</div>
                    <div class="campo1">
                        <asp:TextBox runat="server" CssClass="text" Width="100%" ID="txtCortoLargoPlazo" MaxLength="200" TextMode="MultiLine" Rows="4"></asp:TextBox></div>
                </li>
                <div class="secbotones"><asp:Button CssClass="bttonregistro" runat="server" ID="btnImpacto" Text="Guardar" OnClick="btnImpacto_click" /></div>
            </ul>
        </div>


        <div id="IndicadoresMetas" class="formSecciones" style="display:none">
            <div class="tituloseccion"><h4>Indicadores:<label>Metas cumplidas</label></h4>
            </div>
            <asp:UpdatePanel runat="server" ID="UpdatePanel9">
                <ContentTemplate>
                    <ul>
                        <li>
                            <div class="label">
                                Indicador:</div>
                            <div class="campo1">
                                &nbsp;&nbsp;&nbsp;
                                <asp:TextBox runat="server" CssClass="text" Width="74%" ID="txtIndicadorMeta" MaxLength="200"></asp:TextBox>
                                <asp:Button runat="server" Text="Agregar" ID="btnIndicadorMeta" OnClick="btnIndicadorMeta_click" />
                                <asp:Label runat="server" ID="lblMetaCumplida1" Visible="false"><br/></asp:Label>
                            </div>
                        </li>
                        <div class="secbotones">
                            <asp:Button CssClass="bttonregistro" runat="server" ID="btnMetasCumplidas" Text="Guardar" OnClick="btnMetasCumplidas_click" /></div>
                    </ul>
                </ContentTemplate>
            </asp:UpdatePanel>
           
        </div>
        
         <div id="indicadoresAdministracion" class="formSecciones" style="display:none">
            <div class="tituloseccion"><h4>Indicadores: <label> Administración de recursos</label></h4>
            </div>            
            <ul>
            <label class="instruccion">Producto, tarea, administración de recursos</label>
                <li>                                
                    <div class="label">
                        Benchmarcks con la competencia:</div>
                    <div class="campo1">
                        <asp:TextBox runat="server"  Width="100%" TextMode="MultiLine" Rows="4" ID="txtBenchmark" MaxLength="200"></asp:TextBox></div>
                </li>

                <label class="instruccion">Equipo, sinergia, el tiempo de produccion, costos, flujos de caja, etc.</label>
                <li>                
                    <div class="label">
                        La eficiencia, productividad, indicadores de avance y control:</div>
                    <div class="campo1">
                        <asp:TextBox runat="server"  Width="100%" TextMode="MultiLine" Rows="4" ID="txtEficiencia"  MaxLength="200"></asp:TextBox></div>
                </li>
                <div class="secbotones"><asp:Button CssClass="bttonregistro" runat="server" ID="btnEficiencia" Text="Guardar" OnClick="btnEficiencia_click" /></div>
            </ul>
        </div>

        <div id="indicadoresMovilizacion" class="formSecciones" style="display:none">
            <div class="tituloseccion"><h4>Indicadores: <label>Movilización de recursos</label></h4>
            </div>
            <ul>
                <li>
                    <div class="label">
                        Economía (Costo de los Recursos vs normas):</div>
                    <div class="1">
                        <asp:TextBox runat="server" CssClass="text" Width="100%" ID="txtEconomia" MaxLength="200" TextMode="MultiLine" Rows="2"></asp:TextBox></div>
                </li>
                <li>
                    <div class="label">
                     Competencias principales:</div>
                    <div class="1">
                        <asp:TextBox runat="server" CssClass="text" Width="100%" ID="txtCoreHab" MaxLength="200" TextMode="MultiLine" Rows="2"></asp:TextBox>
                    </div>
                </li>

                <li>
                    <div class="label">
                        Habilidades de equipo:</div>
                    <div class="1">
                        <asp:TextBox runat="server" CssClass="text" Width="100%" ID="txtHabEquipo" MaxLength="200" TextMode="MultiLine" Rows="2"></asp:TextBox></div>
                </li>
                <li>
                    <div class="label">
                        Carácter (Integridad, Confiabilidad, Estabilidad):</div>
                    <div class="1">
                        <asp:TextBox runat="server" CssClass="text" Width="100%" ID="txtCaracter" MaxLength="200" TextMode="MultiLine" Rows="2"></asp:TextBox></div>
                </li>
                <li>
                    <div class="label">
                        Cultura (Creatividad, Iniciativa, Compromiso, Espiritu de empresa):</div>
                    <div class="1">
                        <asp:TextBox runat="server" CssClass="text" Width="100%" ID="txtCultura" MaxLength="200" TextMode="MultiLine" Rows="2" ></asp:TextBox></div>
                </li>
                <div class="secbotones"><asp:Button CssClass="bttonregistro" runat="server" ID="btnMoviRecursos" Text="Guardar" OnClick="btnMoviRecursos_click" /></div>
            </ul>
        </div>

        <div id="planBenchmark" class="formSecciones" style="display:none">
            <div class="tituloseccion"><h4>Plan de evaluación: <label> Sobre Benchmarks </label></h4>
            </div>
            <ul>
                <li>
                    <div class="label">
                        ¿Qué necesitaría para informar sobre el progreso y el impacto final?</div>
                    <div class="label">
                        ¿Quién debe hacerlo?</div>

                    <div class="1">
                        <asp:TextBox runat="server" Width="100%" ID="txtSobreBenchmark" Rows="8" TextMode="MultiLine" MaxLength="200"></asp:TextBox>
                    </div>
                </li>
            </ul>
            <div class="secbotones"><asp:Button CssClass="bttonregistro" runat="server" ID="btnBenchmark" Text="Guardar" OnClick="btnBenchmark_Click"/></div> 
        </div>

        <div id="divMensajeFinal" class="formSecciones" style="display:none">
              <div class="tituloseccion"><label>Agradecimientos </label></div>
              <p>
                 Estimado Participante
                    Es grato saludarlo, para agradecerle su participación en el concurso para RACEAWARD “CONSTRUYENDO GRANDES NACIONES Y ORGANIZACIONES”.                    
               </P>
               
               <p>     
                    Atentamente:
                    Executive Global System
                    
              </p>
              <div class="secbotones"></div> 
        </div>
    </div>            
    </form>
</body>
</html>
