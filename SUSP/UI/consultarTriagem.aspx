<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="consultarTriagem.aspx.cs" Inherits="SUSP.UI.consultarTriagem" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>

     <style type="text/css">
                
       
        * {
        padding:0;
            margin-left: 0;
            margin-top: 0;
            margin-bottom: 0;
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

        /*CSS Menu Lateral*/
        .barra{
            background-color:#333;
            height:150%;
            width:250px;
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
        
         
        .auto-style4 {
            margin-left: 348px;
        }
        
        .auto-style6 {
            width: 903px;
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
            width: 662px;
        }

    
        .auto-style5 {
            margin-right: 132px;
        }
        .auto-style10 {
            width: 258px;
        }

	
        .auto-style11 {
            margin-left: 42px;
        }

	
         .auto-style12 {
             border-style: solid;
             border-color: inherit;
             border-width: 2px;
             background-color: #F4F4F9;
             margin-left: 350px;
             margin-right: 325px;
             border-radius: 10px;
             width: 662px;
             height: 344px;
         }

	
        </style>

</head>
<body>

     <!--Menu-->
    <input type="checkbox" id="check" />
    <label id="icone" for="check"><asp:Image ID="Image1" runat="server" ImageUrl="~/ESTILOS/icone.png" /></label>
    <div class="barra">
        <nav>
            <a href="home.aspx"><div class="link">Home</div></a>
            <a href="consultarTriagem.aspx"><div class="link">Consultas</div></a>
            <a href="triagemOnline.aspx"><div class="link">Triagem Online</div></a>
          
        </nav>

    </div>
    <!--Fim do menu-->

    <form id="form1" runat="server">
         <div id="topodapagina"><asp:Image ID="Image2" runat="server" ImageUrl="~/ESTILOS/consultas.png" Height="143px" Width="673px" CssClass="auto-style4" /></div></br>
        <div id="meiodapagina"><div class="auto-style12">

            &nbsp;
            <br /></br>

            &nbsp;Essas são as ultimas triagens em que você esteve.<br />
            <br />
            <table class="auto-style5" position ="center">

                <tr>
                    <td class="auto-style10">
                        &nbsp;</td>
                    <td class="auto-style6">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style10">&nbsp;</td>
                    <td class="auto-style6">
                        
                        <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="558px" CssClass="auto-style11" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                        </asp:GridView>
                        
                    </td>
                </tr>
            </table> 
        </div></div>
        
        

    </form>
</body>
</html>
