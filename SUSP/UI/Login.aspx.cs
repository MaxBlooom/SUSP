using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


namespace SUSP
{
    public partial class testeLog : System.Web.UI.Page
    {
        DAO.ModeloDAO acessoSqlServer = new DAO.ModeloDAO();
        SqlCommand cmd = new SqlCommand();
        SqlConnection con = new SqlConnection();
        SqlDataAdapter ada = new SqlDataAdapter();
        DataSet ds = new DataSet();
        private bool Logado = false;

     
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        

        protected void pacienteButton_Click(object sender, EventArgs e)
        {
            

        }

        protected void pacienteButton_Click1(object sender, EventArgs e)
        {
           

        }



        protected void funcionarioLoginButton_Click(object sender, EventArgs e)
        {

        }

        protected void funcionarioImageButton_Click(object sender, ImageClickEventArgs e)
        {
            SqlConnection conex = new SqlConnection(acessoSqlServer.conexao_sql);

            try
            {
                SqlCommand cmd = new SqlCommand("uspValidarLoginFuncionario", conex);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@login_funcionario", FuncionarioTextbox.Text);
                cmd.Parameters.AddWithValue("@senha_funcionario", senhaFunTextbox2.Text);

                SqlDataAdapter sdata = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sdata.Fill(dt);

                conex.Open();
                int i = cmd.ExecuteNonQuery();
                conex.Close();

                if (dt.Rows.Count > 0)
                {
                    
                    Session["crm_FunT"] = FuncionarioTextbox.Text;
                    Response.Redirect("~/UI/homeFuncionario.aspx");
                    Session.RemoveAll();

                }
                else
                {
                    pacienteLabel.Text = "Nome de Usuário (e) ou Senha incorreto";
                    pacienteLabel.ForeColor = System.Drawing.Color.Red;
                    senhaFunTextbox2.Text = "";
                }
            }
            catch (SqlException error)
            {
                throw new Exception(error.Message);
            }
        }

        protected void pacienteImageButton_Click(object sender, ImageClickEventArgs e)
        {
            SqlConnection conex = new SqlConnection(acessoSqlServer.conexao_sql);

            try
            {
                SqlCommand cmd = new SqlCommand("uspValidarLoginPaciente", conex);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@login_paciente", loginPacienteTextBox.Text);
                cmd.Parameters.AddWithValue("@senha_paciente", senhaPacienteTextBox.Text);
                


                SqlDataAdapter sdata = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sdata.Fill(dt);

                conex.Open();
                int i = cmd.ExecuteNonQuery();
                conex.Close();

                if (dt.Rows.Count > 0)
                {
                    
                    Session["idPaciente"] = loginPacienteTextBox.Text;
                    Response.Redirect("~/UI/homePaciente.aspx");
                    Session.RemoveAll();
                    

                }
                else
                {
                    pacienteLabel.Text = "Nome de Usuário (e) ou Senha incorretos";
                    pacienteLabel.ForeColor = System.Drawing.Color.Red;
                    senhaPacienteTextBox.Text = "";
                }
            }
            catch (SqlException error)
            {
                throw new Exception(error.Message);
            }
        }
    }
}