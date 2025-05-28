using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AcessoDadosDAO
{
    public class Paciente
    {
        public int Id { get; set; }
        public string nome_Pac { get; set; }
        public string enderecio_Pac { get; set; }
        public DateTime dtNascimento { get; set; }
        public string numeTelefone_Pac { get; set; }
        public string numTelefoneFamiliar_Pac { get; set; }
        public string nomeMae_Pac { get; set; }
        public string uf_Pac { get; set; }
        public string municipio_Pac { get; set; }
        public string login_paciente { get; set; }
        public string senha_paciente { get; set; }
}
}
