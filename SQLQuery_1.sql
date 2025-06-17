CREATE DATABASE ESCOLA;
use ESCOLA;

Create table ALUNO(
id_aluno int not null primary key identity,
nome varchar(100) not null,
dt_nasc date,
email varchar (100) unique,
telefone varchar (15)
);

Create table Curso (
id_curso int primary key identity,
nome varchar (100) not null,
carga_horaria int,
descricao text
);

Create table Matricula (
id_matricula int primary key identity,
id_aluno int references ALUNO,
id_curso int references Curso,
data_matricula date default cast(getdate() as date)
);

alter table ALUNO add endereco varchar (255);
Alter table ALUNO alter column telefone varchar (20);
alter table ALUNO drop column email;
alter table Curso add constrait chk_carga_horaria check(carga_horaria>10);



