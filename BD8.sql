DROP DATABASE IF EXISTS BD8;
CREATE DATABASE BD8;

USE BD8;
  
CREATE TABLE AREA (
	ID int(4) NOT NULL auto_increment,
	Nome varchar(20) NOT NULL,
    primary key(ID)
);

insert into AREA values
	(1,'Estrutura'),
    (2,'Academica'),
    (3, 'Administrativa'),
    (4,'Financeira');
    
CREATE TABLE USUARIO (
  ID int(4) NOT NULL auto_increment,
  Nome varchar(30) NOT NULL,
  Senha varchar(20) NOT NULL,
  Login varchar(10) NULL,
  Nivel int(1) NOT NULL,
  Avaliador_Area int(4) NULL,
  FOREIGN KEY (Avaliador_Area) REFERENCES AREA(ID),
  PRIMARY KEY (ID)
  );

 CREATE TABLE POST (
	ID int(4) NOT NULL auto_increment,
    Titulo varchar(20) NOT NULL,
    Conteudo varchar(200) NOT NULL,
    Resposta varchar(200) NULL,
    Area_Post int(4) NOT NULL,
    ID_Criador int(4) NULL,
    ID_Avaliador int(4) NULL,
    Aceite int NULL,
    FOREIGN KEY (Area_post) REFERENCES AREA(ID),
    FOREIGN KEY (ID_Criador) REFERENCES USUARIO(ID),
    FOREIGN KEY (ID_Avaliador) REFERENCES USUARIO(ID),
    PRIMARY KEY(ID)
    
  );
  
  insert into USUARIO values
	(1, 'Usuario Padrao','1234','usu',1,null),
    (2, 'Avaliador','1234','ava',2,3);
  
   insert into POST values
	(1000,'Atletica','Deveriam haver mais esportes.','Estamos trabalhando nisso, ano que vem já entraram mais. Obrigado pela sugestão.',1,1, NULL,1);
  
 select  count(ID)  from POST where Aceite=1;
  
  select * from POST;
  
  select * from USUARIO;
  