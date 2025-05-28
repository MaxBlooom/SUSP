using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlTypes;
using System.Data.SqlClient;
using System.Data;
using AcessoDadosDAO;
using System.Web.UI;
using System.Web.UI.WebControls;



namespace SUSP.DAO
{
    public class ModeloDAO
    {

        //String de conexão
        public string conexao_sql = @"Data Source=NOT-MAX\SQLEXPRESS;Initial Catalog=TCM;Integrated Security=True";

        //Criando um objeto para ser usado como conexão do banco de dados
        SqlConnection conexao = null;

        //Criando um método que retornará um dataTable
        public DataTable lista_Triagem()
        {

            try
            {
                //Criando um objeto para ser usado como conexão do banco, passando a string de conexão por parâmetro
                conexao = new SqlConnection(conexao_sql);
                //Criando o objeto "sql" do tipo SqlComand para receber um comando sql
                SqlCommand sql = new SqlCommand("uspConsultarAllTriagem", conexao);
                //Criando um adaptador 
                SqlDataAdapter daBairro = new SqlDataAdapter();
                //Esse adaptador, converterá o comando acima(sql), para uma linguagem que o .NET entenda
                daBairro.SelectCommand = sql;
                //Instanciando um objeto da classe DataTable
                DataTable dtBairro = new DataTable();
                //Esse objeto receberá os dados acima filtrando o seu conteudo já adaptado
                daBairro.Fill(dtBairro);
                // Retornando o datatable para o método
                return dtBairro;
            }

            catch (Exception erro)
            {

                throw new Exception(erro.Message);
            }

        }


        /*Inicio Paciente*/
        //Inserir Paciente
        public void inserirPaciente(Paciente dadosPaciente)
        {

            try
            {
                //Criando um objeto para ser usado como conexão do banco, passando a string de conexão por parâmetro
                conexao = new SqlConnection(conexao_sql);
                //Criando o objeto "sql" do tipo SqlComand para receber um comando sql
                SqlCommand cmd = new SqlCommand("uspInserirPaciente", conexao);

                //está informando ao .NET os parametros que serão consultados acima
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                //Adicionando os parâmetros da procedure através das caixas de texto
                cmd.Parameters.AddWithValue("@nome_Pac", dadosPaciente.nome_Pac);
                cmd.Parameters.AddWithValue("@enderecio_Pac", dadosPaciente.enderecio_Pac);
                cmd.Parameters.AddWithValue("@dtNascimento", dadosPaciente.dtNascimento);
                cmd.Parameters.AddWithValue("@numeTelefone_Pac", dadosPaciente.numeTelefone_Pac);
                cmd.Parameters.AddWithValue("@numTelefoneFamiliar_Pac", dadosPaciente.numTelefoneFamiliar_Pac);
                cmd.Parameters.AddWithValue("@nomeMae_Pac", dadosPaciente.nomeMae_Pac);
                cmd.Parameters.AddWithValue("@uf_Pac", dadosPaciente.uf_Pac);
                cmd.Parameters.AddWithValue("@municipio_Pac", dadosPaciente.municipio_Pac);
                cmd.Parameters.AddWithValue("@login_paciente", dadosPaciente.login_paciente);
                cmd.Parameters.AddWithValue("@senha_paciente", dadosPaciente.senha_paciente);

                //Abrindo a conexão 
                conexao.Open();

                //Usado para CRUD, insert, delete, update
                cmd.ExecuteNonQuery();

                //Fechando a conexão
                conexao.Close();
            }

            catch (Exception exception)
            {
                throw new Exception(exception.Message);
            }

        }

