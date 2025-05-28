using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;



namespace SUSP.UI
{
    public partial class ListarAllMedicamentos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                populateGridView();
            }
        }

        protected void buscarButton_Click(object sender, ImageClickEventArgs e)
        {
                        
        }

        //Instância da classe DAO, aonde está o método de inserção
        DAO.ModeloDAO obj_Dao = new DAO.ModeloDAO();

        //Instância para trazer a conexão
        // 
        void populateGridView (){


            DataTable dtbl = new DataTable();
            using (SqlConnection conex = new SqlConnection(obj_Dao.conexao_sql)) {

                conex.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM tblMedicamentos", conex);
                sqlDa.Fill(dtbl);

            }
        
            //Se retornar resultado
            if (dtbl.Rows.Count > 0)
            {
                gvMedicamentos.DataSource = dtbl;
                gvMedicamentos.DataBind();
            }
            else //Se retornar resultado
            {
                dtbl.Rows.Add(dtbl.NewRow());
                gvMedicamentos.DataSource = dtbl;
                gvMedicamentos.DataBind();
                gvMedicamentos.Rows[0].Cells.Clear();
                gvMedicamentos.Rows[0].Cells.Add(new TableCell());
                gvMedicamentos.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                gvMedicamentos.Rows[0].Cells[0].Text = "Nenhum resoltado encontrado ..!";
                gvMedicamentos.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
       
            }


        }

       

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        
        protected void gvMedicamentos_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

       

        protected void gvMedicamentos_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }

        protected void gvMedicamentos_SelectedIndexChanged2(object sender, EventArgs e)
        {

        }


   
        protected void gvMedicamentos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName.Equals("AddNew"))//Condição para caso o botão de adicionar seja clicado
                {
                    using (SqlConnection conex = new SqlConnection(obj_Dao.conexao_sql))//Puxo a conexão com o banco
                    {
                        
                        //Se houver um campo vazio, favor preencher todos
                        if (((gvMedicamentos.FooterRow.FindControl("txtnome_MedFooter") as TextBox).Text.Trim() == "") || 
                            ((gvMedicamentos.FooterRow.FindControl("txttipo_MedFooter") as TextBox).Text.Trim() == "") ||
                            ((gvMedicamentos.FooterRow.FindControl("txtdescricao_MedFooter") as TextBox).Text.Trim() == ""))
                        {
                            lblSuccessMessage.Text = "Favor, Preencher Todos os Campos";
                            lblSuccessMessage.ForeColor = System.Drawing.Color.Red;
                        }
                        else
                        {
                            conex.Open();
                            string query = "INSERT INTO tblMedicamentos (nome_Med,tipo_Med,descricao_Med) VALUES (@nome_Med,@tipo_Med,@descricao_Med)";
                            SqlCommand sqlCmd = new SqlCommand(query, conex);
                            sqlCmd.Parameters.AddWithValue("@nome_Med", (gvMedicamentos.FooterRow.FindControl("txtnome_MedFooter") as TextBox).Text.Trim());
                            sqlCmd.Parameters.AddWithValue("@tipo_Med", (gvMedicamentos.FooterRow.FindControl("txttipo_MedFooter") as TextBox).Text.Trim());
                            sqlCmd.Parameters.AddWithValue("@descricao_Med", (gvMedicamentos.FooterRow.FindControl("txtdescricao_MedFooter") as TextBox).Text.Trim());
                            sqlCmd.ExecuteNonQuery();
                            populateGridView();
                            lblSuccessMessage.Text = "Novo Medicamento Cadastrado";
                            lblSuccessMessage.ForeColor = System.Drawing.Color.Green;
                        }
                        
                    }
                }
            }
            catch (Exception ex)
            {
                lblSuccessMessage.Text = ex.Message;
                lblSuccessMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void gvMedicamentos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection conex = new SqlConnection(obj_Dao.conexao_sql))
                {
                    conex.Open();
                    string query = "DELETE FROM tblMedicamentos WHERE idMedicamentos = @id";
                    SqlCommand sqlCmd = new SqlCommand(query, conex);
                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(gvMedicamentos.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    populateGridView();
                    lblSuccessMessage.Text = "Medicamento Excluido com sucesso";
                    
                }
            }
            catch (Exception ex)
            {
                 lblSuccessMessage.Text = ex.Message;
                lblSuccessMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void gvMedicamentos_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                using (SqlConnection conex = new SqlConnection(obj_Dao.conexao_sql))
                {
                    //Se houver um campo vazio, favor preencher todos
                    if (((gvMedicamentos.Rows[e.RowIndex].FindControl("txtnome_Med") as TextBox).Text.Trim() == "") ||
                        ((gvMedicamentos.Rows[e.RowIndex].FindControl("txttipo_Med") as TextBox).Text.Trim() =="")||
                        ((gvMedicamentos.Rows[e.RowIndex].FindControl("txtdescricao_Med") as TextBox).Text.Trim() == ""))
                    {
                        lblSuccessMessage.Text = "Favor, Preencher Todos os Campos";
                        lblSuccessMessage.ForeColor = System.Drawing.Color.Red;
                    }
                    else
                    {
                        conex.Open(); 
                        string query = "UPDATE tblMedicamentos SET nome_Med=@nome_Med, tipo_Med=@tipo_Med, descricao_Med=@descricao_Med WHERE idMedicamentos = @id";
                        SqlCommand sqlCmd = new SqlCommand(query, conex);
                        sqlCmd.Parameters.AddWithValue("@nome_Med", (gvMedicamentos.Rows[e.RowIndex].FindControl("txtnome_Med") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@tipo_Med", (gvMedicamentos.Rows[e.RowIndex].FindControl("txttipo_Med") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@descricao_Med", (gvMedicamentos.Rows[e.RowIndex].FindControl("txtdescricao_Med") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(gvMedicamentos.DataKeys[e.RowIndex].Value.ToString()));
                        sqlCmd.ExecuteNonQuery();
                        gvMedicamentos.EditIndex = -1;
                        populateGridView();
                        lblSuccessMessage.Text = "Medicamento Alterado Com Sucesso";
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

        protected void gvMedicamentos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvMedicamentos.EditIndex = -1;
            populateGridView();
        }

        protected void gvMedicamentos_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvMedicamentos.EditIndex = e.NewEditIndex;
            populateGridView();
        }
    }
}