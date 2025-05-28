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
    public partial class ListarAllPacientes : System.Web.UI.Page
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
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM tblPaciente", conex);
                sqlDa.Fill(dtbl);

            }

            //Se retornar resultado
            if (dtbl.Rows.Count > 0)
            {
                gvPacientes.DataSource = dtbl;
                gvPacientes.DataBind();
            }
            else //Se retornar resultado
            {
                dtbl.Rows.Add(dtbl.NewRow());
                gvPacientes.DataSource = dtbl;
                gvPacientes.DataBind();
                gvPacientes.Rows[0].Cells.Clear();
                gvPacientes.Rows[0].Cells.Add(new TableCell());
                gvPacientes.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                gvPacientes.Rows[0].Cells[0].Text = "Nenhum resoltado encontrado ..!";
                gvPacientes.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;

            }
        }


        protected void gvPacientes_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvPacientes.EditIndex = -1;
            populateGridView();
        }

        protected void gvPacientes_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection conex = new SqlConnection(obj_Dao.conexao_sql))
                {
                    conex.Open();
                    SqlCommand cmd = new SqlCommand("uspDeletarPaciente", conex);
                    //está informando ao .NET os parametros que serão consultados acima
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@idPaciente", Convert.ToInt32(gvPacientes.DataKeys[e.RowIndex].Value.ToString()));
                    cmd.ExecuteNonQuery();
                    populateGridView();
                    lblSuccessMessage.Text = "Paciente Excluido com sucesso";

                }
            }
            catch (Exception ex)
            {
                lblSuccessMessage.Text = ex.Message;
                lblSuccessMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void gvPacientes_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvPacientes.EditIndex = e.NewEditIndex;
            populateGridView();
        }

        protected void gvPacientes_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                using (SqlConnection conex = new SqlConnection(obj_Dao.conexao_sql))
                {
                    //Se houver um campo vazio, favor preencher todos
                    if (((gvPacientes.Rows[e.RowIndex].FindControl("txtnome_Pac") as TextBox).Text.Trim() == "") ||
                        ((gvPacientes.Rows[e.RowIndex].FindControl("txtenderecio_Pac") as TextBox).Text.Trim() == "") ||
                        ((gvPacientes.Rows[e.RowIndex].FindControl("txtdtNascimento") as TextBox).Text.Trim() == "") ||
                        ((gvPacientes.Rows[e.RowIndex].FindControl("txtnumeTelefone_Pac") as TextBox).Text.Trim() == "") ||
                        ((gvPacientes.Rows[e.RowIndex].FindControl("txtnumTelefoneFamiliar_Pac") as TextBox).Text.Trim() == "") ||
                        ((gvPacientes.Rows[e.RowIndex].FindControl("txtnomeMae_Pac") as TextBox).Text.Trim() == "") ||
                        ((gvPacientes.Rows[e.RowIndex].FindControl("txtuf_Pac") as TextBox).Text.Trim() == "") ||
                        ((gvPacientes.Rows[e.RowIndex].FindControl("txtmunicipio_Pac") as TextBox).Text.Trim() == "") ||
                        ((gvPacientes.Rows[e.RowIndex].FindControl("txtlogin_paciente") as TextBox).Text.Trim() == "") ||
                        ((gvPacientes.Rows[e.RowIndex].FindControl("txtsenha_paciente") as TextBox).Text.Trim() == ""))
                    {
                        lblSuccessMessage.Text = "Favor, Preencher Todos os Campos";
                        lblSuccessMessage.ForeColor = System.Drawing.Color.Red;
                    }//Termino de verificar os campos
                    else
                    {
                        conex.Open();
                        
                        SqlCommand cmd = new SqlCommand("uspAtualizarPaciente", conex);
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@nome_Pac", (gvPacientes.Rows[e.RowIndex].FindControl("txtnome_Pac") as TextBox).Text.Trim());
                        cmd.Parameters.AddWithValue("@enderecio_Pac", (gvPacientes.Rows[e.RowIndex].FindControl("txtenderecio_Pac") as TextBox).Text.Trim());
                        cmd.Parameters.AddWithValue("@dtNascimento", Convert.ToDateTime((gvPacientes.Rows[e.RowIndex].FindControl("txtdtNascimento") as TextBox).Text.Trim()));
                        cmd.Parameters.AddWithValue("@numeTelefone_Pac", (gvPacientes.Rows[e.RowIndex].FindControl("txtnumeTelefone_Pac") as TextBox).Text.Trim());
                        cmd.Parameters.AddWithValue("@numTelefoneFamiliar_Pac", (gvPacientes.Rows[e.RowIndex].FindControl("txtnumTelefoneFamiliar_Pac") as TextBox).Text.Trim());
                        cmd.Parameters.AddWithValue("@nomeMae_Pac", (gvPacientes.Rows[e.RowIndex].FindControl("txtnomeMae_Pac") as TextBox).Text.Trim());
                        cmd.Parameters.AddWithValue("@uf_Pac", (gvPacientes.Rows[e.RowIndex].FindControl("txtuf_Pac") as TextBox).Text.Trim());
                        cmd.Parameters.AddWithValue("@municipio_Pac", (gvPacientes.Rows[e.RowIndex].FindControl("txtmunicipio_Pac") as TextBox).Text.Trim());
                        cmd.Parameters.AddWithValue("@login_paciente", (gvPacientes.Rows[e.RowIndex].FindControl("txtlogin_paciente") as TextBox).Text.Trim());
                        cmd.Parameters.AddWithValue("@senha_paciente", (gvPacientes.Rows[e.RowIndex].FindControl("txtsenha_paciente") as TextBox).Text.Trim());
                        cmd.Parameters.AddWithValue("@idPaciente", Convert.ToInt32(gvPacientes.DataKeys[e.RowIndex].Value.ToString()));
                        cmd.ExecuteNonQuery();
                        gvPacientes.EditIndex = -1;
                        populateGridView();
                        lblSuccessMessage.Text = "Paciente Alterado Com Sucesso";
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

        protected void gvPacientes_RowEditing1(object sender, GridViewEditEventArgs e)
        {
            gvPacientes.EditIndex = e.NewEditIndex;
            populateGridView();
        }
    }
}