inherited ovF_PsqPessoas: TovF_PsqPessoas
  Left = 508
  Top = 299
  Width = 939
  Height = 377
  Caption = 'Pesquisa de pessoas'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 10
    Top = 8
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object Label2: TLabel [1]
    Left = 10
    Top = 29
    Width = 28
    Height = 13
    Caption = 'Nome'
  end
  inherited Panel1: TPanel
    Left = 783
    Height = 338
  end
  inherited ovDBG_Pesquisa: TDBGrid
    Top = 48
    Width = 779
    Height = 290
    Columns = <
      item
        Expanded = False
        FieldName = 'Cli_Codigo'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pes_Nome'
        Title.Caption = 'Nome'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pes_CPFCNPJ'
        Title.Caption = 'CPF'
        Visible = True
      end>
  end
  object ovCE_Codigo: TRxCalcEdit [4]
    Left = 125
    Top = 4
    Width = 121
    Height = 21
    AutoSize = False
    NumGlyphs = 2
    TabOrder = 2
  end
  object ovE_Nome: TEdit [5]
    Left = 125
    Top = 26
    Width = 316
    Height = 21
    TabOrder = 3
  end
  inherited oCDS_Pesquisa: TClientDataSet
    object oCDS_PesquisaPes_Codigo: TIntegerField
      FieldName = 'Pes_Codigo'
    end
    object oCDS_PesquisaCli_Codigo: TIntegerField
      FieldName = 'Cli_Codigo'
    end
    object oCDS_PesquisaPes_Nome: TStringField
      FieldName = 'Pes_Nome'
      Size = 100
    end
    object oCDS_PesquisaPes_CPFCNPJ: TStringField
      FieldName = 'Pes_CPFCNPJ'
      Size = 14
    end
  end
end