        public void InserirTriagemOn(Triagem dados_triagem, Paciente dados_paciente)
        {

            try
            {
                //Criando um objeto para ser usado como conexão do banco, passando a string de conexão por parâmetro
                conexao = new SqlConnection(conexao_sql);
                //Criando o objeto "sql" do tipo SqlComand para receber um comando sql
                SqlCommand cmd = new SqlCommand("uspInserirTriagem", conexao);

                // está informando ao .NET os parametros que serão consultados acima
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                //Adicionando os parâmetros da procedure através das caixas de texto
                cmd.Parameters.AddWithValue("@data_tri", DateTime.Now.ToString());
                cmd.Parameters.AddWithValue("@FK_Paciente_idPaciente", dados_paciente.Id);
                cmd.Parameters.AddWithValue("@FK_FUNCIONARIO_TRIAGEM_crm_FunT", null);
                cmd.Parameters.AddWithValue("@FK_Especialista_crm_EspM", null);
                cmd.Parameters.AddWithValue("@FK_DiagnosticoFinal_idDiagnostico_Final", null);
                cmd.Parameters.AddWithValue("@observacaoPaciente_Tri", dados_triagem.observacaoPaciente_Tri);

                //Abrindo a conexão 
                conexao.Open();

                //Usado para CRUD, insert, delete, update
                cmd.ExecuteNonQuery();

                //Fechando a conexão
                conexao.Close();
            }

            catch (Exception exception)
            {
                throw new Exception(exception.Message);
            }
        }
            //Método de alteração do Paciente
             
            public void AlteraPaciente(Paciente dadosPaciente)
        {

            try
            {
                //Criando um objeto para ser usado como conexão do banco, passando a string de conexão por parâmetro
                conexao = new SqlConnection(conexao_sql);
                //Criando o objeto "sql" do tipo SqlComand para receber um comando sql
                SqlCommand cmd = new SqlCommand("uspAtualizarPaciente", conexao);

                //está informando ao .NET os parametros que serão consultados acima
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                //Adicionando os parâmetros da procedure através das caixas de texto
                cmd.Parameters.AddWithValue("@idPaciente", dadosPaciente.Id);
                cmd.Parameters.AddWithValue("@nome_Pac", dadosPaciente.nome_Pac);
                cmd.Parameters.AddWithValue("@enderecio_Pac", dadosPaciente.enderecio_Pac);
                cmd.Parameters.AddWithValue("@dtNascimento", dadosPaciente.dtNascimento);
                cmd.Parameters.AddWithValue("@numeTelefone_Pac", dadosPaciente.numeTelefone_Pac);
                cmd.Parameters.AddWithValue("@numTelefoneFamiliar_Pac", dadosPaciente.numTelefoneFamiliar_Pac);
                cmd.Parameters.AddWithValue("@nomeMae_Pac", dadosPaciente.nomeMae_Pac);
                cmd.Parameters.AddWithValue("@uf_Pac", dadosPaciente.uf_Pac);
                cmd.Parameters.AddWithValue("@municipio_Pac", dadosPaciente.municipio_Pac);
                cmd.Parameters.AddWithValue("@login_Paciente", dadosPaciente.login_paciente);
                cmd.Parameters.AddWithValue("@senha_Paciente", dadosPaciente.senha_paciente);

                //Abrindo a conexão 
                conexao.Open();

                //Usado para CRUD, insert, delete, update
                cmd.ExecuteNonQuery();

                //Fechando a conexão
                conexao.Close();
            }

            catch (Exception exception)
            {
                throw new Exception(exception.Message);
            }

        }

        //Exclusão do Paciente
        
        public void DeletaPaciente(Paciente dadosPaciente)
        {

            try
            {
                //Criando um objeto para ser usado como conexão do banco, passando a string de conexão por parâmetro
                conexao = new SqlConnection(conexao_sql);
                //Criando o objeto "sql" do tipo SqlComand para receber um comando sql
                SqlCommand cmd = new SqlCommand("uspDeletarPaciente", conexao);
                //está informando ao .NET os parametros que serão consultados acima
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                //Passando o ID do Paciente que será excluído
                cmd.Parameters.AddWithValue("@idPaciente", dadosPaciente.Id);

                //Abrindo a conexão 
                conexao.Open();

                //Usado para CRUD, insert, delete, update
                cmd.ExecuteNonQuery();

                //Fechando a conexão
                conexao.Close();

            }

            catch (Exception erro)
            {

                throw new Exception(erro.Message);
            }

        }

