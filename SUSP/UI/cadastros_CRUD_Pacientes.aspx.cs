using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AcessoDadosDAO;
using System.Data;
using System.Data.SqlClient;

namespace SUSP.UI
{
    public partial class cadastros_CRUD : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        //Inserir Paciente
        protected void inserirPacienteButton_Click(object sender, EventArgs e)
        {
            //Instância da TransferOjject que traz as informações da minha classe
            AcessoDadosDAO.Paciente dados_paciente = new AcessoDadosDAO.Paciente();

            //Instância da classe DAO, aonde está o método de inserção
            DAO.ModeloDAO obj_Dao = new DAO.ModeloDAO();

            //Se qualquer campo estiver vazio, não realize a inserção
            if ((nomePacienteTextBox.Text == "") || (enderecoPacienteTextBox.Text == "") || (datNascimentoPacienteTextBox.Text == "") ||
               (telPessoalPacienteTextBox.Text == "") || (telFamiliarPacienteTextBox.Text == "") || (nomeMaePacienteTextBox.Text == "") ||
               (ufPacienteTextBox.Text == "") || (municipioPacienteTextBox.Text == "") || (loginPacienteTextBox.Text == "") ||
               (senhaPacienteTextBox.Text == ""))
            {
                confirmacaoLabel.Text = "É Necessário Preencher Todos os Campos para Inserção";
                confirmacaoLabel.ForeColor = System.Drawing.Color.Red;

            }
            else//Senão, insere
            {
                //Inserindo os dados das Textbox nos atributos da minha classe
                dados_paciente.nome_Pac = (nomePacienteTextBox.Text);
                dados_paciente.enderecio_Pac = (enderecoPacienteTextBox.Text);
                dados_paciente.dtNascimento = Convert.ToDateTime(datNascimentoPacienteTextBox.Text);
                dados_paciente.numeTelefone_Pac = (telPessoalPacienteTextBox.Text);
                dados_paciente.numTelefoneFamiliar_Pac = (telFamiliarPacienteTextBox.Text);
                dados_paciente.nomeMae_Pac = (nomeMaePacienteTextBox.Text);
                dados_paciente.uf_Pac = (ufPacienteTextBox.Text);
                dados_paciente.municipio_Pac = (municipioPacienteTextBox.Text);
                dados_paciente.login_paciente = (loginPacienteTextBox.Text);
                dados_paciente.senha_paciente = (senhaPacienteTextBox.Text);

                //Instancio um método da classe DAO
                obj_Dao.inserirPaciente(dados_paciente);
                confirmacaoLabel.Text = "Inserção realizada com sucesso";
                confirmacaoLabel.ForeColor = System.Drawing.Color.Green;

                //Limpo as TextBox
                nomePacienteTextBox.Text = "";
                enderecoPacienteTextBox.Text = "";
                datNascimentoPacienteTextBox.Text = "";
                telPessoalPacienteTextBox.Text = "";
                telFamiliarPacienteTextBox.Text = "";
                nomeMaePacienteTextBox.Text = "";
                ufPacienteTextBox.Text = "";
                municipioPacienteTextBox.Text = "";
                loginPacienteTextBox.Text = "";
                senhaPacienteTextBox.Text = "";
            }

        }

        //Botão que realiza a alteração do Paciente
        protected void atualizarPacienteButton_Click(object sender, EventArgs e)
        {
           
        }

        //Botão de Exclusão do Paciente
        protected void excluirPacienteButton_Click(object sender, EventArgs e)
        {
        }

        //Checkbox para habilitar exclusão por ID
        protected void consultaCheckBox_CheckedChanged(object sender, EventArgs e)
        {
            
        }

