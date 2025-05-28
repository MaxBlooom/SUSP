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
    public partial class acompanhamentoTri : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        bool isChecked = false;
        DAO.ModeloDAO obj_Dao = new DAO.ModeloDAO();
        protected void rbtNaoSabe_CheckedChanged(object sender, EventArgs e)
        {
            
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void tbCPF_TextChanged(object sender, EventArgs e)
        {

        }

        protected void ImageButton1_Click1(object sender, ImageClickEventArgs e)
        {

        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void tbNumeroTri_TextChanged(object sender, EventArgs e)
        {

        }

        protected void imgBtnNumeroTriagem_Click(object sender, ImageClickEventArgs e)
        {
           
            /*
            triagem.Id = Convert.ToInt32(tbNumeroTri.Text);
            GridView1.DataSource = obj_Dao.ConsultarTriagemPorNumero(triagem);

            GridView1.DataBind();
            */
            
                populateGridView();
            
        }

        //Obtêm conexão com o banco, executa o select
        void populateGridView()
        {
           

            DataTable dtbl = new DataTable();
            using (SqlConnection conex = new SqlConnection(obj_Dao.conexao_sql))
            {

                /*
                conex.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT  idTriagem, crm_FunT, nome_FunT, nome_Pac, crm_Espm, prescicaoMedica_DiagFinal, data_Tri, observacaoPaciente_Tri  from uvwVisualizarTriagemPorNumero WHERE idTriagem = @idTriagem", tbNumeroTri.Text, conex);
                sqlDa.Fill(dtbl);
                */


            }

            //Se retornar resultado
            if (dtbl.Rows.Count > 0)
            {
                gvTriagem.DataSource = dtbl;
                gvTriagem.DataBind();
            }
            else //Se retornar resultado
            {
                dtbl.Rows.Add(dtbl.NewRow());
                gvTriagem.DataSource = dtbl;
                gvTriagem.DataBind();
                gvTriagem.Rows[0].Cells.Clear();
                gvTriagem.Rows[0].Cells.Add(new TableCell());
                gvTriagem.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                gvTriagem.Rows[0].Cells[0].Text = "Nenhum resultado encontrado ..!";
                gvTriagem.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;

            }
        }

    }
}