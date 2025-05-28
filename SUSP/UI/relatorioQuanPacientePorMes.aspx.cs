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
    public partial class relatorioQuanPacientePorMes : System.Web.UI.Page
    {

#region evento do droplist
        public void ConverterEstado(string mes)
        {
            switch (mes)
            {

                case "Janeiro":
                    DropDownList1.Text = "01";
                    break;

                case "Setembro":
                    DropDownList1.Text = "09";
                    break;
            }
        }
#endregion
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnConsultar_Click(object sender, EventArgs e)
        {
           
            DAO.ModeloDAO obj_dao = new DAO.ModeloDAO();

            SqlConnection conn = new SqlConnection(obj_dao.conexao_sql);
            conn.Open();
            SqlCommand comm = new SqlCommand("uspConsultarQuantPacientePorData",conn);
            comm.CommandType = System.Data.CommandType.StoredProcedure;
            comm.Parameters.AddWithValue("@data_Tri", DropDownList1.Text);
            Int32 count =Convert.ToInt32(comm.ExecuteScalar());

            if (count > 0)
            {
               
                lbResult.Text = Convert.ToString(count.ToString());
            }
            else
            {
                lbResult.Text = "Não existem registros de usuários para esse mês!!";
            }
            conn.Close();

        }

        protected void DropDownList1_TextChanged(object sender, EventArgs e)
        {
            ConverterEstado(DropDownList1.Text);
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            DAO.ModeloDAO obj_dao = new DAO.ModeloDAO();

            SqlConnection conn = new SqlConnection(obj_dao.conexao_sql);
            conn.Open();
            SqlCommand comm = new SqlCommand("uspConsultarQuantPacientePorData", conn);
            comm.CommandType = System.Data.CommandType.StoredProcedure;
            comm.Parameters.AddWithValue("@data_Tri", DropDownList1.Text);
            Int32 count = Convert.ToInt32(comm.ExecuteScalar());

            if (count > 0)
            {
                lbResult.Text = Convert.ToString(count.ToString());
            }
            else
            {
                lbResult.Text = "Não existem registros de usuários para esse mês!!";
            }
            conn.Close();

        }
    }
}