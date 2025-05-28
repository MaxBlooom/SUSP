using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AcessoDadosDAO
{
    public class DoencaPossivel
    {
        public int Id { get; set; }
        public string nome_Doe { get; set; }
        public string descricao_Doe { get; set; }
        public Sintomas FK_Sintomas_idSintomas { get; set; }
    }
}