        protected void consultarPacienteButton_Click(object sender, EventArgs e)
        {

            //Instância da TransferOjject que traz as informações da minha classe
            AcessoDadosDAO.Paciente dados_paciente = new AcessoDadosDAO.Paciente();

            //Instância da classe DAO, aonde está o método de inserção
            DAO.ModeloDAO obj_Dao = new DAO.ModeloDAO();

            //Valor que será informado para consulta
            dados_paciente.nome_Pac = nomePacienteTextBox.Text;

            //Instância para trazer a conexão
            SqlConnection conex = new SqlConnection(obj_Dao.conexao_sql);

            //Criando o objeto "sql" do tipo SqlComand para receber um comando sql
            SqlCommand cmd = new SqlCommand("uspConsultarPacientePorNome", conex);
            //está informando ao .NET os parametros que serão consultados acima
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            //está informando ao .NET os parametros que serão consultados acima
            cmd.Parameters.AddWithValue("@nome_Pac", nomePacienteTextBox.Text);

            //abrindo minha conexão
            conex.Open();

            if ((nomePacienteTextBox.Text == "") || (enderecoPacienteTextBox.Text == "") || (datNascimentoPacienteTextBox.Text == "") ||
               (telPessoalPacienteTextBox.Text == "") || (telFamiliarPacienteTextBox.Text == "") || (nomeMaePacienteTextBox.Text == "") ||
               (ufPacienteTextBox.Text == "") || (municipioPacienteTextBox.Text == "") || (loginPacienteTextBox.Text == "") ||
               (senhaPacienteTextBox.Text == ""))
            {
                confirmacaoLabel.Text = "É Necessário Informar o nome do paciente a ser consultado";
                confirmacaoLabel.ForeColor = System.Drawing.Color.Red;

            }

            //instância do leitor 
            SqlDataReader leitor = cmd.ExecuteReader();

            if (nomePacienteTextBox.Text == "")
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
                    nomePacienteTextBox.Text = leitor["nome_Pac"].ToString();
                    enderecoPacienteTextBox.Text = leitor["enderecio_Pac"].ToString();
                    datNascimentoPacienteTextBox.Text = leitor["dtNascimento"].ToString();
                    telPessoalPacienteTextBox.Text = leitor["numeTelefone_Pac"].ToString();
                    telFamiliarPacienteTextBox.Text = leitor["numTelefoneFamiliar_Pac"].ToString();
                    nomeMaePacienteTextBox.Text = leitor["nomeMae_Pac"].ToString();
                    ufPacienteTextBox.Text = leitor["uf_Pac"].ToString();
                    municipioPacienteTextBox.Text = leitor["municipio_Pac"].ToString();
                    loginPacienteTextBox.Text = leitor["login_paciente"].ToString();
                    senhaPacienteTextBox.Text = leitor["senha_paciente"].ToString();

                    confirmacaoLabel.Text = ("Paciente: " + leitor["nome_Pac"] + " Encontrado com Sucesso");
                    confirmacaoLabel.ForeColor = System.Drawing.Color.Green;

               
                }

