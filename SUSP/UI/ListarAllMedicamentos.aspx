<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListarAllMedicamentos.aspx.cs" Inherits="SUSP.UI.ListarAllMedicamentos" %>

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
         .auto-style6 {
             margin-left: 347px;
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
             
             <center>

            </center>
&nbsp;<div class="auto-style5">

                 
 <asp:GridView ID="gvMedicamentos" runat="server" AutoGenerateColumns="false" ShowFooter="true" DataKeyNames="idMedicamentos"
                ShowHeaderWhenEmpty="true"
     
        BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" CssClass="auto-style6" Height="62px" OnSelectedIndexChanged="gvMedicamentos_SelectedIndexChanged2" Width="730px" OnRowCommand="gvMedicamentos_RowCommand" OnRowCancelingEdit="gvMedicamentos_RowCancelingEdit" OnRowDeleting="gvMedicamentos_RowDeleting" OnRowEditing="gvMedicamentos_RowEditing" OnRowUpdating="gvMedicamentos_RowUpdating">
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

                  
                    <asp:TemplateField HeaderText="Nome Medicamento">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("nome_Med") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtnome_Med" Text='<%# Eval("nome_Med") %>' runat="server" CssClass="textbox" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtnome_MedFooter" runat="server" CssClass="textbox" />
                        </FooterTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="Tipo">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("tipo_Med") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txttipo_Med" Text='<%# Eval("tipo_Med") %>' runat="server" AutoPostBack="False" CssClass="textbox" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txttipo_MedFooter" runat="server" CssClass="textbox" />
                        </FooterTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="Descrição">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("descricao_Med") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtdescricao_Med" Text='<%# Eval("descricao_Med") %>' runat="server" CssClass="textbox" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtdescricao_MedFooter" runat="server" CssClass="textbox" />
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
                        <FooterTemplate>
                            <asp:ImageButton ImageUrl="~/ESTILOS/addnew.png" runat="server" CommandName="AddNew" ToolTip="Adicionar" Width="20px" Height="20px"/>
                        </FooterTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <br />
<center>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="lblSuccessMessage" Text="" runat="server" ForeColor="Green" /></center>
            <br />
            
             </div>
            
                 
             
    </form>
</body>
</html>
