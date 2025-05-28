using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AcessoDadosDAO
{
    public class Doenca_Possivel_has_Triagem
    {
        public DoencaPossivel FK_Doenca_Possivel_idDoencasPossiveis { get; set; }
        public Triagem FK_Triagem_idTriagem { get; set; }

    }
}
