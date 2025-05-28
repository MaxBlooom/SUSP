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
    public partial class cadastros_CRUD_Funcionarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void inserirFunButton_Click(object sender, EventArgs e)
        {
           
        }

        protected void emailFunTextBox_TextChanged(object sender, EventArgs e)
        {

        }

        protected void atualizarFunButton_Click(object sender, EventArgs e)
        {
            

        }

        protected void excluirFunButton_Click(object sender, EventArgs e)
        {
            
        }

        protected void consultarFunButton_Click(object sender, EventArgs e)
        {
            
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            //Instância da TransferOjject que traz as informações da minha classe
            AcessoDadosDAO.FuncionarioTriagem dados_funcionario = new AcessoDadosDAO.FuncionarioTriagem();

            //Instância da classe DAO, aonde está o método de inserção
            DAO.ModeloDAO obj_Dao = new DAO.ModeloDAO();

            //Se qualquer campo estiver vazio, não realize a inserção
            if ((crmFunTextBox.Text == "") || (nomeFunTextBox.Text == "") || (endFunTextBox.Text == "") ||
               (ufFunTextBox.Text == "") || (muniFunTextBox.Text == "") || (tel1FunTextBox.Text == "") ||
               (tel2FunTextBox.Text == "") || (emailFunTextBox.Text == "") || (cpfFunTextBox.Text == "") ||
               (rgFunTextBox.Text == "") || (loginFunTextBox.Text == "") || (senhaFunTextBox.Text == ""))
            {
                confirmacaoLabel.Text = "É Necessário Preencher Todos os Campos para Inserção";
                confirmacaoLabel.ForeColor = System.Drawing.Color.Red;

            }
            else//Senão, insere
            {
                //Inserindo os dados das Textbox nos atributos da minha classe
                dados_funcionario.crm_FunT = Convert.ToInt32((crmFunTextBox.Text));
                dados_funcionario.nome_FunT = (nomeFunTextBox.Text);
                dados_funcionario.endereco_FunT = (endFunTextBox.Text);
                dados_funcionario.uf_FunT = (ufFunTextBox.Text);
                dados_funcionario.municipio_FunT = (muniFunTextBox.Text);
                dados_funcionario.telefone1_FunT = (tel1FunTextBox.Text);
                dados_funcionario.telefone2_FunT = (tel2FunTextBox.Text);
                dados_funcionario.email_FunT = (emailFunTextBox.Text);
                dados_funcionario.cpf_FunT = (cpfFunTextBox.Text);
                dados_funcionario.rg_FunT = (rgFunTextBox.Text);
                dados_funcionario.login_funcionario = (loginFunTextBox.Text);
                dados_funcionario.senha_funcionario = (senhaFunTextBox.Text);

                //Instancio um método da classe DAO
                obj_Dao.inserirFuncionario(dados_funcionario);
                confirmacaoLabel.Text = "Inserção realizada com sucesso";
                confirmacaoLabel.ForeColor = System.Drawing.Color.Green;

                //Limpo as TextBox
                crmFunTextBox.Text = "";
                nomeFunTextBox.Text = "";
                endFunTextBox.Text = "";
                ufFunTextBox.Text = "";
                muniFunTextBox.Text = "";
                tel1FunTextBox.Text = "";
                tel2FunTextBox.Text = "";
                emailFunTextBox.Text = "";
                cpfFunTextBox.Text = "";
                rgFunTextBox.Text = "";
                loginFunTextBox.Text = "";
                senhaFunTextBox.Text = "";
                
            }

        }

        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {
            crmFunTextBox.Text = "";
            nomeFunTextBox.Text = "";
            endFunTextBox.Text = "";
            ufFunTextBox.Text = "";
            muniFunTextBox.Text = "";
            tel1FunTextBox.Text = "";
            tel2FunTextBox.Text = "";
            emailFunTextBox.Text = "";
            cpfFunTextBox.Text = "";
            rgFunTextBox.Text = "";
            loginFunTextBox.Text = "";
            senhaFunTextBox.Text = "";
            confirmacaoLabel.Text = "";
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            //Instância da TransferObject que traz as informações da minha classe
            AcessoDadosDAO.FuncionarioTriagem dados_funcionario = new AcessoDadosDAO.FuncionarioTriagem();

            //Instância da classe DAO, aonde está o método de inserção
            DAO.ModeloDAO obj_Dao = new DAO.ModeloDAO();

            //Valor que será informado para consulta
            dados_funcionario.nome_FunT = nomeFunTextBox.Text;

            //Instância para trazer a conexão
            SqlConnection conex = new SqlConnection(obj_Dao.conexao_sql);

            //Criando o objeto "sql" do tipo SqlComand para receber um comando sql
            SqlCommand cmd = new SqlCommand("uspConsultarFuncionarioPorNome", conex);
            //está informando ao .NET os parametros que serão consultados acima
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            //está informando ao .NET os parametros que serão consultados acima
            cmd.Parameters.AddWithValue("@nome_FunT", nomeFunTextBox.Text);

            //abrindo minha conexão
            conex.Open();

            if ((crmFunTextBox.Text == "") || (nomeFunTextBox.Text == "") || (endFunTextBox.Text == "") ||
               (ufFunTextBox.Text == "") || (muniFunTextBox.Text == "") || (tel1FunTextBox.Text == "") ||
               (tel2FunTextBox.Text == "") || (emailFunTextBox.Text == "") || (cpfFunTextBox.Text == "") ||
               (rgFunTextBox.Text == "") || (loginFunTextBox.Text == "") || (senhaFunTextBox.Text == ""))
            {
                confirmacaoLabel.Text = "É Necessário Informar o Nome do Funcionário a Ser Consultado";
                confirmacaoLabel.ForeColor = System.Drawing.Color.Red;

            }

            //instância do leitor 
            SqlDataReader leitor = cmd.ExecuteReader();

            if (nomeFunTextBox.Text == "")
            {
                confirmacaoLabel.Text = "Favor, Inserir o Nome do Funcionário a Ser Consultado";
                confirmacaoLabel.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                //Se leitor lê 
                if (leitor.Read())
                {

                    //passo os valores para o objeto dados_paciente 
                    //que será retornado 
                    crmFunTextBox.Text = leitor["crm_FunT"].ToString();
                    nomeFunTextBox.Text = leitor["nome_FunT"].ToString();
                    endFunTextBox.Text = leitor["endereco_FunT"].ToString();
                    ufFunTextBox.Text = leitor["uf_FunT"].ToString();
                    muniFunTextBox.Text = leitor["municipio_FunT"].ToString();
                    tel1FunTextBox.Text = leitor["telefone1_FunT"].ToString();
                    tel2FunTextBox.Text = leitor["telefone2_FunT"].ToString();
                    emailFunTextBox.Text = leitor["email_FunT"].ToString();
                    cpfFunTextBox.Text = leitor["cpf_FunT"].ToString();
                    rgFunTextBox.Text = leitor["rg_FunT"].ToString();
                    loginFunTextBox.Text = leitor["login_funcionario"].ToString();
                    senhaFunTextBox.Text = leitor["senha_funcionario"].ToString();

                    confirmacaoLabel.Text = ("Funcionário: " + leitor["nome_FunT"] + " Encontrado com Sucesso");
                    confirmacaoLabel.ForeColor = System.Drawing.Color.Green;


                }

                else
                {
                    confirmacaoLabel.Text = "Paciente Não Encontrado";
                    confirmacaoLabel.ForeColor = System.Drawing.Color.Red;
                    crmFunTextBox.Text = "";
                    nomeFunTextBox.Text = "";
                    endFunTextBox.Text = "";
                    ufFunTextBox.Text = "";
                    muniFunTextBox.Text = "";
                    tel1FunTextBox.Text = "";
                    tel2FunTextBox.Text = "";
                    emailFunTextBox.Text = "";
                    cpfFunTextBox.Text = "";
                    rgFunTextBox.Text = "";
                    loginFunTextBox.Text = "";
                    senhaFunTextBox.Text = "";
                    confirmacaoLabel.Text = "";
                }
            }

            conex.Close();
        }
    }
}