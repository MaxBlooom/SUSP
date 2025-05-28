<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="relatorioQuanPacientePorMes.aspx.cs" Inherits="SUSP.UI.relatorioQuanPacientePorMes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Relatório de pacientes por mês</title>

     <style type="text/css">
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
             margin-left: 350px;
             margin-right: 325px;
             border-radius: 10px;
            width: 670px;
              height: 370px;
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
            <a href="cadastros_CRUD_Pacientes.aspx"><div class="link">Cadastros</div></a>
            <a href="relatorioTriagem.aspx"><div class="link">Relatório de Triagem Por Mês</div></a>
             <a href="relatorioQuanPacientePorMes.aspx"><div class="link">Relatório Quantidade de Pacientes Por Mês</div></a>
            <a href=""><div class="link">Meu Perfil</div></a>
        </nav>

    </div>
    <!--Fim do menu-->
     <form id="form1" runat="server">
         <div id="topodapagina"><asp:Image ID="Image3" runat="server" ImageUrl="~/ESTILOS/consultas.png" Height="143px" Width="673px" CssClass="auto-style4" style="margin-left: 347px" /></div></br>
        <div id="meiodapagina"><div class="borderDivTable">
         
            <div>


                <br />
                &nbsp;<asp:Label ID="Label1" runat="server" Text="Consulte quantos pacientes foram atendidos em um determinado mês:"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp; <asp:DropDownList ID="DropDownList1" runat="server" Height="20px" OnTextChanged="DropDownList1_TextChanged" Width="89px">
                    <asp:ListItem Selected="True" Value="01">Janeiro</asp:ListItem>
                    <asp:ListItem Value="02">Fevereiro</asp:ListItem>
                    <asp:ListItem Value="03">Março</asp:ListItem>
                    <asp:ListItem Value="04">Abril</asp:ListItem>
                    <asp:ListItem Value="05">Maio</asp:ListItem>
                    <asp:ListItem Value="06">Junho</asp:ListItem>
                    <asp:ListItem Value="07">Julho</asp:ListItem>
                    <asp:ListItem Value="08">Agosto</asp:ListItem>
                    <asp:ListItem Value="09">Setembro</asp:ListItem>
                    <asp:ListItem Value="10">Outubro</asp:ListItem>
                    <asp:ListItem Value="11">Novembro</asp:ListItem>
                    <asp:ListItem Value="12">Dezembro</asp:ListItem>
                </asp:DropDownList>


                &nbsp;


                <asp:ImageButton ID="ImageButton1" runat="server" Height="22px" ImageUrl="~/ESTILOS/buscarButton.png" OnClick="ImageButton1_Click" Width="38px" />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                &nbsp;<asp:Label ID="lbNotificacao" runat="server" Text="O número de pacientes atendidos no mês seleionado é: "></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
                <b>&nbsp;<asp:Label ID="lbResult" runat="server"></asp:Label></b>


            </div>
            </form>
</body>
</html>
