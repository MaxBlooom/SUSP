<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListarAllFuncionarios.aspx.cs" Inherits="SUSP.UI.ListarAllFuncionarios" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Listar Todos os Funcionários</title>
    
    <style>
    check{
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
         } * {
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
                      
         .auto-style11 {
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
         <div>
             <div class="auto-style11">
             <asp:GridView ID="gvFuncionario" runat="server" AutoGenerateColumns="false" DataKeyNames="crm_FunT"
                ShowHeaderWhenEmpty="true"
     
        BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" CssClass="auto-style6" Height="64px" Width="1358px" style="margin-left: 51px" OnRowCancelingEdit="gvFuncionario_RowCancelingEdit" OnRowDeleting="gvFuncionario_RowDeleting" OnRowEditing="gvFuncionario_RowEditing" OnRowUpdating="gvFuncionario_RowUpdating" >
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

                  
                    <asp:TemplateField HeaderText=" CRM ">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("crm_FunT") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText=" Nome Funcionário ">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("nome_FunT") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtnome_FunT" Text='<%# Eval("nome_FunT") %>' runat="server" AutoPostBack="False" CssClass="textbox" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtnome_FunTFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText=" Endereço ">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("endereco_FunT") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtendereco_FunT" Text='<%# Eval("endereco_FunT") %>' runat="server" CssClass="textbox" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtendereco_FunTFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>
                  
                    <asp:TemplateField HeaderText=" UF ">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("uf_FunT") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtuf_FunT" Text='<%# Eval("uf_FunT") %>' runat="server" CssClass="textbox" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtuf_FunTFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText=" Municipio ">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("municipio_FunT") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtmunicipio_FunT" Text='<%# Eval("municipio_FunT") %>' runat="server" CssClass="textbox" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtmunicipio_FunTFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText=" Nº Telefone Residencial ">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("telefone1_FunT") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txttelefone1_FunT" Text='<%# Eval("telefone1_FunT") %>' runat="server" CssClass="textbox" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txttelefone1_FunTFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText=" Nº Telefone Celular ">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("telefone2_FunT") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txttelefone2_FunT" Text='<%# Eval("telefone2_FunT") %>' runat="server" CssClass="textbox" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txttelefone2_FunTFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText=" E-mail ">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("email_FunT") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtemail_FunT" Text='<%# Eval("email_FunT") %>' runat="server" CssClass="textbox" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtemail_FunTFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText=" CPF ">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("cpf_FunT") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtcpf_FunT" Text='<%# Eval("cpf_FunT") %>' runat="server" CssClass="textbox" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtcpf_FunTFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText=" RG ">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("rg_FunT") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtrg_FunT" Text='<%# Eval("rg_FunT") %>' runat="server" CssClass="textbox" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtrg_FunTFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText=" Login ">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("login_funcionario") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtlogin_funcionario" Text='<%# Eval("login_funcionario") %>' runat="server" CssClass="textbox" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtlogin_funcionarioFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText=" Senha ">
                        <ItemTemplate>
                            <asp:Label Text="**********" runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtsenha_funcionario" Text='<%# Eval("senha_funcionario") %>' type="password" runat="server"  CssClass="textbox" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtsenha_funcionarioFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    
                    <%-- botões de alterar e excluir --%>
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
                 </div>
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
            
                 
             
    </form>
</body>
</html>
