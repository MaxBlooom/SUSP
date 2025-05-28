
GO
CREATE DATABASE TCM;

GO
USE TCM;

GO 
CREATE TABLE tblEspecialidade(
idEspecialidade INT PRIMARY KEY IDENTITY(1,1),
nome_Esp VARCHAR(20),
tipo_Esp VARCHAR(20),
descricao_Esp VARCHAR(200)
);


GO
CREATE TABLE tblEspecialista(
crm_Espm INT PRIMARY KEY,
nome_Espm VARCHAR(30),
endereco_Espm VARCHAR(50),
uf_Espm CHAR(2),
municipio_Espm VARCHAR(20),
telefone1_Espm VARCHAR(20),
telefone2_Espm VARCHAR(20),
email_Espm VARCHAR(50),
cpf_Espm VARCHAR(15),
rg_Espm VARCHAR(15)
);

/*ALTER TABLE tblEspecialista ALTER COLUMN telefone1_Espm VARCHAR(20);*/
/*ALTER TABLE tblEspecialista ALTER COLUMN telefone2_Espm VARCHAR(20);*/

GO
CREATE TABLE tblEspecialista_has_Especialidade(
FK_Especialista_crm_EspM INT FOREIGN KEY REFERENCES tblEspecialista(crm_EspM),
FK_Especialidade_idEspecialidade INT FOREIGN KEY REFERENCES tblEspecialidade(idEspecialidade)

);

GO 
CREATE TABLE tblMedicamentos(
idMedicamentos INT PRIMARY KEY IDENTITY(1,1),
nome_Med VARCHAR(20),
tipo_Med VARCHAR(20),
descricao_Med VARCHAR(200));

GO 
CREATE TABLE tblDiagnosticoFinal(
idDiagnostico_Final INT PRIMARY KEY IDENTITY(1,1),
prescicaoMedica_DiagFinal VARCHAR(500),
FK_Medicamentos_idMedicamento INT FOREIGN KEY REFERENCES tblMedicamentos(idMedicamentos));


GO 
CREATE TABLE tblPaciente(
idPaciente INT PRIMARY KEY IDENTITY(1,1),
nome_Pac VARCHAR(30),
enderecio_Pac VARCHAR(50),
dtNascimento datetime,
numeTelefone_Pac VARCHAR(20),
numTelefoneFamiliar_Pac VARCHAR(20),
nomeMae_Pac VARCHAR(30),
uf_Pac CHAR(2),
municipio_Pac VARCHAR(20),
login_paciente VARCHAR(100),
senha_paciente VARCHAR(100));

/*ALTER TABLE tblPaciente ALTER COLUMN numeTelefone_Pac VARCHAR(20);*/
/*ALTER TABLE tblPaciente ALTER COLUMN numTelefoneFamiliar_Pac VARCHAR(20);*/

GO
CREATE TABLE tblFuncionarioTriagem(
crm_FunT INT PRIMARY KEY,
nome_FunT VARCHAR(30),
endereco_FunT VARCHAR(50),
uf_FunT CHAR(2),
municipio_FunT VARCHAR(20),
telefone1_FunT VARCHAR(20),
telefone2_FunT VARCHAR(20),
email_FunT VARCHAR(50),
cpf_FunT VARCHAR(15),
rg_FunT VARCHAR(15),
login_funcionario VARCHAR(100),
senha_funcionario VARCHAR(100));

GO
CREATE TABLE tblSintomas(
idSintomas INT PRIMARY KEY IDENTITY(1,1),
nome_Sin VARCHAR(30),
descricao_Sin VARCHAR(200));

GO
CREATE TABLE tblDoencaPossivel(
idDoencasPossiveis INT PRIMARY KEY IDENTITY(1,1),
nome_Doe VARCHAR(30),
descricao_Doe VARCHAR(200),
FK_Sintomas_idSintomas INT FOREIGN KEY REFERENCES tblSintomas(idSintomas));

GO
CREATE TABLE tblDoenca_Possivel_has_Sintomas(
FK_Doenca_Possivel_idDoencasPossiveis INT FOREIGN KEY REFERENCES tblDoencaPossivel(idDoencasPossiveis),
FK_SINTOMAS_idSintomas INT FOREIGN KEY REFERENCES tblSintomas(idSintomas)
);
GO
CREATE TABLE tblTriagem(
idTriagem INT PRIMARY KEY IDENTITY (1,1),
data_Tri DATETIME,
FK_FUNCIONARIO_TRIAGEM_crm_FunT INT FOREIGN KEY REFERENCES tblFuncionarioTriagem(crm_FunT),
FK_Paciente_idPaciente INT FOREIGN KEY REFERENCES tblPaciente(idPaciente),
FK_Especialista_crm_EspM INT FOREIGN KEY REFERENCES tblEspecialista(crm_EspM),
FK_DiagnosticoFinal_idDiagnostico_Final INT FOREIGN KEY REFERENCES tblDiagnosticoFinal(idDiagnostico_Final));

