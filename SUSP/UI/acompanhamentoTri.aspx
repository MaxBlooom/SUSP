<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="acompanhamentoTri.aspx.cs" Inherits="SUSP.UI.acompanhamentoTri" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Acompanhamento Triagem</title>

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
            width: 820px;
        }

    
        .auto-style5 {
            margin-right: 132px;
        }
        .auto-style10 {
            width: 258px;
        }

	
         .auto-style12 {
             border-style: solid;
             border-color: inherit;
             border-width: 2px;
             background-color: #F4F4F9;
             margin-left: 350px;
             margin-right: 325px;
             border-radius: 10px;
             width: 781px;
             height: 482px;
         }

	
        .auto-style13 {
            width: 903px;
            margin-left: 47;
        }
        .auto-style14 {
            width: 903px;
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
            <br />Olá
            <asp:Label ID="tbNomeFun" runat="server"></asp:Label>
            , digite o número da Triagem:
            <asp:TextBox ID="tbNumeroTri" runat="server" Width="61px" OnTextChanged="tbNumeroTri_TextChanged"></asp:TextBox>
            &nbsp;<asp:ImageButton ID="imgBtnNumeroTriagem" runat="server" Height="22px" ImageUrl="~/ESTILOS/buscarButton.png" Width="38px" OnClick="imgBtnNumeroTriagem_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" OnCheckedChanged="CheckBox1_CheckedChanged" Text="Não sabe?" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="Digite um CPF para consulta:"></asp:Label>
&nbsp;<asp:TextBox ID="tbCPF" runat="server" OnTextChanged="tbCPF_TextChanged"></asp:TextBox>
            <asp:ImageButton ID="ImageButton1" runat="server" Height="22px" ImageUrl="~/ESTILOS/buscarButton.png" Width="38px" OnClick="ImageButton1_Click1" />
            <br />
            <br />
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
                    <td class="auto-style14">
                        
                       
                        <asp:GridView ID="gvTriagem" runat="server" AutoGenerateColumns="false" ShowFooter="true" DataKeyNames="idTriagem"
                ShowHeaderWhenEmpty="true"
     
        BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" CssClass="auto-style13" Height="62px"  Width="730px" >
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
                
                <Columns>

                  
                    <asp:TemplateField HeaderText="Nº Triagem">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("idTriagem") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="CRM Fun">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("crm_FunT") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txttipo_Med" Text='<%# Eval("crm_FunT") %>' runat="server" AutoPostBack="False" CssClass="textbox" />
                        </EditItemTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="Nome Fun">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("nome_FunT") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Nome Paciente">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("nome_Pac") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="CRM Especialista">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("crm_Espm") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txttipo_Med" Text='<%# Eval("crm_Espm") %>' runat="server" AutoPostBack="False" CssClass="textbox" />
                        </EditItemTemplate>
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText="Prescrição Médica">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("prescicaoMedica_DiagFinal") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txttipo_Med" Text='<%# Eval("prescicaoMedica_DiagFinal") %>' runat="server" AutoPostBack="False" CssClass="textbox" />
                        </EditItemTemplate>
                    </asp:TemplateField>

                      <asp:TemplateField HeaderText="Data">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("data_Tri") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txttipo_Med" Text='<%# Eval("data_Tri") %>' runat="server" AutoPostBack="False" CssClass="textbox" />
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Observação">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("observacaoPaciente_Tri") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txttipo_Med" Text='<%# Eval("observacaoPaciente_Tri") %>' runat="server" AutoPostBack="False" CssClass="textbox" />
                        </EditItemTemplate>
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
                        
                       
                        
                    </td>
                </tr>
            </table> 
        </div></div>
        
        

    </form>
</body>
</body>
</html>