        //Método que criei para listar os pacientes
        public DataTable lista_Pacientes()
        {

            try
            {
                //Criando um objeto para ser usado como conexão do banco, passando a string de conexão por parâmetro
                conexao = new SqlConnection(conexao_sql);
                //Criando o objeto "sql" do tipo SqlComand para receber um comando sql
                SqlCommand sql = new SqlCommand("uspConsultarTodosPacienteParaGridView", conexao);
                //Criando um adaptador 
                SqlDataAdapter daPaciente = new SqlDataAdapter();
                //Esse adaptador, converterá o comando acima(sql), para uma linguagem que o .NET entenda
                daPaciente.SelectCommand = sql;
                //Instanciando um objeto da classe DataTable
                DataTable dtPaciente = new DataTable();
                //Esse objeto receberá os dados acima filtrando o seu conteudo já adaptado
                daPaciente.Fill(dtPaciente);
                // Retornando o datatable para o método
                return dtPaciente;
            }

            catch (Exception erro)
            {

                throw new Exception(erro.Message);
            }

        }
        /*Paciente*/

        /*Inicio Especialista*/
        //Inserir Especialista
        public void inserirEspecialista(Especialista dadosEspecialista)
        {

            try
            {
                //Criando um objeto para ser usado como conexão do banco, passando a string de conexão por parâmetro
                conexao = new SqlConnection(conexao_sql);
                //Criando o objeto "sql" do tipo SqlComand para receber um comando sql
                SqlCommand cmd = new SqlCommand("uspInserirEspecialista", conexao);

                //está informando ao .NET os parametros que serão consultados acima
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                //Adicionando os parâmetros da procedure através das caixas de texto
                cmd.Parameters.AddWithValue("@crm_Espm", dadosEspecialista.crm_Espm);
                cmd.Parameters.AddWithValue("@nome_Espm", dadosEspecialista.nome_Espm);
                cmd.Parameters.AddWithValue("@endereco_Espm", dadosEspecialista.endereco_Espm);
                cmd.Parameters.AddWithValue("@uf_Espm", dadosEspecialista.uf_Espm);
                cmd.Parameters.AddWithValue("@municipio_Espm", dadosEspecialista.municipio_Espm);
                cmd.Parameters.AddWithValue("@telefone1_Espm", dadosEspecialista.telefone1_Espm);
                cmd.Parameters.AddWithValue("@telefone2_Espm", dadosEspecialista.telefone1_Espm);
                cmd.Parameters.AddWithValue("@email_Espm", dadosEspecialista.email_Espm);
                cmd.Parameters.AddWithValue("@cpf_Espm", dadosEspecialista.cpf_Espm);
                cmd.Parameters.AddWithValue("@rg_Espm", dadosEspecialista.rg_Espm);

                //Abrindo a conexão 
                conexao.Open();

                //Usado para CRUD, insert, delete, update
                cmd.ExecuteNonQuery();

                //Fechando a conexão
                conexao.Close();
            }

            catch (Exception exception)
            {
                throw new Exception(exception.Message);
            }

        }

        //Método de alteração do Especialista
        public void AlteraEspecialista(Especialista dadosEspecialista)
        {

            try
            {
                //Criando um objeto para ser usado como conexão do banco, passando a string de conexão por parâmetro
                conexao = new SqlConnection(conexao_sql);
                //Criando o objeto "sql" do tipo SqlComand para receber um comando sql
                SqlCommand cmd = new SqlCommand("uspAtualizarEspecialista", conexao);

                //está informando ao .NET os parametros que serão consultados acima
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                //Adicionando os parâmetros da procedure através das caixas de texto
                cmd.Parameters.AddWithValue("@crm_Espm", dadosEspecialista.crm_Espm);
                cmd.Parameters.AddWithValue("@nome_Espm", dadosEspecialista.nome_Espm);
                cmd.Parameters.AddWithValue("@endereco_Espm", dadosEspecialista.endereco_Espm);
                cmd.Parameters.AddWithValue("@uf_Espm", dadosEspecialista.uf_Espm);
                cmd.Parameters.AddWithValue("@municipio_Espm", dadosEspecialista.municipio_Espm);
                cmd.Parameters.AddWithValue("@telefone1_Espm", dadosEspecialista.telefone1_Espm);
                cmd.Parameters.AddWithValue("@telefone2_Espm", dadosEspecialista.telefone2_Espm);
                cmd.Parameters.AddWithValue("@email_Espm", dadosEspecialista.email_Espm);
                cmd.Parameters.AddWithValue("@cpf_Espm", dadosEspecialista.cpf_Espm);
                cmd.Parameters.AddWithValue("@rg_Espm", dadosEspecialista.rg_Espm);

                //Abrindo a conexão 
                conexao.Open();

                //Usado para CRUD, insert, delete, update
                cmd.ExecuteNonQuery();

                //Fechando a conexão
                conexao.Close();
            }

            catch (Exception exception)
            {
                throw new Exception(exception.Message);
            }

        }