GO 
CREATE TABLE tblDoenca_Possivel_has_Triagem(
FK_Doenca_Possivel_idDoencasPossiveis INT FOREIGN KEY REFERENCES tblDoencaPossivel(idDoencasPossiveis),
FK_Triagem_idTriagem INT FOREIGN KEY REFERENCES tblTriagem(idTriagem)
 );

 /*VIEWS*/
 GO
 CREATE VIEW uvwVisualizarTriagem
 AS
	SELECT 		
		tblTriagem.idTriagem,
	    tblFuncionarioTriagem.nome_FunT,
		tblFuncionarioTriagem.crm_FunT ,
		tblFuncionarioTriagem.cpf_FunT,
		tblFuncionarioTriagem.rg_FunT,
		tblPaciente.nome_Pac,
		tblPaciente.nomeMae_Pac,
		tblPaciente.numTelefoneFamiliar_Pac,
		tblEspecialista.crm_Espm,
		tblEspecialista.nome_Espm,
		tblDiagnosticoFinal.prescicaoMedica_DiagFinal,
		tblTriagem.data_Tri
		FROM
		tblTriagem INNER JOIN tblFuncionarioTriagem ON tblTriagem.FK_FUNCIONARIO_TRIAGEM_crm_FunT = tblFuncionarioTriagem.crm_FunT
		INNER JOIN tblPaciente ON tblTriagem.FK_Paciente_idPaciente = tblPaciente.idPaciente INNER JOIN tblEspecialista ON tblTriagem.FK_Especialista_crm_EspM = tblEspecialista.crm_Espm
		LEFT JOIN tblDiagnosticoFinal ON tblTriagem.FK_DiagnosticoFinal_idDiagnostico_Final = tblDiagnosticoFinal.idDiagnostico_Final
		
		
 /*PROCEDURES*/
 GO
 CREATE PROCEDURE uspInserirPaciente
@nome_Pac VARCHAR(30),
@enderecio_Pac VARCHAR(50),
@dtNascimento DATE,
@numeTelefone_Pac VARCHAR(20),
@numTelefoneFamiliar_Pac VARCHAR(20),
@nomeMae_Pac VARCHAR(30),
@uf_Pac CHAR(2),
@municipio_Pac VARCHAR(20),
@login_paciente VARCHAR(50),
@senha_paciente VARCHAR(100)
 AS
 BEGIN
 INSERT INTO tblPaciente
 VALUES(@nome_Pac,@enderecio_Pac,@dtNascimento,@numeTelefone_Pac,@numTelefoneFamiliar_Pac,@nomeMae_Pac,@uf_Pac,@municipio_Pac,@login_paciente,@senha_paciente)
 END

 /*EXEC uspInserirPaciente 'Cesar Vinicius Pereira Casali','Rua Aparecida do Taboado','20/04/1999','39724065','34254232','Mãe casali','SP','São Paulo','maxa7x','123321'
 select*from tblPaciente
 */
 
 /*CRIAÇÃO DE PROCEDURES DE INSERÇÃO*/

 GO
 CREATE PROCEDURE uspInserirMedicamento
 @nome_Med VARCHAR(20),
 @tipo_Med VARCHAR(20),
 @descricao_Med VARCHAR(200)=null
 AS
	BEGIN
	INSERT INTO tblMedicamentos
	VALUES(@nome_Med,@tipo_Med,@descricao_Med)

 END

 /*
 EXEC uspInserirMedicamento 'Paracetamol','Dores musculares','substância (C8H9NO2) us. na fabricação de corantes, em fotografia e em medicina, esp. como analgésico e antipirético.'

SELECT * FROM tblMedicamentos
 */

 GO
 CREATE PROCEDURE uspInserirDiagnosticoFinal
 @prescicaoMedica_DiagFinal VARCHAR(500),
 @FK_Medicamentos_idMedicamento INT = null
 AS
	BEGIN
	INSERT INTO tblDiagnosticoFinal
	VALUES(@prescicaoMedica_DiagFinal,@FK_Medicamentos_idMedicamento)
END

/*
EXEC uspInserirDiagnosticoFinal 'O paciente possui dengue e deverá ficar ao leito por 78 horas antes de ir para sua casa',1

SELECT * FROM tblDiagnosticoFinal
*/

GO
CREATE PROCEDURE uspInserirEspecialidade
@nome_Esp VARCHAR(20),
@tipo_Esp VARCHAR(20),
@descricao_Esp VARCHAR(200)
AS

	BEGIN
	 INSERT INTO tblEspecialidade
	 VALUES(@nome_Esp,@tipo_Esp,@descricao_Esp)
END

/*
EXEC uspInserirEspecialidade 'Cirurgia no umbigo','Cirurgião Geral','Atualmente o Cirurgião Geral é aquele habilitado e treinado para resolução das afecções cirúrgicas mais comuns.'

SELECT * FROM tblEspecialidade
*/

