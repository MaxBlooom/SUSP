<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cadastros_CRUD_Funcionarios.aspx.cs" Inherits="SUSP.UI.cadastros_CRUD_Funcionarios" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Cadastro de Funcionários</title>

     <script>
        function formataMascara(campo, evt, formato) {
            evt = getEvent(evt);
            var tecla = getKeyCode(evt);
            if (!teclaValida(tecla))
                return;

            var result = "";
            var maskIdx = formato.length - 1;
            var error = false;
            var valor = campo.value;
            var posFinal = false;
            if (campo.setSelectionRange) {
                if (campo.selectionStart == valor.length)
                    posFinal = true;
            }
            valor = valor.replace(/[^0123456789Xx]/g, '');
            for (var valIdx = valor.length - 1; valIdx >= 0 && maskIdx >= 0; --maskIdx) {
                var chr = valor.charAt(valIdx);
                var chrMask = formato.charAt(maskIdx);
                switch (chrMask) {
                    case '#':
                        if (!(/\d/.test(chr)))
                            error = true;
                        result = chr + result;
                        --valIdx;
                        break;
                    case '@':
                        result = chr + result;
                        --valIdx;
                        break;
                    default:
                        result = chrMask + result;
                }
            }
            campo.value = result;
            campo.style.color = error ? 'red' : '';
            if (posFinal) {
                campo.selectionStart = result.length;
                campo.selectionEnd = result.length;
            }
            return result;
        }
       
        //descobre qual a posição do cursor no campo
        function PosicaoCursor(textarea) {
            var pos = 0;
            if (typeof (document.selection) != 'undefined') {
                //IE
                var range = document.selection.createRange();
                var i = 0;
                for (i = textarea.value.length; i > 0; i--) {
                    if (range.moveStart('character', 1) == 0)
                        break;
                }
                pos = i;
            }
            if (typeof (textarea.selectionStart) != 'undefined') {
                //FireFox
                pos = textarea.selectionStart;
            }
            if (pos == textarea.value.length)
                return 0; //retorna 0 quando não precisa posicionar o elemento
            else
                return pos; //posição do cursor
        }

        // move o cursor para a posição pos
        function MovimentaCursor(textarea, pos) {
            if (pos <= 0)
                return; //se a posição for 0 não reposiciona
            if (typeof (document.selection) != 'undefined') {
                //IE
                var oRange = textarea.createTextRange();
                var LENGTH = 1;
                var STARTINDEX = pos;
                oRange.moveStart("character", -textarea.value.length);
                oRange.moveEnd("character", -textarea.value.length);
                oRange.moveStart("character", pos);
                //oRange.moveEnd("character", pos);
                oRange.select();
                textarea.focus();
            }
            if (typeof (textarea.selectionStart) != 'undefined') {
                //FireFox
                textarea.selectionStart = pos;
                textarea.selectionEnd = pos;
            }
        }
       
        // limpa todos os caracteres especiais do campo solicitado
        function filtraCampo(campo) {
            var s = "";
            var cp = "";
            vr = campo.value;
            tam = vr.length;
            for (i = 0; i < tam; i++) {
                if (vr.substring(i, i + 1) != "/"
                    && vr.substring(i, i + 1) != "-"
                    && vr.substring(i, i + 1) != "."
                    && vr.substring(i, i + 1) != "("
                    && vr.substring(i, i + 1) != ")"
                    && vr.substring(i, i + 1) != ":"
                    && vr.substring(i, i + 1) != ",") {
                    s = s + vr.substring(i, i + 1);
                }
            }
            return s;
            //return campo.value.replace("/", "").replace("-", "").replace(".", "").replace(",", "")
        }
        // limpa todos caracteres que não são números
        function filtraNumeros(campo) {
            var s = "";
            var cp = "";
            vr = campo;
            tam = vr.length;
            for (i = 0; i < tam; i++) {
                if (vr.substring(i, i + 1) == "0" ||
                    vr.substring(i, i + 1) == "1" ||
                    vr.substring(i, i + 1) == "2" ||
                    vr.substring(i, i + 1) == "3" ||
                    vr.substring(i, i + 1) == "4" ||
                    vr.substring(i, i + 1) == "5" ||
                    vr.substring(i, i + 1) == "6" ||
                    vr.substring(i, i + 1) == "7" ||
                    vr.substring(i, i + 1) == "8" ||
                    vr.substring(i, i + 1) == "9") {
                    s = s + vr.substring(i, i + 1);
                }
            }
            return s;
            //return campo.value.replace("/", "").replace("-", "").replace(".", "").replace(",", "")
        }
        
        
        function formataCPF(campo, evt) {
            //999.999.999-99
            var xPos = PosicaoCursor(campo);
            evt = getEvent(evt);
            var tecla = getKeyCode(evt);
            if (!teclaValida(tecla))
                return;
            vr = campo.value = filtraNumeros(filtraCampo(campo));
            tam = vr.length;
            if (tam >= 3 && tam < 6)
                campo.value = vr.substr(0, 3) + '.' + vr.substr(3);
            else if (tam >= 6 && tam < 9)
                campo.value = vr.substr(0, 3) + '.' + vr.substr(3, 3) + '.' + vr.substr(6);
            else if (tam >= 9)
                campo.value = vr.substr(0, 3) + '.' + vr.substr(3, 3) + '.' + vr.substr(6, 3) + '-' + vr.substr(9);
            MovimentaCursor(campo, xPos);
        }

        
        //Mascara para RG
        function formataRG(campo, evt) {

            var xPos = PosicaoCursor(campo);
            evt = getEvent(evt);
            var tecla = getKeyCode(evt);
            if (!teclaValida(tecla)) {
                return;
                vr = campo.value = filtraNumeros(filtraCampo(campo));
                tam = vr.length;
            }
            if (campo.value.length == 2) { campo.value += '.'; }
            if (campo.value.length == 6) { campo.value += '.'; }
            if (campo.value.length == 10) { campo.value += '-'; }
        }

        //Mascara para Telefone
        function formataTelefone(campo, evt) {
            //(00) 0000-0000
            var xPos = PosicaoCursor(campo);
            evt = getEvent(evt);
            var tecla = getKeyCode(evt);
            if (!teclaValida(tecla))
                return;
            vr = campo.value = filtraNumeros(filtraCampo(campo));
            tam = vr.length;
            if (tam == 1)
                campo.value = '(' + vr;
            else if (tam >= 2 && tam < 6)
                campo.value = '(' + vr.substr(0, 2) + ') ' + vr.substr(2);
            else if (tam >= 6)
                campo.value = '(' + vr.substr(0, 2) + ') ' + vr.substr(2, 4) + '-' + vr.substr(6);
            //(
            //    if(xPos == 1 || xPos == 3 || xPos == 5 || xPos == 9)
            //        xPos = xPos +1
            MovimentaCursor(campo, xPos);
        }
     
        //recupera tecla
        //evita criar mascara quando as teclas são pressionadas
        function teclaValida(tecla) {
            if (tecla == 8 //backspace
                //Esta evitando o post, quando são pressionadas estas teclas.
                //Foi comentado pois, se for utilizado o evento texchange, é necessario o post.
                || tecla == 9 //TAB
                || tecla == 27 //ESC
                || tecla == 16 //Shif TAB 
                || tecla == 45 //insert
                || tecla == 46 //delete
                || tecla == 35 //home
                || tecla == 36 //end
                || tecla == 37 //esquerda
                || tecla == 38 //cima
                || tecla == 39 //direita
                || tecla == 40)//baixo
                return false;
            else
                return true;
        }
        // recupera o evento do form
        function getEvent(evt) {
            if (!evt) evt = window.event; //IE
            return evt;
        }
        //Recupera o código da tecla que foi pressionado
        function getKeyCode(evt) {
            var code;
            if (typeof (evt.keyCode) == 'number')
                code = evt.keyCode;
            else if (typeof (evt.which) == 'number')
                code = evt.which;
            else if (typeof (evt.charCode) == 'number')
                code = evt.charCode;
            else
                return 0;
            return code;
        }

         //Mascara Para Celular:

         function mascaraTel(o, f) {

             v_obj = o;

             v_fun = f;

             setTimeout(execmascara, 1);

         }

         function execmascara() {

             v_obj.value = v_fun(v_obj.value)

         }

         function mtel(v) {

             v = v.replace(/\D/g, "");

             v = v.replace(/^(\d{2})(\d)/g, "($1) $2");

             v = v.replace(/(\d)(\d{4})$/, "$1-$2");

             return v;

         }

         function id(el) {

             return document.getElementById(el);

         }

         window.onload = function () {

             var $telefone = id('tel2FunTextBox');

             $telefone.onkeyup = function () {

                 mascaraTel(this, mtel);

             }

             $telefone.onblur = function () {

                 var v = this.value;

                 if (v.indexOf('(11)') !== -1 && v.length === 14) {

                     this.value = v.replace(/\((\d{2})\) (\d{4})-(\d{4})/g, '($1) 9$2-$3');

                 }

             }
         }
    </script>

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
             width: 685px;
             height: 378px;
         }

         .textbox
        {
            border-radius: 10px;
            border-radius: 10px;
            font-family: Arial;
            font-size: 11 pt;
            border: 1px solid Black;
            text-align:center;
        }
      
         .auto-style6 {
             width: 100%;
             height: 55px;
             margin-top: 8;
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
         .auto-style26 {
             width: 331px;
         }
         .auto-style31 {
             height: 40px;
         }
         .auto-style33 {
             height: 40px;
             width: 186px;
         }
         .auto-style34 {
             height: 40px;
             width: 147px;
         }
         .auto-style35 {
             height: 40px;
             width: 159px;
         }
         .auto-style36 {
             width: 160px;
         }
         .auto-style37 {
             width: 260px;
         }
         .auto-style38 {
             margin-left: 328px;
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
             
             <table class="auto-style15">
                 <tr>
                     <td class="auto-style35"><center>CRM Funcionário</center></td>
                     <td class="auto-style33">
                         <asp:TextBox ID="crmFunTextBox" runat="server" Width="58px" CssClass="textbox"></asp:TextBox>
                     </td>
                     <td class="auto-style34"><center>Telº Celular:</center></td>
                     <td class="auto-style31">
                         <asp:TextBox ID="tel2FunTextBox" runat="server" Width="139px" onKeyUp="formataTelefone(this,event);" MaxLength="15" CssClass="textbox"></asp:TextBox>
                     </td>
                 </tr>
                 <tr>
                     <td class="auto-style35"><center>Nome</center>
                     </td>
                     <td class="auto-style33"> 
                         <asp:TextBox ID="nomeFunTextBox" runat="server" Width="139px" CssClass="textbox"></asp:TextBox>
                     </td>
                     <td class="auto-style34"><center>E-mail</center></td>
                     <td class="auto-style31">
                         <asp:TextBox ID="emailFunTextBox" runat="server" Width="139px" OnTextChanged="emailFunTextBox_TextChanged" CssClass="textbox"></asp:TextBox>
                     </td>
                 </tr>
                 <tr>
                     <td class="auto-style35"><center>Endereço</center></td>
                     <td class="auto-style33">
                         <asp:TextBox ID="endFunTextBox" runat="server" Width="139px" CssClass="textbox"></asp:TextBox>
                     </td>
                     <td class="auto-style34"><center>CPF:</center> </td>
                     <td class="auto-style31">
                         <asp:TextBox ID="cpfFunTextBox" runat="server" Width="139px" onKeyUp="formataCPF(this,event);" MaxLength="14" CssClass="textbox"></asp:TextBox>
                     </td>
                 </tr>
                 <tr>
                     <td class="auto-style35"><center>UF</center></td>
                     <td class="auto-style33"> 
                         <asp:TextBox ID="ufFunTextBox" runat="server" Width="58px" CssClass="textbox"></asp:TextBox>
                     </td>
                     <td class="auto-style34"><center>RG:</center> </td>
                     <td class="auto-style31">
                         <asp:TextBox ID="rgFunTextBox" runat="server" Width="139px" onKeyUp="formataRG(this,event)" maxlength="12" CssClass="textbox"></asp:TextBox>
                     </td>
                 </tr>
                 <tr>
                     <td class="auto-style35"><center>Municipio</center></td>
                     <td class="auto-style33"> 
                         <asp:TextBox ID="muniFunTextBox" runat="server" Width="139px" CssClass="textbox"></asp:TextBox>
                     </td>
                     <td class="auto-style34"><center>Login:</center></td>
                     <td class="auto-style31">
                         <asp:TextBox ID="loginFunTextBox" runat="server" Width="139px" CssClass="textbox"></asp:TextBox>
                     </td>
                 </tr>
                 <tr>
                     <td class="auto-style35"><center>Telº Residencial</center></td>
                     <td class="auto-style33">
                         <asp:TextBox ID="tel1FunTextBox" runat="server" Width="139px" onKeyUp="formataTelefone(this,event);" MaxLength="14" CssClass="textbox"></asp:TextBox>
                     </td>
                     <td class="auto-style34"><center>Senha:</center></td>
                     <td class="auto-style31">
                         <asp:TextBox ID="senhaFunTextBox"  type="password" runat="server" Width="139px" CssClass="textbox"></asp:TextBox>
                     </td>
                 </tr>
             </table>
                 
             </br>
             <table class="auto-style6">
                 <tr>
                     <td class="auto-style26">
                     
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                              
                         <asp:ImageButton ID="ImageButton1" runat="server" Height="41px" ImageUrl="~/ESTILOS/save.png" OnClick="ImageButton1_Click" ToolTip="Salvar Funcionário" Width="45px" />
                                              
                     </td>
                     <td class="auto-style37">
                       
                         &nbsp;&nbsp;&nbsp;
                       
                         <asp:ImageButton ID="ImageButton2" runat="server" Height="41px" ImageUrl="~/ESTILOS/buscarButton.png" OnClick="ImageButton2_Click" ToolTip="Buscar Funcionário" Width="45px" />
                     </td>
                     <td class="auto-style36">
                       
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                       
                         <asp:ImageButton ID="ImageButton3" runat="server" Height="41px" ImageUrl="~/ESTILOS/cancel.png" OnClick="ImageButton3_Click" ToolTip="Limpar Campos" Width="45px" />
                     </td>
                 </tr>
             </table>
             <center>  
                 <br />
                 <asp:Label ID="confirmacaoLabel" runat="server"></asp:Label> </center>
             </div>
         </div>
         <p class="auto-style38">
             &nbsp;
             Clique
             <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/UI/ListarAllFuncionarios.aspx">Aqui</asp:HyperLink>
&nbsp;Para Consultar Todos os Funcionários</p>
    </form>
        
</body>
</html>
