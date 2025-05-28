using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AcessoDadosDAO
{
    public class DiagnosticoFinal
    {
        public int Id { get; set; }
        public string prescicaoMedica_DiagFinal { get; set; }
        public string descricao_Med { get; set; }
        public Medicamentos FK_Medicamentos_idMedicamento { get; set; }

    }
}