        //Excluir Especialista
        public void DeletaEspecialista(Especialista dadosEspecialista)
        {

            try
            {
                //Criando um objeto para ser usado como conexão do banco, passando a string de conexão por parâmetro
                conexao = new SqlConnection(conexao_sql);
                //Criando o objeto "sql" do tipo SqlComand para receber um comando sql
                SqlCommand cmd = new SqlCommand("uspDeletarEspecialista", conexao);
                //está informando ao .NET os parametros que serão consultados acima
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                //Passando o ID do Especialista que será excluído
                cmd.Parameters.AddWithValue("@crm_Espm", dadosEspecialista.crm_Espm);

                //Abrindo a conexão 
                conexao.Open();

                //Usado para CRUD, insert, delete, update
                cmd.ExecuteNonQuery();

                //Fechando a conexão
                conexao.Close();

            }

            catch (Exception erro)
            {

                throw new Exception(erro.Message);
            }

        }

        //Método que criei para listar os pacientes
        public DataTable lista_Especialista()
        {

            try
            {
                //Criando um objeto para ser usado como conexão do banco, passando a string de conexão por parâmetro
                conexao = new SqlConnection(conexao_sql);
                //Criando o objeto "sql" do tipo SqlComand para receber um comando sql
                SqlCommand sql = new SqlCommand("uspConsultarTodosEspecialistasParaGridView", conexao);
                //Criando um adaptador 
                SqlDataAdapter daEspecialista = new SqlDataAdapter();
                //Esse adaptador, converterá o comando acima(sql), para uma linguagem que o .NET entenda
                daEspecialista.SelectCommand = sql;
                //Instanciando um objeto da classe DataTable
                DataTable dtEspecialista = new DataTable();
                //Esse objeto receberá os dados acima filtrando o seu conteudo já adaptado
                daEspecialista.Fill(dtEspecialista);
                // Retornando o datatable para o método
                return dtEspecialista;
            }

            catch (Exception erro)
            {

                throw new Exception(erro.Message);
            }

        }
        /*Fim Especialista*/

        /*Inicio Funcionário*/

        //Inserção do Funcionário
        public void inserirFuncionario(FuncionarioTriagem dadosFuncionario)
        {

            try
            {
                //Criando um objeto para ser usado como conexão do banco, passando a string de conexão por parâmetro
                conexao = new SqlConnection(conexao_sql);
                //Criando o objeto "sql" do tipo SqlComand para receber um comando sql
                SqlCommand cmd = new SqlCommand("uspInserirFuncionario", conexao);

                //está informando ao .NET os parametros que serão consultados acima
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                //Adicionando os parâmetros da procedure através das caixas de texto
                cmd.Parameters.AddWithValue("@crm_FunT", dadosFuncionario.crm_FunT);
                cmd.Parameters.AddWithValue("@nome_FunT", dadosFuncionario.nome_FunT);
                cmd.Parameters.AddWithValue("@endereco_FunT", dadosFuncionario.endereco_FunT);
                cmd.Parameters.AddWithValue("@uf_FunT", dadosFuncionario.uf_FunT);
                cmd.Parameters.AddWithValue("@municipio_FunT", dadosFuncionario.municipio_FunT);
                cmd.Parameters.AddWithValue("@telefone1_FunT", dadosFuncionario.telefone1_FunT);
                cmd.Parameters.AddWithValue("@telefone2_FunT", dadosFuncionario.telefone2_FunT);
                cmd.Parameters.AddWithValue("@email_FunT", dadosFuncionario.email_FunT);
                cmd.Parameters.AddWithValue("@cpf_FunT", dadosFuncionario.cpf_FunT);
                cmd.Parameters.AddWithValue("@rg_FunT", dadosFuncionario.rg_FunT);
                cmd.Parameters.AddWithValue("@login_Funcionario", dadosFuncionario.login_funcionario);
                cmd.Parameters.AddWithValue("@senha_Funcionario", dadosFuncionario.senha_funcionario);

                //Abrindo a conexão 
                conexao.Open();

                //Usado para CRUD, insert, delete, update
                cmd.ExecuteNonQuery();

                //Fechando a conexão
                conexao.Close();
            }

            catch (Exception exception)
            {
                throw new Exception(exception.Message);
            }

        }


