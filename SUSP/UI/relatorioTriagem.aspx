<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="relatorioTriagem.aspx.cs" Inherits="SUSP.UI.relatorioTriagem" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>

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

    
          .auto-style1 {
              margin-left: 32px;
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
         <div id="topodapagina"><asp:Image ID="Image2" runat="server" ImageUrl="~/ESTILOS/consultas.png" Height="143px" Width="673px" CssClass="auto-style4" style="margin-left: 347px" /></div></br>
        <div id="meiodapagina"><div class="borderDivTable">

            &nbsp;
            <br />
&nbsp;&nbsp;
            <asp:Label ID="Label1" runat="server" Text="Consulte todas as triagens de uma determinada data:"></asp:Label>
&nbsp;<asp:TextBox ID="tbData" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnConsultar" runat="server" OnClick="btnConsultar_Click" Text="Consultar" />
            <br />
            <br />
            <div>
            <asp:GridView ID="gridTriagem" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Height="132px" Width="607px" CssClass="auto-style1">
                <AlternatingRowStyle BackColor="White" />
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
                </div>
            </br>
      
    </form>
</body>
</html>
