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
    public partial class ListarAllEspecialistas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Método que é carregado no page load da Page
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
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM tblEspecialista", conex);
                sqlDa.Fill(dtbl);

            }

            //Se retornar resultado
            if (dtbl.Rows.Count > 0)
            {
                gvEspecialista.DataSource = dtbl;
                gvEspecialista.DataBind();
            }
            else //Se retornar resultado
            {
                dtbl.Rows.Add(dtbl.NewRow());
                gvEspecialista.DataSource = dtbl;
                gvEspecialista.DataBind();
                gvEspecialista.Rows[0].Cells.Clear();
                gvEspecialista.Rows[0].Cells.Add(new TableCell());
                gvEspecialista.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                gvEspecialista.Rows[0].Cells[0].Text = "Nenhum resoltado encontrado ..!";
                gvEspecialista.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;

            }
        }

        protected void buscarButton_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void gvEspecialista_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvEspecialista.EditIndex = -1;
            populateGridView();
        }

        protected void gvEspecialista_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            try
            {
                using (SqlConnection conex = new SqlConnection(obj_Dao.conexao_sql))
                {
                    //Se houver um campo vazio, favor preencher todos
                    if (((gvEspecialista.Rows[e.RowIndex].FindControl("txtnome_Espm") as TextBox).Text.Trim() == "") ||
                        ((gvEspecialista.Rows[e.RowIndex].FindControl("txtendereco_Espm") as TextBox).Text.Trim() == "") ||
                        ((gvEspecialista.Rows[e.RowIndex].FindControl("txtuf_Espm") as TextBox).Text.Trim() == "") ||
                        ((gvEspecialista.Rows[e.RowIndex].FindControl("txtmunicipio_Espm") as TextBox).Text.Trim() == "") ||
                        ((gvEspecialista.Rows[e.RowIndex].FindControl("txttelefone1_Espm") as TextBox).Text.Trim() == "") ||
                        ((gvEspecialista.Rows[e.RowIndex].FindControl("txttelefone2_Espm") as TextBox).Text.Trim() == "") ||
                        ((gvEspecialista.Rows[e.RowIndex].FindControl("txtemail_Espm") as TextBox).Text.Trim() == "") ||
                        ((gvEspecialista.Rows[e.RowIndex].FindControl("txtcpf_Espm") as TextBox).Text.Trim() == "") ||
                        ((gvEspecialista.Rows[e.RowIndex].FindControl("txtrg_Espm") as TextBox).Text.Trim() == ""))
                    {
                        lblSuccessMessage.Text = "Favor, Preencher Todos os Campos";
                        lblSuccessMessage.ForeColor = System.Drawing.Color.Red;
                    }//Termino de verificar os campos
                    else
                    {
                        conex.Open();

                        SqlCommand cmd = new SqlCommand("uspAtualizarEspecialista", conex);
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@nome_Espm", (gvEspecialista.Rows[e.RowIndex].FindControl("txtnome_Espm") as TextBox).Text.Trim());
                        cmd.Parameters.AddWithValue("@endereco_Espm", (gvEspecialista.Rows[e.RowIndex].FindControl("txtendereco_Espm") as TextBox).Text.Trim());
                        cmd.Parameters.AddWithValue("@uf_Espm", (gvEspecialista.Rows[e.RowIndex].FindControl("txtuf_Espm") as TextBox).Text.Trim());
                        cmd.Parameters.AddWithValue("@municipio_Espm", (gvEspecialista.Rows[e.RowIndex].FindControl("txtmunicipio_Espm") as TextBox).Text.Trim());
                        cmd.Parameters.AddWithValue("@telefone1_Espm", (gvEspecialista.Rows[e.RowIndex].FindControl("txttelefone1_Espm") as TextBox).Text.Trim());
                        cmd.Parameters.AddWithValue("@telefone2_Espm", (gvEspecialista.Rows[e.RowIndex].FindControl("txttelefone2_Espm") as TextBox).Text.Trim());
                        cmd.Parameters.AddWithValue("@email_Espm", (gvEspecialista.Rows[e.RowIndex].FindControl("txtemail_Espm") as TextBox).Text.Trim());
                        cmd.Parameters.AddWithValue("@cpf_Espm", (gvEspecialista.Rows[e.RowIndex].FindControl("txtcpf_Espm") as TextBox).Text.Trim());
                        cmd.Parameters.AddWithValue("@rg_Espm", (gvEspecialista.Rows[e.RowIndex].FindControl("txtrg_Espm") as TextBox).Text.Trim());
                        cmd.Parameters.AddWithValue("@crm_Espm", Convert.ToInt32(gvEspecialista.DataKeys[e.RowIndex].Value.ToString()));
                        cmd.ExecuteNonQuery();
                        gvEspecialista.EditIndex = -1;
                        populateGridView();
                        lblSuccessMessage.Text = "Especialista Alterado Com Sucesso";
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

        protected void gvEspecialista_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvEspecialista.EditIndex = e.NewEditIndex;
            populateGridView();
        }

        protected void gvEspecialista_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection conex = new SqlConnection(obj_Dao.conexao_sql))
                {
                    conex.Open();
                    SqlCommand cmd = new SqlCommand("uspDeletarEspecialista", conex);
                    //está informando ao .NET os parametros que serão consultados acima
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("crm_Espm", Convert.ToInt32(gvEspecialista.DataKeys[e.RowIndex].Value.ToString()));//Pedo o CRM do cara
                    cmd.ExecuteNonQuery();
                    populateGridView();
                    lblSuccessMessage.Text = "Especialista Excluido com sucesso";

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