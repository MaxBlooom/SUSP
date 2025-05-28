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
    public partial class ListarAllFuncionarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                populateGridView();
            }

        }

        //Instância da classe DAO, aonde está o método de inserção
        DAO.ModeloDAO obj_Dao = new DAO.ModeloDAO();

        //Obtêm conexão com o banco, executa o select
        void populateGridView()
        {


            DataTable dtbl = new DataTable();
            using (SqlConnection conex = new SqlConnection(obj_Dao.conexao_sql))
            {

                conex.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM tblFuncionarioTriagem", conex);
                sqlDa.Fill(dtbl);

            }

            //Se retornar resultado
            if (dtbl.Rows.Count > 0)
            {
                gvFuncionario.DataSource = dtbl;
                gvFuncionario.DataBind();
            }
            else //Se não retornar resultado
            {
                dtbl.Rows.Add(dtbl.NewRow());
                gvFuncionario.DataSource = dtbl;
                gvFuncionario.DataBind();
                gvFuncionario.Rows[0].Cells.Clear();
                gvFuncionario.Rows[0].Cells.Add(new TableCell());
                gvFuncionario.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                gvFuncionario.Rows[0].Cells[0].Text = "Nenhum resoltado encontrado ..!";
                gvFuncionario.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;

            }
        }

        protected void buscarButton_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void gvFuncionario_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvFuncionario.EditIndex = -1;
            populateGridView();
        }

        protected void gvFuncionario_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvFuncionario.EditIndex = e.NewEditIndex;
            populateGridView();
        }

        protected void gvFuncionario_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection conex = new SqlConnection(obj_Dao.conexao_sql))
                {
                    conex.Open();
                    SqlCommand cmd = new SqlCommand("uspDeletarFuncionario", conex);
                    //está informando ao .NET os parametros que serão consultados acima
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@crm_FunT", Convert.ToInt32(gvFuncionario.DataKeys[e.RowIndex].Value.ToString()));
                    cmd.ExecuteNonQuery();
                    populateGridView();
                    lblSuccessMessage.Text = "Funcionário Excluido com sucesso";

                }
            }
            catch (Exception ex)
            {
                lblSuccessMessage.Text = ex.Message;
                lblSuccessMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void gvFuncionario_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                using (SqlConnection conex = new SqlConnection(obj_Dao.conexao_sql))
                {
                    //Se houver um campo vazio, favor preencher todos
                    if (((gvFuncionario.Rows[e.RowIndex].FindControl("txtnome_FunT") as TextBox).Text.Trim() == "") ||
                        ((gvFuncionario.Rows[e.RowIndex].FindControl("txtendereco_FunT") as TextBox).Text.Trim() == "") ||
                        ((gvFuncionario.Rows[e.RowIndex].FindControl("txtuf_FunT") as TextBox).Text.Trim() == "") ||
                        ((gvFuncionario.Rows[e.RowIndex].FindControl("txtmunicipio_FunT") as TextBox).Text.Trim() == "") ||
                        ((gvFuncionario.Rows[e.RowIndex].FindControl("txttelefone1_FunT") as TextBox).Text.Trim() == "") ||
                        ((gvFuncionario.Rows[e.RowIndex].FindControl("txttelefone2_FunT") as TextBox).Text.Trim() == "") ||
                        ((gvFuncionario.Rows[e.RowIndex].FindControl("txtemail_FunT") as TextBox).Text.Trim() == "") ||
                        ((gvFuncionario.Rows[e.RowIndex].FindControl("txtcpf_FunT") as TextBox).Text.Trim() == "") ||
                        ((gvFuncionario.Rows[e.RowIndex].FindControl("txtrg_FunT") as TextBox).Text.Trim() == "") ||
                        ((gvFuncionario.Rows[e.RowIndex].FindControl("txtlogin_funcionario") as TextBox).Text.Trim() == "") ||
                        ((gvFuncionario.Rows[e.RowIndex].FindControl("txtsenha_funcionario") as TextBox).Text.Trim() == ""))
                    {
                        lblSuccessMessage.Text = "Favor, Preencher Todos os Campos";
                        lblSuccessMessage.ForeColor = System.Drawing.Color.Red;
                    }//Termino de verificar os campos
                    else
                    {
                        conex.Open();

                        SqlCommand cmd = new SqlCommand("uspAtualizarFuncionarioTrigem", conex);
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@nome_FunT", (gvFuncionario.Rows[e.RowIndex].FindControl("txtnome_FunT") as TextBox).Text.Trim());
                        cmd.Parameters.AddWithValue("@endereco_FunT", (gvFuncionario.Rows[e.RowIndex].FindControl("txtendereco_FunT") as TextBox).Text.Trim());
                        cmd.Parameters.AddWithValue("@uf_FunT", (gvFuncionario.Rows[e.RowIndex].FindControl("txtuf_FunT") as TextBox).Text.Trim());
                        cmd.Parameters.AddWithValue("@municipio_FunT", (gvFuncionario.Rows[e.RowIndex].FindControl("txtmunicipio_FunT") as TextBox).Text.Trim());
                        cmd.Parameters.AddWithValue("@telefone1_FunT", (gvFuncionario.Rows[e.RowIndex].FindControl("txttelefone1_FunT") as TextBox).Text.Trim());
                        cmd.Parameters.AddWithValue("@telefone2_FunT", (gvFuncionario.Rows[e.RowIndex].FindControl("txttelefone2_FunT") as TextBox).Text.Trim());
                        cmd.Parameters.AddWithValue("@email_FunT", (gvFuncionario.Rows[e.RowIndex].FindControl("txtemail_FunT") as TextBox).Text.Trim());
                        cmd.Parameters.AddWithValue("@cpf_FunT", (gvFuncionario.Rows[e.RowIndex].FindControl("txtcpf_FunT") as TextBox).Text.Trim());
                        cmd.Parameters.AddWithValue("@rg_FunT", (gvFuncionario.Rows[e.RowIndex].FindControl("txtrg_FunT") as TextBox).Text.Trim());
                        cmd.Parameters.AddWithValue("@login_Funcionario", (gvFuncionario.Rows[e.RowIndex].FindControl("txtlogin_funcionario") as TextBox).Text.Trim());
                        cmd.Parameters.AddWithValue("@senha_Funcionario", (gvFuncionario.Rows[e.RowIndex].FindControl("txtsenha_funcionario") as TextBox).Text.Trim());
                        cmd.Parameters.AddWithValue("@crm_FunT", Convert.ToInt32(gvFuncionario.DataKeys[e.RowIndex].Value.ToString()));
                        cmd.ExecuteNonQuery();
                        gvFuncionario.EditIndex = -1;
                        populateGridView();
                        lblSuccessMessage.Text = "Funcionário Alterado Com Sucesso";
                        lblSuccessMessage.ForeColor = System.Drawing.Color.Green;

                    }

                }
            }
            catch (Exception ex)
            {
                lblSuccessMessage.Text = ex.Message;
                lblSuccessMessage.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}