GO
CREATE PROCEDURE uspInserirEspecialista
@crm_Espm INT,
@nome_Espm VARCHAR(30),
@endereco_Espm VARCHAR(50),
@uf_Espm CHAR(2),
@municipio_Espm VARCHAR(20),
@telefone1_Espm VARCHAR(20),
@telefone2_Espm VARCHAR(20),
@email_Espm VARCHAR(50),
@cpf_Espm VARCHAR(15),
@rg_Espm VARCHAR(15)
AS

	BEGIN
	INSERT INTO tblEspecialista
	VALUES(@crm_Espm,@nome_Espm,@endereco_Espm,@uf_Espm,@municipio_Espm,@telefone1_Espm,@telefone2_Espm,@email_Espm,@cpf_Espm,@rg_Espm)

END




/*
EXEC uspInserirEspecialista '7283','José Fernando','Rua dos Maximbaus','sp','sao paulo','123123','1231231','Jose@gmail.com','3123123','33332323'

SELECT * FROM tblEspecialista
*/
GO 
CREATE PROCEDURE uspInserirEspecialista_has_Especialidade
@FK_Especialista_crm_EspM INT,
@FK_Especialidade_idEspecialidade INT
AS
	BEGIN
	INSERT INTO tblEspecialista_has_Especialidade
	VALUES(@FK_Especialista_crm_EspM,@FK_Especialidade_idEspecialidade)

END
/*
EXEC uspInserirEspecialista_has_Especialidade 7283,1

SELECT * FROM tblEspecialista_has_Especialidade
*/

GO
CREATE PROCEDURE uspInserirFuncionario
@crm_FunT INT,
@nome_FunT VARCHAR(30),
@endereco_FunT VARCHAR(50),
@uf_FunT CHAR(2),
@municipio_FunT VARCHAR(20),
@telefone1_FunT VARCHAR(20),
@telefone2_FunT VARCHAR(20),
@email_FunT VARCHAR(50),
@cpf_FunT VARCHAR(15),
@rg_FunT VARCHAR(15),
@login_Funcionario VARCHAR(50),
@senha_Funcionario VARCHAR(100)

AS 

	BEGIN
	INSERT INTO tblFuncionarioTriagem
	VALUES(@crm_FunT,@nome_FunT,@endereco_FunT,@uf_FunT,@municipio_FunT,@telefone1_FunT,@telefone2_FunT,@email_FunT,@cpf_FunT,@rg_FunT,@login_Funcionario,@senha_Funcionario)
	

END

/*
EXEC uspInserirFuncionario '7282','Maxsuel Alves','Rua José Francsico','sp','sao paulo','123123','1231231','dsadsada','3123123','32323','nil','sousa'

SELECT * FROM tblFuncionarioTriagem
*/


GO
CREATE PROCEDURE uspInserirSintomas
@nome_Sin VARCHAR(30),
@descricao_Sin VARCHAR(200)
AS

	BEGIN
	INSERT INTO tblSintomas
	VALUES(@nome_Sin,@descricao_Sin)

END

/*
EXEC uspInserirSintomas 'Dengue','Febre'

SELECT *FROM tblSintomas
*/

GO
CREATE PROCEDURE uspInserirTriagem
@data_Tri DATE,
@FK_FUNCIONARIO_TRIAGEM_crm_FunT INT,
@FK_Paciente_idPaciente INT,
@FK_Especialista_crm_EspM INT,
@FK_DiagnosticoFinal_idDiagnostico_Final INT = null

AS
	BEGIN
	INSERT INTO tblTriagem
	VALUES(@data_Tri,@FK_FUNCIONARIO_TRIAGEM_crm_FunT,@FK_Paciente_idPaciente,@FK_Especialista_crm_EspM,@FK_DiagnosticoFinal_idDiagnostico_Final)


END
/*
EXEC uspInserirTriagem '09/09/1999',7282,1,7283,null
EXEC uspInserirTriagem '09/09/1999',7282,1,7283,1

select * from tblTriagem
*/
GO
CREATE PROCEDURE uspInserirDoencaPossivel
@nome_Doe VARCHAR(30),
@descricao_Doe VARCHAR(200),
@FK_Sintomas_idSintomas INT
AS
	BEGIN
	INSERT INTO tblDoencaPossivel
	VALUES(@nome_Doe,@descricao_Doe,@FK_Sintomas_idSintomas)


END
/*
EXEC uspInserirDoencaPossivel 'Resfriado','Tosse forte e mal estar pode ser ocasionado por essa doença',1
select* from tblDoencaPossivel
 */
GO
CREATE PROCEDURE uspInserirDoenca_Possivel_has_Sintomas
@FK_Doenca_Possivel_idDoencasPossiveis INT,
@FK_SINTOMAS_idSintomas INT
AS
	BEGIN
	INSERT INTO tblDoenca_Possivel_has_Sintomas
	VALUES(@FK_Doenca_Possivel_idDoencasPossiveis,@FK_SINTOMAS_idSintomas)
END
/*
EXEC uspInserirDoenca_Possivel_has_Sintomas 1,1
select*from tblDoenca_Possivel_has_Sintomas
*/
/*PROCEDURES DE UPDATE*/





