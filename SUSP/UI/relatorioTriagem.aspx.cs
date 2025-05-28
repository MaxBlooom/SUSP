using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SUSP.UI
{
    public partial class relatorioTriagem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnConsultar_Click(object sender, EventArgs e)
        {

            try
            {
                if (string.IsNullOrEmpty(tbData.Text) || string.IsNullOrWhiteSpace(tbData.Text))
                {
                    tbData.Text = "";
                    tbData.ForeColor = System.Drawing.Color.Red;
                    tbData.Text = "Data não encontrada";
                    gridTriagem.Visible = false;

                }
                else
                {
                    AcessoDadosDAO.Triagem dados_triagem = new AcessoDadosDAO.Triagem();
                    DAO.ModeloDAO obj_Dao = new DAO.ModeloDAO();

                    dados_triagem.data_Tri = tbData.Text;
                    gridTriagem.DataSource = obj_Dao.RelatorioTriagem(dados_triagem);

                    gridTriagem.DataBind();
                    gridTriagem.Visible = true;
                }
                
            }catch(Exception error)
            {
                throw new Exception(error.Message);    
            }
        }
    }
}