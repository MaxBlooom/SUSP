using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AcessoDadosDAO
{
    public class Especialista_has_Especialidade
    {
        public Especialidade FK_Especialidade_idEspecialidade { get; set;}
        public Especialista FK_Especialista_crm_EspM { get; set; }

    }
}