GO
CREATE PROCEDURE uspInserirDoenca_Possivel_has_triagem
@FK_Doenca_Possivel_idDoencasPossiveis INT,
@FK_Triagem_idTriagem INT
AS
	BEGIN
	INSERT INTO tblDoenca_Possivel_has_Triagem
	VALUES(@FK_Doenca_Possivel_idDoencasPossiveis,@FK_Triagem_idTriagem)

END

GO
CREATE PROCEDURE uspAtualizarPaciente
@idPaciente INT,
@nome_Pac VARCHAR(30),
@enderecio_Pac VARCHAR(50),
@dtNascimento DATE,
@numeTelefone_Pac VARCHAR(20),
@numTelefoneFamiliar_Pac VARCHAR(20),
@nomeMae_Pac VARCHAR(30),
@uf_Pac CHAR(2),
@municipio_Pac VARCHAR(20),
@login_Paciente VARCHAR(50),
@senha_Paciente VARCHAR(50)

AS
BEGIN
UPDATE tblPaciente
SET nome_Pac = @nome_Pac,
enderecio_Pac = @enderecio_Pac,
dtNascimento = @dtNascimento,
numeTelefone_Pac =@numeTelefone_Pac,
numTelefoneFamiliar_Pac =@numTelefoneFamiliar_Pac,
nomeMae_Pac =@nomeMae_Pac,
uf_Pac = @uf_Pac,
municipio_Pac=@municipio_Pac,
login_paciente = @login_Paciente,
senha_paciente = @senha_Paciente
WHERE idPaciente = @idPaciente

END

/*EXEC uspAtualizarPaciente 1,'Joaquim','Rua Silvestre','03/04/1999','92838485','878654324','Damiana','SP','São Paulo','maluco','201617'
select * from tblPaciente
*/
GO
CREATE PROCEDURE uspAtualizarMedicamento
@idMedicamentos INT,
@nome_Med VARCHAR(20),
@tipo_Med VARCHAR(20),
@descricao_Med VARCHAR(200)
AS
	BEGIN
	UPDATE tblMedicamentos
	SET	
	nome_Med = @nome_Med,
	tipo_Med = @tipo_Med,
	descricao_Med = @descricao_Med
	WHERE idMedicamentos = @idMedicamentos

END


GO
CREATE PROCEDURE uspAtualizarDiagnosticoFinal
@idDiagnostico_Final INT,
@prescicaoMedica_DiagFinal VARCHAR(500),
@FK_Medicamentos_idMedicamento INT
AS
BEGIN

	UPDATE tblDiagnosticoFinal
	SET prescicaoMedica_DiagFinal=@prescicaoMedica_DiagFinal,
	FK_Medicamentos_idMedicamento=@FK_Medicamentos_idMedicamento
	WHERE idDiagnostico_Final = @idDiagnostico_Final

END

GO
CREATE PROCEDURE uspAtualizarFuncionarioTrigem
@crm_FunT INT,
@nome_FunT VARCHAR(30),
@endereco_FunT VARCHAR(50),
@uf_FunT CHAR(2),
@municipio_FunT VARCHAR(20),
@telefone1_FunT VARCHAR(20),
@telefone2_FunT VARCHAR(20),
@email_FunT VARCHAR(50),
@cpf_FunT VARCHAR(15),
@rg_FunT VARCHAR(15),
@login_Funcionario VARCHAR(50),
@senha_Funcionario VARCHAR(50)
AS

BEGIN
	UPDATE tblFuncionarioTriagem
		SET	
		nome_FunT=@nome_FunT,
		endereco_FunT = @endereco_FunT,
		uf_FunT =@uf_FunT,
		municipio_FunT =@municipio_FunT,
		telefone1_FunT = @telefone1_FunT,
		telefone2_FunT = @telefone2_FunT,
		email_FunT =@email_FunT,
		cpf_FunT =@cpf_FunT,
		rg_FunT =@rg_FunT,
		login_funcionario = @login_Funcionario,
		senha_funcionario = @senha_Funcionario

	WHERE crm_FunT = @crm_FunT
END


GO
CREATE PROCEDURE uspAtualizarSintomas
@idSintomas INT,
@nome_Sin VARCHAR(30),
@descricao_Sin VARCHAR(200)
AS
BEGIN
	UPDATE tblSintomas
	SET
	nome_Sin = @nome_Sin,
	descricao_Sin=@descricao_Sin
	WHERE idSintomas = @idSintomas

END



GO
CREATE PROCEDURE uspAtualizarTriagem
@idTriagem INT ,
@data_Tri DATE,
@FK_FUNCIONARIO_TRIAGEM_crm_FunT INT,
@FK_Paciente_idPaciente INT,
@FK_Especialista_crm_EspM INT,
@FK_DiagnosticoFinal_idDiagnostico_Final INT 
AS
	BEGIN
	UPDATE tblTriagem
	SET data_Tri = @data_Tri,
	FK_FUNCIONARIO_TRIAGEM_crm_FunT = @FK_FUNCIONARIO_TRIAGEM_crm_FunT,
	FK_Paciente_idPaciente = @FK_Paciente_idPaciente,
	FK_Especialista_crm_EspM = @FK_Especialista_crm_EspM,
	FK_DiagnosticoFinal_idDiagnostico_Final=@FK_DiagnosticoFinal_idDiagnostico_Final
	WHERE idTriagem = @idTriagem

