object ControllerPessoas: TControllerPessoas
  OldCreateOrder = False
  Left = 345
  Top = 299
  Height = 154
  Width = 236
  object oCDS_Pessoa: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 56
    Top = 32
    object oCDS_PessoaCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object oCDS_PessoaNome: TStringField
      FieldName = 'Nome'
      Size = 100
    end
    object oCDS_PessoaCPFCNPJ: TStringField
      FieldName = 'CPFCNPJ'
      Size = 14
    end
    object oCDS_PessoaDDDCel: TIntegerField
      FieldName = 'DDDCel'
    end
    object oCDS_PessoaCelular: TIntegerField
      FieldName = 'Celular'
    end
    object oCDS_PessoaDDDFone: TIntegerField
      FieldName = 'DDDFone'
    end
    object oCDS_PessoaFone: TIntegerField
      FieldName = 'Fone'
    end
    object oCDS_PessoaDataNascimento: TDateField
      FieldName = 'DataNascimento'
    end
    object oCDS_PessoaNumEndereco: TStringField
      FieldName = 'NumEndereco'
      Size = 10
    end
    object oCDS_PessoaEndereco: TStringField
      FieldName = 'Endereco'
      Size = 100
    end
  end
end