        //Método de alteração do Funcionario
        public void AlteraFuncionario(FuncionarioTriagem dadosFuncionario)
        {

            try
            {
                //Criando um objeto para ser usado como conexão do banco, passando a string de conexão por parâmetro
                conexao = new SqlConnection(conexao_sql);
                //Criando o objeto "sql" do tipo SqlComand para receber um comando sql
                SqlCommand cmd = new SqlCommand("uspAtualizarFuncionarioTrigem", conexao);

                //está informando ao .NET os parametros que serão consultados acima
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                //Adicionando os parâmetros da procedure através das caixas de texto
                cmd.Parameters.AddWithValue("@crm_FunT", dadosFuncionario.crm_FunT);
                cmd.Parameters.AddWithValue("@nome_FunT", dadosFuncionario.nome_FunT);
                cmd.Parameters.AddWithValue("@endereco_FunT", dadosFuncionario.endereco_FunT);
                cmd.Parameters.AddWithValue("@uf_FunT", dadosFuncionario.uf_FunT);
                cmd.Parameters.AddWithValue("@municipio_FunT", dadosFuncionario.municipio_FunT);
                cmd.Parameters.AddWithValue("@telefone1_FunT", dadosFuncionario.telefone1_FunT);
                cmd.Parameters.AddWithValue("@telefone2_FunT", dadosFuncionario.telefone2_FunT);
                cmd.Parameters.AddWithValue("@email_FunT", dadosFuncionario.email_FunT);
                cmd.Parameters.AddWithValue("@cpf_FunT", dadosFuncionario.cpf_FunT);
                cmd.Parameters.AddWithValue("@rg_FunT", dadosFuncionario.rg_FunT);
                cmd.Parameters.AddWithValue("@login_Funcionario", dadosFuncionario.login_funcionario);
                cmd.Parameters.AddWithValue("@senha_Funcionario", dadosFuncionario.senha_funcionario);

                //Abrindo a conexão 
                conexao.Open();

                //Usado para CRUD, insert, delete, update
                cmd.ExecuteNonQuery();

                //Fechando a conexão
                conexao.Close();
            }

            catch (Exception exception)
            {
                throw new Exception(exception.Message);
            }

        }

        //Exclusão do Funcionário
        public void DeletaFuncionario(FuncionarioTriagem dadosFuncionario)
        {

            try
            {
                //Criando um objeto para ser usado como conexão do banco, passando a string de conexão por parâmetro
                conexao = new SqlConnection(conexao_sql);
                //Criando o objeto "sql" do tipo SqlComand para receber um comando sql
                SqlCommand cmd = new SqlCommand("uspDeletarFuncionario", conexao);
                //está informando ao .NET os parametros que serão consultados acima
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                //Passando o ID do Funcionário que será excluído
                cmd.Parameters.AddWithValue("@crm_FunT", dadosFuncionario.crm_FunT);

                //Abrindo a conexão 
                conexao.Open();

                //Usado para CRUD, insert, delete, update
                cmd.ExecuteNonQuery();

                //Fechando a conexão
                conexao.Close();

            }

            catch (Exception erro)
            {

                throw new Exception(erro.Message);
            }

        }