END

/*
EXEC uspAlterarTriagem 3,'09/09/1999',7283,1,7283

select * from tblTriagem
select * from tblFuncionarioTriagem
select*from tblEspecialista
*/


GO 
CREATE PROCEDURE uspAtualizarEspecialista_has_Especialidade
@FK_Especialista_crm_EspM INT,
@FK_Especialidade_idEspecialidade INT
AS
	BEGIN
	UPDATE tblEspecialista_has_Especialidade
	SET @FK_Especialista_crm_EspM = @FK_Especialista_crm_EspM,
		@FK_Especialidade_idEspecialidade = @FK_Especialidade_idEspecialidade
		END

		/*
	EXEC uspAtualizarEspecialista_has_Especialidade 7283,1

		select * from tblEspecialista_has_Especialidade
		*/




GO
CREATE PROCEDURE uspAtualizarEspecialista
@crm_Espm INT,
@nome_Espm VARCHAR(30),
@endereco_Espm VARCHAR(50),
@uf_Espm CHAR(2),
@municipio_Espm VARCHAR(20),
@telefone1_Espm VARCHAR(20),
@telefone2_Espm VARCHAR(20),
@email_Espm VARCHAR(50),
@cpf_Espm VARCHAR(15),
@rg_Espm VARCHAR(15)
AS
	BEGIN
	UPDATE tblEspecialista
	SET nome_Espm=@nome_Espm,
		endereco_Espm=@endereco_Espm,
		uf_Espm=@uf_Espm,
		municipio_Espm=@municipio_Espm,
		telefone1_Espm=@telefone1_Espm,
		telefone2_Espm=@telefone2_Espm,
		email_Espm=@email_Espm,
		cpf_Espm=@cpf_Espm,
		rg_Espm=@rg_Espm
		WHERE crm_Espm = @crm_Espm
END

/*
EXEC uspAtualizarEspecialista '7283','dsad','asdsad','sp','Rio','123123','1231231','dsadsada','3123123','32323'
select * from tblEspecialista
*/

GO 
CREATE PROCEDURE uspAtualizarEspecialidade
@idEspecialidade INT,
@nome_Esp VARCHAR(20),
@tipo_Esp VARCHAR(20),
@descricao_Esp VARCHAR(200)

AS
	BEGIN
	UPDATE tblEspecialidade
	SET nome_Esp= @nome_Esp,
		tipo_Esp=@tipo_Esp,
		descricao_Esp=@descricao_Esp 
	WHERE idEspecialidade = @idEspecialidade
END
/*
EXEC uspAtualizarEspecialidade 1,'Cirurgia no Peito','Cirurgião Geral','Atualmente o Cirurgião Geral é aquele habilitado e treinado para resolução das afecções cirúrgicas mais comuns.'

SELECT * FROM tblEspecialidade
*/

GO
CREATE PROCEDURE uspAtualizarDoencaPossivel
@idDoencasPossiveis INT,
@nome_Doe VARCHAR(30),
@descricao_Doe VARCHAR(200),
@FK_Sintomas_idSintomas INT
AS
	BEGIN
	UPDATE tblDoencaPossivel
	SET
	nome_Doe=@nome_Doe,
	descricao_Doe=@descricao_Doe,
	FK_Sintomas_idSintomas = @FK_Sintomas_idSintomas
	WHERE idDoencasPossiveis = @idDoencasPossiveis
END

/*
EXEC uspAtualizarDoencaPossivel 1,'Dengue','Doença causada por mosquito',1

SELECT * FROM tblDoencaPossivel

*/

GO 
CREATE PROCEDURE uspAtualizarDoenca_Possivel_has_Sintomas
@FK_Doenca_Possivel_idDoencasPossiveis INT,
@FK_SINTOMAS_idSintomas INT
AS
	BEGIN
	UPDATE tblDoenca_Possivel_has_Sintomas
	SET FK_SINTOMAS_idSintomas=@FK_SINTOMAS_idSintomas
		WHERE FK_Doenca_Possivel_idDoencasPossiveis = @FK_Doenca_Possivel_idDoencasPossiveis
END

EXEC uspAtualizarDoenca_Possivel_has_Sintomas 1,2

SELECT * FROM tblDoencaPossivel

INSERT INTO tblSintomas
VALUES('asdsad','asdasd')

GO 
CREATE PROCEDURE uspAtualizarDoenca_Possivel_has_Trigem
@FK_Doenca_Possivel_idDoencasPossiveis INT,
@FK_Triagem_idTriagem INT
AS
	BEGIN
	UPDATE tblDoenca_Possivel_has_Triagem
	SET FK_Doenca_Possivel_idDoencasPossiveis=@FK_Doenca_Possivel_idDoencasPossiveis,
		FK_Triagem_idTriagem=@FK_Triagem_idTriagem

