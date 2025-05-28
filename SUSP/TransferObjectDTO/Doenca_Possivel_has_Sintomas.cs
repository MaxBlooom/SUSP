using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AcessoDadosDAO
{
    public class Doenca_Possivel_has_Sintomas
    {
        public DoencaPossivel FK_Doenca_Possivel_idDoencasPossiveis { get; set; }
        public Sintomas FK_SINTOMAS_idSintomas { get; set; }

    }
}