        //Método que criei para listar os Funcionários
        public DataTable lista_Funcionarios()
        {

            try
            {
                //Criando um objeto para ser usado como conexão do banco, passando a string de conexão por parâmetro
                conexao = new SqlConnection(conexao_sql);
                //Criando o objeto "sql" do tipo SqlComand para receber um comando sql
                SqlCommand sql = new SqlCommand("uspConsultarTodosFuncionariosParaGridView", conexao);
                //Criando um adaptador 
                SqlDataAdapter daEspecialista = new SqlDataAdapter();
                //Esse adaptador, converterá o comando acima(sql), para uma linguagem que o .NET entenda
                daEspecialista.SelectCommand = sql;
                //Instanciando um objeto da classe DataTable
                DataTable dtEspecialista = new DataTable();
                //Esse objeto receberá os dados acima filtrando o seu conteudo já adaptado
                daEspecialista.Fill(dtEspecialista);
                // Retornando o datatable para o método
                return dtEspecialista;
            }
            catch (Exception exception)
            {
                throw new Exception(exception.Message);
            }

        }
        /*Fim Funcionário*/

        /*Inicio Medicamentos*/

        //Inserir Medicamentos
        public void inserirMedicamento(Medicamentos dadosMedicamentos)
        {

            try
            {
                //Criando um objeto para ser usado como conexão do banco, passando a string de conexão por parâmetro
                conexao = new SqlConnection(conexao_sql);
                //Criando o objeto "sql" do tipo SqlComand para receber um comando sql
                SqlCommand cmd = new SqlCommand("uspInserirMedicamento", conexao);

                //está informando ao .NET os parametros que serão consultados acima
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                //Adicionando os parâmetros da procedure através das caixas de texto
                cmd.Parameters.AddWithValue("@nome_Med", dadosMedicamentos.nome_Med);
                cmd.Parameters.AddWithValue("@tipo_Med", dadosMedicamentos.tipo_Med);
                cmd.Parameters.AddWithValue("@descricao_Med", dadosMedicamentos.descricao_Med);

                //Abrindo a conexão 
                conexao.Open();

                //Usado para CRUD, insert, delete, update
                cmd.ExecuteNonQuery();

                //Fechando a conexão
                conexao.Close();
            }

            catch (Exception exception)
            {
                throw new Exception(exception.Message);
            }

        }

        //Alterar Medicamento
        public void AlterarMedicamento(Medicamentos dadosMedicamento)
        {

            try
            {
                //Criando um objeto para ser usado como conexão do banco, passando a string de conexão por parâmetro
                conexao = new SqlConnection(conexao_sql);
                //Criando o objeto "sql" do tipo SqlComand para receber um comando sql
                SqlCommand cmd = new SqlCommand("uspAtualizarMedicamento", conexao);

                //está informando ao .NET os parametros que serão consultados acima
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                //Adicionando os parâmetros da procedure através das caixas de texto
                cmd.Parameters.AddWithValue("@idMedicamentos", dadosMedicamento.Id);
                cmd.Parameters.AddWithValue("@nome_Med", dadosMedicamento.nome_Med);
                cmd.Parameters.AddWithValue("@tipo_Med", dadosMedicamento.tipo_Med);
                cmd.Parameters.AddWithValue("@descricao_Med", dadosMedicamento.descricao_Med);
            
                //Abrindo a conexão 
                conexao.Open();

                //Usado para CRUD, insert, delete, update
                cmd.ExecuteNonQuery();

                //Fechando a conexão
                conexao.Close();
            }

            catch (Exception exception)
            {
                throw new Exception(exception.Message);
            }

        }


        //Exclusão do Medicamento
        public void DeletaMedicamento(Medicamentos dadosMedicamentos)
        {

            try
            {
                //Criando um objeto para ser usado como conexão do banco, passando a string de conexão por parâmetro
                conexao = new SqlConnection(conexao_sql);
                //Criando o objeto "sql" do tipo SqlComand para receber um comando sql
                SqlCommand cmd = new SqlCommand("uspDeletarMedicamentos", conexao);
                //está informando ao .NET os parametros que serão consultados acima
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                //Passando o ID do Funcionário que será excluído
                cmd.Parameters.AddWithValue("@idMedicamentos", dadosMedicamentos.Id);

                //Abrindo a conexão 
                conexao.Open();

                //Usado para CRUD, insert, delete, update
                cmd.ExecuteNonQuery();

                //Fechando a conexão
                conexao.Close();

            }

            catch (Exception erro)
            {

                throw new Exception(erro.Message);
            }

        }

