-- DROP TABLE PESSOAS;
CREATE TABLE Pessoas(
    Pes_Codigo INTEGER,
    Pes_Nome VARCHAR(100),
    Pes_CPFCNPJ CHAR(14),
    Pes_DDDCel INTEGER,
    Pes_Celular CHAR(9),
    Pes_DDDFone INTEGER,
    Pes_Fone CHAR(9),
    Pes_DataNascimento DATE,
    Pes_NumEndereco INTEGER,
    Pes_Endereco VARCHAR(100),
    PRIMARY KEY (Pes_Codigo)
);

CREATE TABLE Clientes(
    Pes_Codigo INTEGER,
    Cli_Codigo INTEGER,
    PRIMARY KEY (Cli_Codigo),
    FOREIGN KEY (Pes_Codigo) REFERENCES Pessoas(Pes_Codigo)
);

CREATE TABLE Dependentes(
    Pes_Codigo INTEGER,
    Dep_Codigo INTEGER,
    Cli_Codigo INTEGER,
    PRIMARY KEY (Cli_Codigo, Dep_Codigo),
    FOREIGN KEY (Pes_Codigo) REFERENCES Pessoas(Pes_Codigo),
    FOREIGN KEY (Cli_Codigo) REFERENCES Clientes(Cli_Codigo)
);


CREATE TABLE Lancamentos(
    Lan_Codigo INTEGER,
    Cli_Codigo INTEGER,
    Dep_Codigo INTEGER,
    Lan_DataHoraEnt DATETIME,
    Lan_DataHoraSai DATETIME,
    Lan_Fechado CHAR(1), -- S/N
    Lan_VlrHora DOUBLE,    
    Lan_VlrTotal DOUBLE,
    PRIMARY KEY (Lan_Codigo),
    FOREIGN KEY (Cli_Codigo, Dep_Codigo) REFERENCES Dependentes(Cli_Codigo, Dep_Codigo)
);

CREATE TABLE Fechamentos(
    Fec_Codigo INTEGER,
    Lan_Codigo INTEGER,
    Fec_VlrHora DOUBLE,
    Fec_VlrDesc DOUBLE,
    Fec_VlrTotal DOUBLE,
    PRIMARY KEY (Fec_Codigo),
    FOREIGN KEY (Lan_Codigo) REFERENCES Lancamentos(Lan_Codigo)
);


CREATE TABLE TitulosReceber(
    Tit_Titulo INTEGER,
    Tit_Parcela INTEGER,
    Cli_Codigo INTEGER,
    Tit_VlrTitulo DOUBLE,
    Tit_Saldo DOUBLE,
    PRIMARY KEY (Tit_Titulo, Tit_Parcela),
    FOREIGN KEY (Cli_Codigo) REFERENCES Clientes(Cli_Codigo)
);

CREATE TABLE Fechamentos_Titulos(
    Fec_Codigo INTEGER,
    Tit_Titulo INTEGER,
    Tit_Parcela INTEGER,
);