END

/*Procedures de delete*/
GO
CREATE PROCEDURE uspDeletarEspecialidade
@idEspecialidade INT
AS
BEGIN
DELETE tblEspecialidade WHERE idEspecialidade = @idEspecialidade
END
/*

EXEC uspDeletarEspecialidade 1

*/
GO
CREATE PROCEDURE uspDeletarEspecialista
@crm_Espm INT
AS
BEGIN
DELETE tblEspecialista WHERE crm_Espm = @crm_Espm
END

/*EXEC uspDeletarEspecialista 1*/

GO
CREATE PROCEDURE uspDeletarMedicamentos
@idMedicamentos INT

AS
BEGIN

DELETE tblMedicamentos WHERE idMedicamentos = @idMedicamentos
END

/*EXEC uspDeletarMedicamentos 1*/
GO
CREATE PROCEDURE uspDeletarDiagFinal
@idDiagnostico_Final INT
AS
BEGIN
DELETE tblDiagnosticoFinal WHERE idDiagnostico_Final = @idDiagnostico_Final
END

GO
CREATE PROCEDURE uspDeletarPaciente
@idPaciente INT

AS
BEGIN
DELETE tblPaciente WHERE idPaciente = @idPaciente
END

GO
CREATE PROCEDURE uspDeletarFuncionario
@crm_FunT INT 
AS
BEGIN
DELETE tblFuncionarioTriagem WHERE crm_FunT = @crm_FunT
END
GO 
CREATE PROCEDURE uspDeletarDoencaPossivel
@idDoencasPossiveis INT

AS
BEGIN
DELETE tblDoencaPossivel WHERE idDoencasPossiveis = @idDoencasPossiveis
END

GO
CREATE PROCEDURE uspDeletarTriagem 
@idTriagem INT
AS
BEGIN
DELETE tblTriagem WHERE idTriagem = @idTriagem
END

/*EXEC uspDeletar Triagem 1*/

/*PROCEDURES DE CONSULTA*/
GO
CREATE PROCEDURE uspConsultarPacientePorNome
@nome_Pac VARCHAR(30)
AS
	BEGIN
	SELECT * FROM tblPaciente WHERE nome_Pac LIKE '%' + @nome_Pac +'%' 
END

/*
EXEC uspConsultarPacientePorNome 'jo'
*/


GO
CREATE PROCEDURE uspConsultarEspecialistaPorNome
@nome_Espm VARCHAR(30)
AS
	BEGIN
	SELECT * FROM tblEspecialista WHERE nome_Espm LIKE '%' + @nome_Espm +'%' 
END

/*EXEC uspConsultarEspecialistaPorNome 'maria'*/ 

/*Todos os Pacientes para Grid*/
GO
CREATE PROCEDURE uspConsultarTodosPacienteParaGridView
AS BEGIN

	SELECT
		idPaciente as 'ID',
		nome_Pac as 'Nome',
		enderecio_Pac as 'Endereço',
		numeTelefone_Pac as 'Telefone',
		uf_Pac as 'UF',
		municipio_Pac  as 'Municipio'
			
		FROM
			tblPaciente
END

/*EXEC uspConsultarTodosPacienteParaGridView;*/

select*from tblPaciente 
/*Todos os Especialistas para Grid*/
GO
CREATE PROCEDURE uspConsultarTodosEspecialistasParaGridView
AS BEGIN

	SELECT
		crm_Espm as 'CRM',
		nome_Espm as 'Nome',
		endereco_Espm as 'Endereço',
		uf_Espm as 'UF',
		telefone1_Espm as 'Telefone',
		email_Espm as 'E-mail',
		cpf_Espm  as 'CPF'
			
		FROM
			tblEspecialista
END
/*EXEC uspConsultarTodosEspecialistasParaGridView;*/ 

/*Todos os Funcionários para GridView*/
GO
ALTER PROCEDURE uspConsultarTodosFuncionariosParaGridView
AS BEGIN

	SELECT
		crm_FunT as 'CRM',
		nome_FunT as 'Nome',
		endereco_FunT as 'Endereço',
		uf_FunT as 'UF',
		telefone1_FunT as 'Telefone',
		email_FunT as 'E-mail',
		cpf_FunT  as 'CPF'
			
		FROM
			tblFuncionarioTriagem
END

/*EXEC uspConsultarTodosFuncionariosParaGridView;*/ 

GO
CREATE PROCEDURE uspConsultarSintomas
AS
	BEGIN
	SELECT * FROM tblSintomas


END

/*
EXEC uspConsultarSintomas
*/


GO
CREATE PROCEDURE uspConsultarTodosMedicamentos
AS
	BEGIN 

	SELECT * FROM tblMedicamentos
END

/*
EXEC uspConsultarTodosMedicamentos
*/

GO
CREATE PROCEDURE uspConsultarMedicamentoPorNome
@nome_Med VARCHAR(20)
AS
	BEGIN
	SELECT * FROM tblMedicamentos WHERE nome_Med LIKE '%'+@nome_Med+'%'
