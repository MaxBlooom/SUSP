using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SUSP.UI
{
    public partial class consultarTriagem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DAO.ModeloDAO modeloDAO = new DAO.ModeloDAO();
            
            GridView1.DataSource = modeloDAO.lista_Triagem();
            GridView1.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}