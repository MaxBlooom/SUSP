# SUSP
Sistema Unificado de Saúde Particular

Objetivo do projeto acadêmico SUSP:

O objetivo do sistema SUSP é simplificar o uso e acesso ao sistema de saúde
publico do país, sistema esse conhecido como SUS (Sistema Único de Saúde).
Nesse sistema o paciente que utiliza o SUS, poderia fazer um pré-triagem
(Triagem não oficial, feita por ele mesmo) no sistema, reservar uma senha e ao
chegar na unidade ter a senha efetivada através de um validador, passar pela
triagem feita por um funcionário licenciado, e por fim com o médico de plantão
na unidade.


O Sistema SUSP é autossuficiente, pois não possui nenhum vínculo com outros
sistemas majoritários. Sua finalidade é auxiliar no processo de atendimento de uma
UBS para ter o propósito de otimizar fazendo o processo ficar mais rápido e melhor
servindo a comunidade que utiliza a UBS.
Necessidades Funcionalidades Correspondentes

1 Manter paciente 1.1 – Cadastrar Usuário;
– Consultar Usuário;
– Consultar IdUsuário;
– Editar Usuário;
– Desativar Usuário.
2 Manter especialista 1.1 – Cadastrar Especialista;
– Consultar Especialista;
– Consultar IdEspecialista;
– Editar Especialista;
– Desativar Especialista.

3 Emitir Relatórios 3.1 – Emitir Relatório Gráfico do Fluxo;
– Emitir Relatório Analítico do Fluxo.

4 Utilizar Fluxo 5.1 – Gerar um fluxo;
– Editar um fluxo;
– Desativar um fluxo;
– Utilizar um fluxo criado no sistema.

5 Manter Triagem 5.1 Cadastrar Triagem;
– Consultar Triagem;
– Consultar IdTriagem;
– Editar Triagem;
5.2 – Desativar Triagem;
6 Manter funcionário 6.1 – Cadastrar funcionário;
– Consultar funcionário;
– Consultar Idfuncionário;
– Editar funcionário;
– Desativar funcionário.

4.2 Premissas e Dependências
 Para o funcionamento do Sistema SUSP, alguns recursos são imprescindíveis:

 As máquinas clientes deverão possuir instalado um browser e ter acesso à
rede.
 A máquina servidora web deverá suportar o servidor de aplicações IIS
Windows Server 2012 R2.
 A máquina servidora do banco de dados deverá suportar o banco de dados
SQL Server 2012 R2.
