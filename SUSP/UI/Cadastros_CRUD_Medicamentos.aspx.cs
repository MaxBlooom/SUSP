using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SUSP.UI
{
    public partial class Cadastros_CRUD_Medicamentos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            //Instância da TransferOjject que traz as informações da minha classe
            AcessoDadosDAO.Medicamentos dados_medicamentos = new AcessoDadosDAO.Medicamentos();

            //Instância da classe DAO, aonde está o método de inserção
            DAO.ModeloDAO obj_Dao = new DAO.ModeloDAO();

            //Se qualquer campo estiver vazio, não realize a inserção
            if ((NomeMedTextBox.Text == "") || (TipoMedTextBox.Text == "") || (DescriMedTextBox.Text == ""))
            {
                confirmacaoLabel.Text = "É Necessário Preencher Todos os Campos para Inserção";
                confirmacaoLabel.ForeColor = System.Drawing.Color.Red;

            }
            else//Senão, insere
            {
                //Inserindo os dados das Textbox nos atributos da minha classe
                dados_medicamentos.nome_Med = (NomeMedTextBox.Text);
                dados_medicamentos.tipo_Med = (TipoMedTextBox.Text);
                dados_medicamentos.descricao_Med = (DescriMedTextBox.Text);


                //Instancio um método da classe DAO
                obj_Dao.inserirMedicamento(dados_medicamentos);
                confirmacaoLabel.Text = ("Medicamento: " + dados_medicamentos.nome_Med + " Inserido Com sucesso");
                confirmacaoLabel.ForeColor = System.Drawing.Color.Green;

                //Limpo as TextBox
                NomeMedTextBox.Text = "";
                TipoMedTextBox.Text = "";
                DescriMedTextBox.Text = "";
                confirmacaoLabel.Text = "";

            }
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            NomeMedTextBox.Text = "";
            TipoMedTextBox.Text = "";
            DescriMedTextBox.Text = "";
            confirmacaoLabel.Text = "";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
    }
}