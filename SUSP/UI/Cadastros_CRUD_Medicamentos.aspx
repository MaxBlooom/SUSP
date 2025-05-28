<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cadastros_CRUD_Medicamentos.aspx.cs" Inherits="SUSP.UI.Cadastros_CRUD_Medicamentos" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <!--CSS INLINE para o menu lateral - notem que a imagem que abre e fecha o menu é uma checkbox-->
     <style>
         * {
        margin:0 0 0 1;
        padding:0;        
        }
        body {
        background-color:#9F9F9;
        }
        #check{
            display:none;;

        }
        #icone{
            cursor:pointer;
            padding:15px;
            position:absolute;
            z-index:1;
        }
        .barra{
            background-color:#333;
            height:200%;
            width:300px;
            position:absolute;
            transition: all .2s linear;
            left:-300px;
            }

        nav{
            width:100%;
            position:absolute;
            top:60px;
        }
        nav a{
            text-decoration:none;

        }
        .link {
        background-color:#494950;
        padding:20px;
        font-family:Arial;
        font-size:12pt;
        transition:all .2s linear;
        color:#F4F4F9;
        border-bottom: 2px solid #222;
        opacity:o;
        margin-top:200px;
        }

        .link:hover {
        background-color:#050542;
        }

        #check:checked ~.barra {
        transform:translate(300px);
        
        }
         #check:checked ~.barra nav a .link {
       opacity:1;
       margin-top:0;
       transition-delay:0.1s;
        
        }

         .imageTopo {
         
         margin-left: 300px;
             margin-right: 325px;
         }

         /*div da Tabela*/ 
        .borderDivTable {

            border-style: solid;
            border-color: inherit;
            border-width: 2px;
            background-color:#F4F4F9;
            margin-left: 328px;
            margin-right: 325px;
            border-radius: 10px;
            width: 685px;
            height: 246px;
         }     
        
         /* Div Meio da Página*/
         .menuSelecao {
             margin-left: 400px;
             margin-right: 325px;
         }

         .menuSelecao ul {
            margin: 0;
            background-color: #333;
            list-style:none;
            width: 550px;
            border-style: solid;
            border-color: inherit;
            border-width: 2px;
            border-radius: 10px;
            font-family:'Century Gothic';
         }

        .menuSelecao ul li {
        display: inline;
        text-align: center;  
        }

         .menuSelecao ul li a {
         
         padding: 10px 10px;
         display: inline-block;
         color: #FFFFFF;
         text-decoration: none;
         width: 113px;
         }

        .menuSelecao ul li a:hover {               
            color: #33FF33; 
        }

         .auto-style3 {
             border-style: solid;
             border-color: inherit;
             border-width: 2px;
             background-color: #F4F4F9;
             margin-left: 328px;
             margin-right: 325px;
             border-radius: 10px;
             width: 690px;
             height: 419px;
         }
      
         .auto-style6 {
             width: 100%;
             height: 71px;
             margin-top: 7px;
             margin-bottom: 19;
         }

          /*Borda redonda na textbox*/
        .textbox
        {
            border-radius: 10px;
            border-radius: 10px;
            font-family: Arial;
            font-size: 11 pt;
            border: 1px solid Black;
            text-align:center;
        }

         .auto-style11 {
             width: 380px;
         }
         .auto-style12 {
             width: 371px;
         }
         .auto-style13 {
             width: 366px;
         }
         .auto-style15 {
             width: 100%;
         }
         .auto-style31 {
             height: 40px;
         }
         .auto-style37 {
             height: 40px;
             width: 126px;
         }
         .auto-style38 {
             height: 40px;
             width: 220px;
         }
         .auto-style49 {
             height: 43px;
             width: 126px;
         }
         .auto-style52 {
             height: 12px;
             width: 126px;
         }
         .auto-style53 {
             height: 12px;
             width: 220px;
         }
         .auto-style54 {
             height: 12px;
         }
         .auto-style55 {
             height: 43px;
             width: 220px;
         }
         .auto-style56 {
             height: 43px;
         }
         .auto-style57 {
             height: 89px;
             width: 126px;
         }
         .auto-style58 {
             height: 89px;
             width: 220px;
         }
         .auto-style59 {
             height: 89px;
         }
         .auto-style60 {
             width: 100%;
             height: 284px;
         }
         .auto-style61 {
             margin-left: 0px;
         }
         .auto-style62 {
             margin-left: 327px;
         }
         </style>
