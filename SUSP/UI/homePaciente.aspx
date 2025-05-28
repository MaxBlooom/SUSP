<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="homePaciente.aspx.cs" Inherits="SUSP.UI.homePacienteTeste" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Home Paciente</title>
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
             margin-left: 305px;
             margin-right: 325px;
             border-radius: 10px;
             width: 711px;
             height: 247px;
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
           <!-- <a href=""><div class="link">Especialistas</div></a>-->
            <!--<a href=""><div class="link">Contato</div></a>-->
        </nav>

    </div>
    <!--Fim do menu-->

    <form id="form1" runat="server">
         <div id="topodapagina"><asp:Image ID="Image2" class ="imageTopo" runat="server" ImageUrl="~/ESTILOS/bemvindo.png" Height="131px" Width="750px" /></div></br> </br>
        
        <!-- Div Menu de Seleção-->
        </BR>

        <!--Div Meio da Página-->
         <div id="meiodapagina"  class="auto-style3">
             <asp:Label ID="trazNomeLabel" runat="server"></asp:Label>
         </div> </br></br></br>  
             <div id="meiodapagina" class="auto-style3" ></div> 
             
         </form>
</body>
</html>