END

/*
EXEC uspConsultarMedicamentoPorNome 'Para'
*/

GO
CREATE PROCEDURE uspConsultarFuncionarioPorNome
@nome_FunT VARCHAR(30)
AS
	BEGIN
	SELECT * FROM tblFuncionarioTriagem WHERE nome_FunT LIKE '%'+@nome_FunT+'%'
END

/*
EXEC uspConsultarFuncionarioPorNome 'Jo'
*/

GO 

GO
CREATE PROCEDURE uspConsultarDoencaPossivelComSintomas2
@idDoencasPossiveis INT
AS
	BEGIN
	SELECT tblDoencaPossivel.nome_Doe AS 'Nome',
		   tblDoencaPossivel.descricao_Doe AS 'Descrição',
		   tblSintomas.nome_Sin AS 'Nome do Sintoma',
		   tblSintomas.descricao_Sin AS 'Descrição do Sintoma'
	FROM
	tblDoenca_Possivel_has_Sintomas INNER JOIN tblDoencaPossivel ON tblDoenca_Possivel_has_Sintomas.FK_Doenca_Possivel_idDoencasPossiveis = tblDoencaPossivel.idDoencasPossiveis
	LEFT JOIN tblSintomas ON tblDoenca_Possivel_has_Sintomas.FK_SINTOMAS_idSintomas = tblSintomas.idSintomas
	WHERE idDoencasPossiveis = @idDoencasPossiveis
END

/*
EXEC uspConsultarDoencaPossivelComSintomas2 2
*/
GO 
CREATE PROCEDURE uspConsultarEspecialistaComEspecialidade
@idEspecialista INT 
AS
	BEGIN
	SELECT tblEspecialista.nome_Espm AS 'Nome',
		   tblEspecialista.cpf_Espm AS 'CPF',
		   tblEspecialista.rg_Espm AS 'RG',
		   tblEspecialista.email_Espm AS 'E-MAIL',
		   tblEspecialista.endereco_Espm AS 'Endereço',
		   tblEspecialista.municipio_Espm AS 'Municipio',
		   tblEspecialista.uf_Espm AS 'UF',
		   tblEspecialista.telefone1_Espm AS 'Telefone',
		   tblEspecialidade.nome_Esp AS 'Especialidade',
		   tblEspecialidade.descricao_Esp AS 'Descrição'
	FROM
	tblEspecialista_has_Especialidade INNER JOIN tblEspecialista ON tblEspecialista_has_Especialidade.FK_Especialista_crm_EspM = tblEspecialista.crm_Espm
	INNER JOIN tblEspecialidade ON tblEspecialista_has_Especialidade.FK_Especialidade_idEspecialidade = tblEspecialidade.idEspecialidade
		WHERE crm_Espm = @idEspecialista
END

/*
EXEC uspConsultarEspecialistaComEspecialidade 7283
EXEC uspConsultarEspecialistaComEspecialidade 54364
*/

GO
CREATE PROCEDURE uspConsultarTriagem
@idTriagem INT,
@nome_Pac VARCHAR(30)
AS
BEGIN
IF(@idTriagem IS NOT NULL)
BEGIN
SELECT	
		nome_FunT AS 'NOME FUNCIONÁRIO',
		crm_FunT AS 'CRM FUNCIONÁRIO',
		cpf_FunT AS 'CPF',
		rg_FunT AS 'RG',
		nome_Pac AS 'NOME PACIENTE',
		nomeMae_Pac AS 'NOME DA MÃE',
		numTelefoneFamiliar_Pac AS 'TELEFONE FAMILIAR',
		crm_Espm AS 'CRM DO ESPECIALISTA',
		nome_Espm AS 'NOME ESPECIALISTA',
		prescicaoMedica_DiagFinal AS 'PRESCRIÇÃO MÉDICA',
		data_Tri AS 'DATA DA TRIAGEM'
		FROM uvwVisualizarTriagem WHERE idTriagem = @idTriagem
		END
		ELSE IF(@nome_Pac IS NOT NULL)
		BEGIN
		SELECT 
		nome_FunT AS 'NOME FUNCIONÁRIO',
		crm_FunT AS 'CRM FUNCIONÁRIO',
		cpf_FunT AS 'CPF',
		rg_FunT AS 'RG',
		nome_Pac AS 'NOME PACIENTE',
		nomeMae_Pac AS 'NOME DA MÃE',
		numTelefoneFamiliar_Pac AS 'TELEFONE FAMILIAR',
		crm_Espm AS 'CRM DO ESPECIALISTA',
		nome_Espm AS 'NOME ESPECIALISTA',
		prescicaoMedica_DiagFinal AS 'PRESCRIÇÃO MÉDICA',
		data_Tri AS 'DATA DA TRIAGEM'
		FROM uvwVisualizarTriagem WHERE (nome_Pac like '%' +  @nome_Pac + '%');
		END
		
END
select * from tblTriagem

EXEC uspConsultarTriagem 4,null
SELECT * from tblTriagem