       // Lista Todos Os Medicamentos
        public DataTable lista_Medicamentos()
        {

            try
            {
                //Criando um objeto para ser usado como conexão do banco, passando a string de conexão por parâmetro
                conexao = new SqlConnection(conexao_sql);
                //Criando o objeto "sql" do tipo SqlComand para receber um comando sql
                SqlCommand sql = new SqlCommand("uspConsultarTodosMedicamentosParaGridView", conexao);
                //Criando um adaptador 
                SqlDataAdapter daEspecialista = new SqlDataAdapter();
                //Esse adaptador, converterá o comando acima(sql), para uma linguagem que o .NET entenda
                daEspecialista.SelectCommand = sql;
                //Instanciando um objeto da classe DataTable
                DataTable dtEspecialista = new DataTable();
                //Esse objeto receberá os dados acima filtrando o seu conteudo já adaptado
                daEspecialista.Fill(dtEspecialista);
                // Retornando o datatable para o método
                return dtEspecialista;
            }
            catch (Exception exception)
            {
                throw new Exception(exception.Message);
            }

        }

        public DataTable RelatorioTriagem(Triagem retorno)
        {
            try
            {
                //Criando um objeto para ser usado como conexão do banco, passando a string de conexão por parâmetro
                conexao = new SqlConnection(conexao_sql);
                //Criando o objeto "sql" do tipo SqlComand para receber um comando sql
                SqlCommand sql = new SqlCommand("uspConsultarTriagemPorData", conexao);

                sql.CommandType = System.Data.CommandType.StoredProcedure;
               

                sql.Parameters.AddWithValue("@data_Tri",retorno.data_Tri);
                //Criando um adaptador 
                SqlDataAdapter daTriagem = new SqlDataAdapter();
                //Esse adaptador, converterá o comando acima(sql), para uma linguagem que o .NET entenda
                daTriagem.SelectCommand = sql;
                //Instanciando um objeto da classe DataTable
                DataTable dtTriagem = new DataTable();
                //Esse objeto receberá os dados acima filtrando o seu conteudo já adaptado
                daTriagem.Fill(dtTriagem);
                // Retornando o datatable para o método
                return dtTriagem;

            }
            catch (Exception Error)
            {
                throw new Exception(Error.Message);
            }
        }

        public String RelatorioTriQuantPaci()
        {
            try
            {
                Triagem tri = new Triagem();
                //Criando um objeto para ser usado como conexão do banco, passando a string de conexão por parâmetro
                conexao = new SqlConnection(conexao_sql);
                //Criando o objeto "sql" do tipo SqlComand para receber um comando sql
                SqlCommand sql = new SqlCommand("uspConsultarQuantPacientePorData", conexao);

                sql.CommandType = System.Data.CommandType.StoredProcedure;

                string total;
                sql.Parameters.AddWithValue("@total",tri.data_Tri);
                total = Convert.ToString(tri);
                return total;
            }
            catch (Exception Error)
            {
                throw new Exception(Error.Message);
            }
        }


        public DataTable ConsultarTriagemPorNumero(Triagem retorno)
        {
            try
            {
                //Criando um objeto para ser usado como conexão do banco, passando a string de conexão por parâmetro
                conexao = new SqlConnection(conexao_sql);
                //Criando o objeto "sql" do tipo SqlComand para receber um comando sql
                SqlCommand sql = new SqlCommand("uspConsultarTriagemPorNumeroTri", conexao);

                sql.CommandType = System.Data.CommandType.StoredProcedure;


                sql.Parameters.AddWithValue("@idTriagem", retorno.Id);
                //Criando um adaptador 
                SqlDataAdapter daTriagem = new SqlDataAdapter();
                //Esse adaptador, converterá o comando acima(sql), para uma linguagem que o .NET entenda
                daTriagem.SelectCommand = sql;
                //Instanciando um objeto da classe DataTable
                DataTable dtTriagem = new DataTable();
                //Esse objeto receberá os dados acima filtrando o seu conteudo já adaptado
                daTriagem.Fill(dtTriagem);
                // Retornando o datatable para o método
                return dtTriagem;

            }
            catch (Exception Error)
            {
                throw new Exception(Error.Message);
            }
        }
    }
}