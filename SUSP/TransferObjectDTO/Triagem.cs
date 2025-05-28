using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AcessoDadosDAO
{
    public class Triagem
    {
        public int Id { get; set; }
        public String data_Tri { get; set; }
        public FuncionarioTriagem FK_FUNCIONARIO_TRIAGEM_crm_FunT { get; set;}
        public Paciente FK_Paciente_idPaciente { get; set; }
        public Especialista FK_Especialista_crm_EspM { get; set; }
        public DiagnosticoFinal FK_DiagnosticoFinal_idDiagnostico_Final { get; set; }
        public string observacaoPaciente_Tri { get; set; }

    }
}
