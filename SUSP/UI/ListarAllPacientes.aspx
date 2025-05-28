<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListarAllPacientes.aspx.cs" Inherits="SUSP.UI.ListarAllPacientes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
     <title>Listar Todos os Pacientes</title>
<!--JavaScript para Colocar a Mascara na TextBox Data-->
        <script type="text/javascript">

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

            //Mascara para Data
            function mascara_data(campo, evt) {

                var xPos = PosicaoCursor(campo);
                evt = getEvent(evt);
                var tecla = getKeyCode(evt);
                if (!teclaValida(tecla)) {
                    return;
                    vr = campo.value = filtraNumeros(filtraCampo(campo));
                    tam = vr.length;
                }

                if (campo.value.length == 2) { campo.value += '/'; }
                if (campo.value.length == 5) { campo.value += '/'; }
            }

            //Mascara para Telefone
            function formataTelefone(campo, evt) {
                //(00) 0 0000-0000
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

                MovimentaCursor(campo, xPos);
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

         
         .textbox
        {
            border-radius: 10px;
            border-radius: 10px;
            font-family: Arial;
            font-size: 11 pt;
            border: 1px solid Black;
            text-align:center;
        }
                 
         .auto-style4 {
             margin-left: 344px;
         }
         
       

        
         .auto-style5 {
             text-align: center;
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
        </nav>

    </div>
    <!--Fim do menu-->

    <form id="form1" runat="server"><br />
         <div id="topodapagina"><asp:Image ID="Image2" class ="imageTopo" runat="server" ImageUrl="~/ESTILOS/consultarListagem.png" Height="71px" Width="658px" CssClass="auto-style4" /></div></br> </br>
        

        <!--Div Meio da Página-->
         <div >
           
             <div class="auto-style5">
           
             <asp:GridView ID="gvPacientes" runat="server" AutoGenerateColumns="false" DataKeyNames="idPaciente"
                ShowHeaderWhenEmpty="true"
     
        BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" CssClass="auto-style6" Height="64px" Width="1358px" style="margin-left: 51px" OnRowCancelingEdit="gvPacientes_RowCancelingEdit" OnRowDeleting="gvPacientes_RowDeleting" OnRowEditing="gvPacientes_RowEditing1" OnRowUpdating="gvPacientes_RowUpdating" >
                <%-- Theme Properties --%>
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />
                
                <%-- Colunas da grid--%>
                <Columns>

                  
                    <asp:TemplateField HeaderText=" ID ">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("idPaciente") %>' runat="server" />
                        </ItemTemplate>
                       
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText=" Nome ">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("nome_Pac") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtnome_Pac" Text='<%# Eval("nome_Pac") %>' runat="server" AutoPostBack="False" CssClass="textbox" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtnome_PacFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText=" Endereço ">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("enderecio_Pac") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtenderecio_Pac" Text='<%# Eval("enderecio_Pac") %>' runat="server" CssClass="textbox" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtenderecio_PacFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>
                  
                    <asp:TemplateField HeaderText=" Data de Nascimento ">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("dtNascimento") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtdtNascimento" Text='<%# Eval("dtNascimento") %>' runat="server" onKeyUp="mascara_data(this,event)" MaxLength="10" CssClass="textbox" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtdtNascimentoFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText=" Nº Telefone Residencial ">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("numeTelefone_Pac") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtnumeTelefone_Pac" Text='<%# Eval("numeTelefone_Pac") %>' runat="server" CssClass="textbox" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtnumeTelefone_PacFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText=" Nº Telefone Celular ">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("numTelefoneFamiliar_Pac") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtnumTelefoneFamiliar_Pac" Text='<%# Eval("numTelefoneFamiliar_Pac") %>'  runat="server" CssClass="textbox" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtnumTelefoneFamiliar_PacFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText=" Mãe ">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("nomeMae_Pac") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtnomeMae_Pac" Text='<%# Eval("nomeMae_Pac") %>' runat="server" CssClass="textbox" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtnomeMae_PacFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText=" UF ">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("uf_Pac") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtuf_Pac" Text='<%# Eval("uf_Pac") %>' runat="server" CssClass="textbox" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtuf_PacFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText=" Municipio ">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("municipio_Pac") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtmunicipio_Pac" Text='<%# Eval("municipio_Pac") %>' runat="server" CssClass="textbox" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtmunicipio_PacFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText=" Login ">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("login_paciente") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtlogin_paciente" Text='<%# Eval("login_paciente") %>' runat="server" CssClass="textbox" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtlogin_pacienteFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText=" Senha ">
                        <ItemTemplate>
                            <asp:Label Text="**********" runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtsenha_paciente" Text='<%# Eval("senha_paciente") %>' type="password" runat="server" CssClass="textbox" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtsenha_pacienteFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>
                   
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:ImageButton ImageUrl="~/ESTILOS/edit.png" runat="server" CommandName="Edit" ToolTip="Editar" Width="20px" Height="20px"/>
                            <asp:ImageButton ImageUrl="~/ESTILOS/delete.png" runat="server" CommandName="Delete" ToolTip="Excluir" Width="20px" Height="20px"/>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:ImageButton ImageUrl="~/ESTILOS/save.png" runat="server" CommandName="Update" ToolTip="Atualizar" Width="20px" Height="20px"/>
                            <asp:ImageButton ImageUrl="~/ESTILOS/cancel.png" runat="server" CommandName="Cancel" ToolTip="Cancelar" Width="20px" Height="20px"/>
                        </EditItemTemplate>
                                           </asp:TemplateField>
                </Columns>
            </asp:GridView>
                 <center>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;<br />
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="lblSuccessMessage" Text="" runat="server" ForeColor="Green" /></center>
            <br />
                 
             
             </div>
                 
             
             <br />
                 
             
             </div>
            
                 
             
    </form>
</body>
</html>