/*PROCEDURE PARA BUSCAR QUANTOS PACIENTES PASSARAM PELA TRIAGEM CONFORME A DATA INFORMADA*/
GO 
ALTER PROCEDURE uspConsultarTriagemPorData
@data_Tri DATE = NULL
AS
BEGIN	
		IF (@data_Tri IS NOT NULL)
		BEGIN
			SELECT 
			tblTriagem.data_Tri,
			tblPaciente.idPaciente,
			tblPaciente.nome_Pac,
			tblPaciente.nomeMae_Pac,
			tblPaciente.enderecio_Pac
			FROM tblTriagem FULL OUTER JOIN tblPaciente ON tblTriagem.FK_Paciente_idPaciente = tblPaciente.idPaciente
			WHERE CONVERT(DATE,data_Tri,101)  =@data_Tri
		END

END

 EXEC uspConsultarTriagemPorData '09/09/1999'
select * from tblTriagem

/*
GO 
CREATE PROCEDURE uspConsultarQuantPacientePorData
@data_Tri DATE = NULL
AS
BEGIN	
DECLARE @total	FLOAT
		IF (@data_Tri IS NOT NULL)
		BEGIN
			SELECT @total=
			COUNT(*)
			FROM tblTriagem 
			WHERE CONVERT(DATE,data_Tri,101)  =@data_Tri
			PRINT 'O total de usuários atendidos no mês informado é de:'+STR(@total)
		END

END
*/


GO 
CREATE PROCEDURE uspConsultarQuantPacientePorData
@data_Tri INT = NULL
AS
BEGIN	
DECLARE @total	FLOAT
		IF (@data_Tri IS NOT NULL)
		BEGIN
			SELECT /*@total=*/
			COUNT(data_Tri)
			FROM tblTriagem 
			WHERE MONTH(data_Tri)  =@data_Tri
			/*PRINT 'O total de usuários atendidos no mês informado é de:'+STR(@total)*/
		END

END
exec uspConsultarQuantPacientePorData 09

SELECT * FROM tblTriagem

GO
CREATE PROCEDURE uspConsultarAllTriagem
AS
SELECT	
		nome_Pac AS 'NOME PACIENTE',
		crm_Espm AS 'CRM DO ESPECIALISTA',
		nome_Espm AS 'NOME ESPECIALISTA',
		prescicaoMedica_DiagFinal AS 'PRESCRIÇÃO MÉDICA',
		data_Tri AS 'DATA DA TRIAGEM'
		FROM uvwVisualizarTriagem


--VALIDAÇÃO DO FUNCIONÁRIO PARA LOGIN 
GO
CREATE PROCEDURE uspValidarLoginFuncionario(
	@login_funcionario AS VARCHAR(100),
	@senha_funcionario AS VARCHAR(100))
AS
BEGIN
	BEGIN TRY
		SELECT 
			login_funcionario,  
			senha_funcionario
		
		FROM 
			tblFuncionarioTriagem
		WHERE 
			login_funcionario = @login_funcionario 
			AND 
			PWDCOMPARE(@senha_funcionario, senha_funcionario ) = 1;
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE() AS Retorno
	END CATCH
END

--VALIDAÇÃO DE PACIENTE PARA LOGIN 

GO
CREATE PROCEDURE uspValidarLoginPaciente(
	@login_paciente AS VARCHAR(100),
	@senha_paciente AS VARCHAR(100))
AS
BEGIN
	BEGIN TRY
		SELECT 
			login_paciente,  
			senha_paciente
		
		FROM 
			tblPaciente
		WHERE 
			login_paciente = @login_paciente 
			AND 
			PWDCOMPARE(@senha_paciente, senha_paciente ) = 1;
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE() AS Retorno
	END CATCH
END



/*Consultas*/
/*Paciente por nome para Grid*/
GO
CREATE PROCEDURE uspConsultarPacientePorNomeParaGridView
@nome_Pac VARCHAR(50)
AS BEGIN

	SELECT
		idPaciente as 'ID',
		nome_Pac as 'Nome',
		enderecio_Pac as 'Endereço',
		dtNascimento as 'DT de Nascimento',
		numeTelefone_Pac as 'Telefone',
		uf_Pac as 'UF',
		municipio_Pac as 'Municipio'
			
		FROM
			tblPaciente

			WHERE (nome_Pac like '%'+ @nome_Pac+'%');	
END

/*EXEC uspConsultarPacientePorNomeParaGridView 'nil';*/


/*select * from tblPaciente*/

/*Funcionário por nome para Grid*/
GO
CREATE PROCEDURE uspConsultarPacientePorNomeParaGridView
@nome_Pac VARCHAR(50)
AS BEGIN

	SELECT
		idPaciente as 'ID',
		nome_Pac as 'Nome',
		enderecio_Pac as 'Endereço',
		dtNascimento as 'DT de Nascimento',
		numeTelefone_Pac as 'Telefone',
		uf_Pac as 'UF',
		municipio_Pac as 'Municipio'
			
		FROM
			tblPaciente

			WHERE (nome_Pac like '%'+ @nome_Pac+'%');	
END