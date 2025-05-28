using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace SUSP.UI
{
    public partial class cadastros_CRUD_Especialista : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void telContatoTextBox0_TextChanged(object sender, EventArgs e)
        {

        }


        protected void inserirEspecialistaButton_Click(object sender, EventArgs e)
        {
            
        }

        protected void atulizarEspecialistaButton_Click(object sender, EventArgs e)
        {
        }

        protected void excluirEspecialistaButton_Click(object sender, EventArgs e)
        {
            //Instância da TransferOjject que traz as informações da minha classe
            AcessoDadosDAO.Especialista dados_especialista = new AcessoDadosDAO.Especialista();

            //Instância da classe DAO, aonde está o método de inserção
            DAO.ModeloDAO obj_Dao = new DAO.ModeloDAO();

            if ((idCrmEspecialistaTextBox.Text == "") || (idCrmEspecialistaTextBox.Text == "0"))
            {
                confirmacaoLabel.Text = "É Necessário Informar o CRM do Especialista Que Será Excluído(a)";
                confirmacaoLabel.ForeColor = System.Drawing.Color.Red;

            }
            else
            {
                //Recebendo o CRM correspondente ao Especialista que será excluido
                dados_especialista.crm_Espm = Convert.ToInt32(idCrmEspecialistaTextBox.Text);

                obj_Dao.DeletaEspecialista(dados_especialista);
                confirmacaoLabel.Text = "Exclusão realizada com sucesso";
                confirmacaoLabel.ForeColor = System.Drawing.Color.Blue;

                //Limpo as TextBox
                idCrmEspecialistaTextBox.Text = "";
                nomeEspecialistaTextBox.Text = "";
                enderecoEspecialistaTextBox.Text = "";
                ufEspecialistaTextBox.Text = "";
                municipioEspecialistaTextBox.Text = "";
                telContatoTextBox.Text = "";
                telSecundarioTextBox.Text = "";
                emailEspecialistaTextBox.Text = "";
                cpfEspecialistaTextBox.Text = "";
                rgEspecialistaTextBox.Text = "";
            }
        }

        protected void consultarEspecialistaButton_Click(object sender, EventArgs e)
        {
            
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            //Instância da TransferOjject que traz as informações da minha classe
            AcessoDadosDAO.Especialista dados_especialista = new AcessoDadosDAO.Especialista();

            //Instância da classe DAO, aonde está o método de inserção
            DAO.ModeloDAO obj_Dao = new DAO.ModeloDAO();

            //Valor que será informado para consulta
            dados_especialista.nome_Espm = nomeEspecialistaTextBox.Text;

            //Instância para trazer a conexão
            SqlConnection conex = new SqlConnection(obj_Dao.conexao_sql);

            //Criando o objeto "sql" do tipo SqlComand para receber um comando sql
            SqlCommand cmd = new SqlCommand("uspConsultarEspecialistaPorNome", conex);
            //está informando ao .NET os parametros que serão consultados acima
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            //está informando ao .NET os parametros que serão consultados acima
            cmd.Parameters.AddWithValue("@nome_Espm", nomeEspecialistaTextBox.Text);

            //abrindo minha conexão
            conex.Open();

            if ((idCrmEspecialistaTextBox.Text == "") || (nomeEspecialistaTextBox.Text == "") || (enderecoEspecialistaTextBox.Text == "") ||
               (ufEspecialistaTextBox.Text == "") || (municipioEspecialistaTextBox.Text == "") || (telContatoTextBox.Text == "") ||
               (telSecundarioTextBox.Text == "") || (emailEspecialistaTextBox.Text == "") || (cpfEspecialistaTextBox.Text == "") ||
               (rgEspecialistaTextBox.Text == ""))
            {
                confirmacaoLabel.Text = "É Necessário Informar o Nome do Especialista a ser Consultado";
                confirmacaoLabel.ForeColor = System.Drawing.Color.Red;

            }

            //instância do leitor 
            SqlDataReader leitor = cmd.ExecuteReader();

            if (nomeEspecialistaTextBox.Text == "")
            {
                confirmacaoLabel.Text = "Favor, Inserir o Nome do Paciente a Ser Consultado";
                confirmacaoLabel.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                //Se leitor lê 
                if (leitor.Read())
                {

                    //passo os valores para o objeto dados_paciente 
                    //que será retornado 
                    idCrmEspecialistaTextBox.Text = leitor["crm_Espm"].ToString();
                    nomeEspecialistaTextBox.Text = leitor["nome_Espm"].ToString();
                    enderecoEspecialistaTextBox.Text = leitor["endereco_Espm"].ToString();
                    ufEspecialistaTextBox.Text = leitor["uf_Espm"].ToString();
                    municipioEspecialistaTextBox.Text = leitor["municipio_Espm"].ToString();
                    telContatoTextBox.Text = leitor["telefone1_Espm"].ToString();
                    telSecundarioTextBox.Text = leitor["telefone2_Espm"].ToString();
                    emailEspecialistaTextBox.Text = leitor["email_Espm"].ToString();
                    cpfEspecialistaTextBox.Text = leitor["cpf_Espm"].ToString();
                    rgEspecialistaTextBox.Text = leitor["rg_Espm"].ToString();

                    confirmacaoLabel.Text = ("Especialista: " + leitor["nome_Espm"] + " Encontrado com Sucesso");
                    confirmacaoLabel.ForeColor = System.Drawing.Color.Green;


                }

                else
                {
                    confirmacaoLabel.Text = "Paciente Não Encontrado";
                    confirmacaoLabel.ForeColor = System.Drawing.Color.Red;

                    //Limpando as Textbox
                    idCrmEspecialistaTextBox.Text = "";
                    nomeEspecialistaTextBox.Text = "";
                    enderecoEspecialistaTextBox.Text = "";
                    ufEspecialistaTextBox.Text = "";
                    municipioEspecialistaTextBox.Text = "";
                    telContatoTextBox.Text = "";
                    telSecundarioTextBox.Text = "";
                    emailEspecialistaTextBox.Text = "";
                    cpfEspecialistaTextBox.Text = "";
                    rgEspecialistaTextBox.Text = "";
                    confirmacaoLabel.Text = "";
                }
            }

            conex.Close();
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            //Instância da TransferOjject que traz as informações da minha classe
            AcessoDadosDAO.Especialista dados_Especialista = new AcessoDadosDAO.Especialista();

            //Instância da classe DAO, aonde está o método de inserção
            DAO.ModeloDAO obj_Dao = new DAO.ModeloDAO();

            //Se qualquer campo estiver vazio, não realize a inserção
            if ((idCrmEspecialistaTextBox.Text == "") || (nomeEspecialistaTextBox.Text == "") || (enderecoEspecialistaTextBox.Text == "") ||
               (ufEspecialistaTextBox.Text == "") || (municipioEspecialistaTextBox.Text == "") || (telContatoTextBox.Text == "") ||
               (telSecundarioTextBox.Text == "") || (emailEspecialistaTextBox.Text == "") || (cpfEspecialistaTextBox.Text == "") ||
               (rgEspecialistaTextBox.Text == ""))
            {
                confirmacaoLabel.Text = "É Necessário Preencher Todos os Campos para Inserção";
                confirmacaoLabel.ForeColor = System.Drawing.Color.Red;

            }
            else//Senão, insere
            {
                //Inserindo os dados das Textbox nos atributos da minha classe
                dados_Especialista.crm_Espm = Convert.ToInt32(idCrmEspecialistaTextBox.Text);
                dados_Especialista.nome_Espm = (nomeEspecialistaTextBox.Text);
                dados_Especialista.endereco_Espm = (enderecoEspecialistaTextBox.Text);
                dados_Especialista.uf_Espm = (ufEspecialistaTextBox.Text);
                dados_Especialista.municipio_Espm = (municipioEspecialistaTextBox.Text);
                dados_Especialista.telefone1_Espm = (telContatoTextBox.Text);
                dados_Especialista.telefone2_Espm = (telSecundarioTextBox.Text);
                dados_Especialista.email_Espm = (emailEspecialistaTextBox.Text);
                dados_Especialista.cpf_Espm = (cpfEspecialistaTextBox.Text);
                dados_Especialista.rg_Espm = (rgEspecialistaTextBox.Text);

                //Instancio um método da classe DAO
                obj_Dao.inserirEspecialista(dados_Especialista);
                confirmacaoLabel.Text = "Inserção realizada com sucesso";
                confirmacaoLabel.ForeColor = System.Drawing.Color.Green;

                //Limpo as TextBox
                idCrmEspecialistaTextBox.Text = "";
                nomeEspecialistaTextBox.Text = "";
                enderecoEspecialistaTextBox.Text = "";
                ufEspecialistaTextBox.Text = "";
                municipioEspecialistaTextBox.Text = "";
                telContatoTextBox.Text = "";
                telSecundarioTextBox.Text = "";
                emailEspecialistaTextBox.Text = "";
                cpfEspecialistaTextBox.Text = "";
                rgEspecialistaTextBox.Text = "";
                confirmacaoLabel.Text = "";
            }
        }

        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {
            idCrmEspecialistaTextBox.Text = "";
            nomeEspecialistaTextBox.Text = "";
            enderecoEspecialistaTextBox.Text = "";
            ufEspecialistaTextBox.Text = "";
            municipioEspecialistaTextBox.Text = "";
            telContatoTextBox.Text = "";
            telSecundarioTextBox.Text = "";
            emailEspecialistaTextBox.Text = "";
            cpfEspecialistaTextBox.Text = "";
            rgEspecialistaTextBox.Text = "";
            confirmacaoLabel.Text = "";
        }
    }
}