</head>
<body>

    <!--Menu-->
    <input type="checkbox" id="check" />
    <label id="icone" for="check"><asp:Image ID="Image1" runat="server" ImageUrl="~/ESTILOS/icone.png" /></label>
    <div class="barra">
        <nav>
            <a href="homeFuncionario.aspx"><div class="link">Home</div></a>
            <a href="relatorioTriagem.aspx"><div class="link">Relatório de Triagem Por Mês</div></a>
             <a href="relatorioQuanPacientePorMes.aspx"><div class="link">Relatório Quantidade de Pacientes Por Mês</div></a>
            <a href=""><div class="link">Meu Perfil</div></a>
        </nav>

    </div>
    <!--Fim do menu-->

     <form id="form1" runat="server">
         <div id="topodapagina"><asp:Image ID="Image2" class ="imageTopo" runat="server" ImageUrl="~/ESTILOS/cadastro.png" Height="87px" Width="750px" /></div></br> </br>
        
        <!-- Div Menu de Seleção-->
        <div class="menuSelecao">
            <ul>
                <li> <a href="cadastros_CRUD_Pacientes.aspx" class="auto-style11">Paciente</a></li>
                <li> <a href="cadastros_CRUD_Especialista.aspx" class="auto-style15">Especialista</a></li>
                <li> <a href="cadastros_CRUD_Funcionarios.aspx" class="auto-style13">Funcionário</a></li>
                <li> <a href="Cadastros_CRUD_Medicamentos.aspx" class="auto-style12">Medicamentos</a></li>
            </ul>
        </div></BR></BR>

        <!--Div Meio da Página-->
         <div id="meiodapagina"><div class="auto-style3">   
             
             <table class="auto-style60">
                 <tr>
                     <td class="auto-style52"></td>
                     <td class="auto-style53"></td>
                     <td class="auto-style54">
                     </td>
                 </tr>
                 <tr>
                     <td class="auto-style37"></td>
                     <td class="auto-style38"><center>Nome do Medicamento:</center></td>
                     <td class="auto-style31">
                         <asp:TextBox ID="NomeMedTextBox" runat="server" Width="139px" CssClass="textbox"></asp:TextBox>
                     </td>
                 </tr>
                 <tr>
                     <td class="auto-style49"></td>
                     <td class="auto-style55"><center>Tipo do Medicamento:</center> </td>
                     <td class="auto-style56">
                         <asp:TextBox ID="TipoMedTextBox" runat="server" Width="139px" CssClass="textbox"></asp:TextBox>
                     </td>
                 </tr>
                 <tr>
                     <td class="auto-style57">&nbsp;</td>
                     <td class="auto-style58"><center>Descrição do Medicamento:</center> </td>
                     <td class="auto-style59">
                         <asp:TextBox ID="DescriMedTextBox" runat="server" TextMode="MultiLine" Height="74px" Width="228px" CssClass="textbox"></asp:TextBox>
                     </td>
                     </tr>
                                      
                 </table>
                 
             
             <table class="auto-style6">
                 <tr>
                     <td>
                     
                     <center><asp:ImageButton ID="ImageButton1" runat="server"  Height="67px" ImageUrl="~/ESTILOS/save.png" ToolTip="Inserir Medicamento" Width="74px" OnClick="ImageButton1_Click" /></center>
                                              
                     </td>
                     <td>
                       
                         <center><asp:ImageButton ID="ImageButton2" runat="server" Height="67px" CssClass="auto-style61" ImageUrl="~/ESTILOS/cancel.png" ToolTip="Limpar Campos" Width="74px" OnClick="ImageButton2_Click" /></center>
                     </td>
                     
                 </tr>
             </table>
             <center>  
                 <br />
                 <asp:Label ID="confirmacaoLabel" runat="server"></asp:Label> </center>
             </div>
         </div>
         <p class="auto-style62">
&nbsp; Clique
             <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/UI/ListarAllMedicamentos.aspx">Aqui</asp:HyperLink>
&nbsp;Para Consultar Todos os Medicamentos</p>
    </form>
</body>
</html>
