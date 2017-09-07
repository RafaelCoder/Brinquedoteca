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
    FOREIGN KEY Pes_Codigo REFERENCES Pessoas(Pes_Codigo)
);

CREATE TABLE Alunos(
    Pes_Codigo INTEGER,
    Alu_Codigo INTEGER,
    Alu_Responsavel VARCHAR(100),
    PRIMARY KEY (Alu_Codigo),
    FOREIGN KEY Pes_Codigo REFERENCES Pessoas(Pes_Codigo)
);


