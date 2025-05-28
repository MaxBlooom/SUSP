<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SUSP.testeLog" %>

<!DOCTYPE html>
<head>
    <title>Login</title>
   

</head>
<body>
<form id="form1" runat="server">


<nav class="nav_tabs">
    <style>
        	*{
		margin: 0;
		padding: 0;
	}

	body{
		background-color: gainsboro;
		font-family: 'Roboto Condensed';
	}
   
    /*Definição de Desig da janela de login*/
	.nav_tabs{
        left:400px;
        right:325px;
		width: 300px;
		height: 400px;
		margin: 30px ;
		background-color: #fff;
		position: relative;
	}

	.nav_tabs ul{
		list-style: none;
	}

	.nav_tabs ul li{
		float: left;
	}

	.tab_label{
		display: block;
		width: 100px;
		background-color: #363b48;
		padding: 25px;
		font-size: 20px;
		color:#fff;
		cursor: pointer;
		text-align: center;
	}


	.nav_tabs .rd_tab { 
	display:none;
	position: absolute;
}

/*Cor de fundo da Seleção de Paciente e Funcionário*/
.nav_tabs .rd_tab:checked ~ label { 
	background-color: #87CEFA;
	color:#fff;}

/*Cor e posição da Content que é o quadro que guarda as textboxs e butons*/
.tab-content{
	border-top: solid 5px #87CEFA;
	background-color: white;
	display: none;
	position: absolute;
	height: 320px;
	width: 600px;
	left: 0;	
}

.rd_tab:checked ~ .tab-content{
	display: block;
}
.tab-content h2{
	padding: 10px;
	color: #87CEFA;
}
.tab-content article{
	padding: 10px;
	color: #555;
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

    </style>
<center>
  <ul>
    <li>
      <input type="radio" id="tab1" class="rd_tab" name="tabs" checked>
        <label for="tab1" class="tab_label">
        Paciente</label>
      <div class="tab-content">
        <h2>Login Paciente</h2>
        <article id="Logar">
            
             <table>
                 <tr>
                     <td> <h3>Usuario:</h3> </td>
                     <td><asp:textbox ID="loginPacienteTextBox" runat="server" CssClass="textbox" Height="32px" Width="170px" ></asp:textbox></br></td> 
                     
                 </tr>
            
                 <tr>
                      <td> <h3>Senha:</h3> </td>
                     <td> <asp:textbox ID="senhaPacienteTextBox" runat="server" CssClass="textbox" Height="32px" Width="170px" type="password"></asp:textbox></td>
                 </tr>
                 <tr>
 
                 </tr>
                 
                 </table>
        <br />
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <asp:ImageButton ID="pacienteImageButton" runat="server" OnClick="pacienteImageButton_Click" Height="46px" Width="101px" ImageUrl="~/ESTILOS/login.png"></asp:ImageButton>
            </br></br>
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<asp:label ID="pacienteLabel" runat="server" name=""/>
            
        </article>
      </div>
    </li>
    <li>
      <input type="radio" name="tabs" class="rd_tab" id="tab2">
        <label for="tab2" class="tab_label">Funcionário</label>
      <div class="tab-content">
        <h2>Login Funcionário</h2>
        <article>
                 <table>
                 <tr>
                     <td> <h3>Usuario:</h3> </td>
                     <td><asp:textbox ID="FuncionarioTextbox" runat="server" CssClass="textbox" Height="32px" Width="170px"></asp:textbox></td>                   
                 </tr>
                 <tr>
                      <td> <h3>Senha:</h3> </td>
                     <td> <asp:textbox ID="senhaFunTextbox2" runat="server" CssClass="textbox" Height="32px" Width="170px" type="password"></asp:textbox></td>
                 </tr>
                                  
                 </table>
            <br />
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <asp:ImageButton ID="funcionarioImageButton" runat="server" ImageUrl="~/ESTILOS/login.png" Height="46px" Width="101px" OnClick="funcionarioImageButton_Click"></asp:ImageButton>
            <br /></br>
            <asp:label ID="funcionarioLabel" runat="server" />
        </article>
      </div>
    </li>

   
  </ul>
</nav>
    </center>
</form>
</body>