                else
                {
                    confirmacaoLabel.Text = "Paciente Não Encontrado";
                    confirmacaoLabel.ForeColor = System.Drawing.Color.Red;
                    nomePacienteTextBox.Text = "";
                    enderecoPacienteTextBox.Text = "";
                    datNascimentoPacienteTextBox.Text = "";
                    telPessoalPacienteTextBox.Text = "";
                    telFamiliarPacienteTextBox.Text = "";
                    nomeMaePacienteTextBox.Text = "";
                    ufPacienteTextBox.Text = "";
                    municipioPacienteTextBox.Text = "";
                    loginPacienteTextBox.Text = "";
                    senhaPacienteTextBox.Text = "";
                }
            }

            conex.Close();

        }

        protected void InserirImageButton_Click(object sender, ImageClickEventArgs e)
        {
            //Instância da TransferOjject que traz as informações da minha classe
            AcessoDadosDAO.Paciente dados_paciente = new AcessoDadosDAO.Paciente();

            //Instância da classe DAO, aonde está o método de inserção
            DAO.ModeloDAO obj_Dao = new DAO.ModeloDAO();

            //Se qualquer campo estiver vazio, não realize a inserção
            if ((nomePacienteTextBox.Text == "") || (enderecoPacienteTextBox.Text == "") || (datNascimentoPacienteTextBox.Text == "") ||
               (telPessoalPacienteTextBox.Text == "") || (telFamiliarPacienteTextBox.Text == "") || (nomeMaePacienteTextBox.Text == "") ||
               (ufPacienteTextBox.Text == "") || (municipioPacienteTextBox.Text == "") || (loginPacienteTextBox.Text == "") ||
               (senhaPacienteTextBox.Text == ""))
            {
                confirmacaoLabel.Text = "É Necessário Preencher Todos os Campos para Inserção";
                confirmacaoLabel.ForeColor = System.Drawing.Color.Red;

            }
            else//Senão, insere
            {
                //Inserindo os dados das Textbox nos atributos da minha classe
                dados_paciente.nome_Pac = (nomePacienteTextBox.Text);
                dados_paciente.enderecio_Pac = (enderecoPacienteTextBox.Text);
                dados_paciente.dtNascimento = Convert.ToDateTime(datNascimentoPacienteTextBox.Text);
                dados_paciente.numeTelefone_Pac = (telPessoalPacienteTextBox.Text);
                dados_paciente.numTelefoneFamiliar_Pac = (telFamiliarPacienteTextBox.Text);
                dados_paciente.nomeMae_Pac = (nomeMaePacienteTextBox.Text);
                dados_paciente.uf_Pac = (ufPacienteTextBox.Text);
                dados_paciente.municipio_Pac = (municipioPacienteTextBox.Text);
                dados_paciente.login_paciente = (loginPacienteTextBox.Text);
                dados_paciente.senha_paciente = (senhaPacienteTextBox.Text);

                //Instancio um método da classe DAO
                obj_Dao.inserirPaciente(dados_paciente);
                confirmacaoLabel.Text = "Inserção realizada com sucesso";
                confirmacaoLabel.ForeColor = System.Drawing.Color.Green;

                //Limpo as TextBox
                nomePacienteTextBox.Text = "";
                enderecoPacienteTextBox.Text = "";
                datNascimentoPacienteTextBox.Text = "";
                telPessoalPacienteTextBox.Text = "";
                telFamiliarPacienteTextBox.Text = "";
                nomeMaePacienteTextBox.Text = "";
                ufPacienteTextBox.Text = "";
                municipioPacienteTextBox.Text = "";
                loginPacienteTextBox.Text = "";
                senhaPacienteTextBox.Text = "";
            }

        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
           
            
        }

        protected void excluirImageButton_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void ImageButton1_Click1(object sender, ImageClickEventArgs e)
        {

            //Instância da TransferOjject que traz as informações da minha classe
            AcessoDadosDAO.Paciente dados_paciente = new AcessoDadosDAO.Paciente();

            //Instância da classe DAO, aonde está o método de inserção
            DAO.ModeloDAO obj_Dao = new DAO.ModeloDAO();

            //Valor que será informado para consulta
            dados_paciente.nome_Pac = nomePacienteTextBox.Text;

            //Instância para trazer a conexão
            SqlConnection conex = new SqlConnection(obj_Dao.conexao_sql);

            //Criando o objeto "sql" do tipo SqlComand para receber um comando sql
            SqlCommand cmd = new SqlCommand("uspConsultarPacientePorNome", conex);
            //está informando ao .NET os parametros que serão consultados acima
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            //está informando ao .NET os parametros que serão consultados acima
            cmd.Parameters.AddWithValue("@nome_Pac", nomePacienteTextBox.Text);

            //abrindo minha conexão
            conex.Open();

            if ((nomePacienteTextBox.Text == "") || (enderecoPacienteTextBox.Text == "") || (datNascimentoPacienteTextBox.Text == "") ||
               (telPessoalPacienteTextBox.Text == "") || (telFamiliarPacienteTextBox.Text == "") || (nomeMaePacienteTextBox.Text == "") ||
               (ufPacienteTextBox.Text == "") || (municipioPacienteTextBox.Text == "") || (loginPacienteTextBox.Text == "") ||
               (senhaPacienteTextBox.Text == ""))
            {
                confirmacaoLabel.Text = "É Necessário Informar o nome do paciente a ser consultado";
                confirmacaoLabel.ForeColor = System.Drawing.Color.Red;

            }

            //instância do leitor 
            SqlDataReader leitor = cmd.ExecuteReader();

            if (nomePacienteTextBox.Text == "")
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
                   // idPacienteTextBox.Text = leitor["idPaciente"].ToString();
                    nomePacienteTextBox.Text = leitor["nome_Pac"].ToString();
                    enderecoPacienteTextBox.Text = leitor["enderecio_Pac"].ToString();
                    datNascimentoPacienteTextBox.Text = leitor["dtNascimento"].ToString();
                    telPessoalPacienteTextBox.Text = leitor["numeTelefone_Pac"].ToString();
                    telFamiliarPacienteTextBox.Text = leitor["numTelefoneFamiliar_Pac"].ToString();
                    nomeMaePacienteTextBox.Text = leitor["nomeMae_Pac"].ToString();
                    ufPacienteTextBox.Text = leitor["uf_Pac"].ToString();
                    municipioPacienteTextBox.Text = leitor["municipio_Pac"].ToString();
                    loginPacienteTextBox.Text = leitor["login_paciente"].ToString();
                    senhaPacienteTextBox.Text = leitor["senha_paciente"].ToString();

                    confirmacaoLabel.Text = ("Paciente: " + leitor["nome_Pac"] + " Encontrado com Sucesso");
                    confirmacaoLabel.ForeColor = System.Drawing.Color.Green;


                }

                else
                {
                    confirmacaoLabel.Text = "Paciente Não Encontrado";
                    confirmacaoLabel.ForeColor = System.Drawing.Color.Red;
                    nomePacienteTextBox.Text = "";
                    enderecoPacienteTextBox.Text = "";
                    datNascimentoPacienteTextBox.Text = "";
                    telPessoalPacienteTextBox.Text = "";
                    telFamiliarPacienteTextBox.Text = "";
                    nomeMaePacienteTextBox.Text = "";
                    ufPacienteTextBox.Text = "";
                    municipioPacienteTextBox.Text = "";
                    loginPacienteTextBox.Text = "";
                    senhaPacienteTextBox.Text = "";
                }
            }

            conex.Close();

        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            nomePacienteTextBox.Text = "";
            enderecoPacienteTextBox.Text = "";
            datNascimentoPacienteTextBox.Text = "";
            telPessoalPacienteTextBox.Text = "";
            telFamiliarPacienteTextBox.Text = "";
            nomeMaePacienteTextBox.Text = "";
            ufPacienteTextBox.Text = "";
            municipioPacienteTextBox.Text = "";
            loginPacienteTextBox.Text = "";
            senhaPacienteTextBox.Text = "";
            confirmacaoLabel.Text = "";
        }

        protected void nomePacienteTextBox_TextChanged(object sender, EventArgs e)
        {

        }

        protected void nomeMaePacienteTextBox_TextChanged(object sender, EventArgs e)
        {

        }
    }
}