inherited ovF_PsqDependentes: TovF_PsqDependentes
  Top = 282
  Height = 533
  Caption = 'Pesquisa de dependentes'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 16
    Top = 6
    Width = 57
    Height = 13
    Caption = 'Nome aluno'
  end
  inherited Panel1: TPanel
    Height = 494
  end
  inherited ovDBG_Pesquisa: TDBGrid
    Top = 40
    Height = 454
    Columns = <
      item
        Expanded = False
        FieldName = 'Dep_Codigo'
        Title.Caption = 'C'#243'digo aluno'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Dependente'
        Width = 379
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cli_Codigo'
        Title.Caption = 'C'#243'digo responsavel'
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Responsavel'
        Title.Caption = 'Respons'#225'vel'
        Width = 494
        Visible = True
      end>
  end
  object ovE_DepNome: TEdit [3]
    Left = 88
    Top = 1
    Width = 569
    Height = 21
    TabOrder = 2
  end
  inherited oCDS_Pesquisa: TClientDataSet
    object oCDS_PesquisaCli_Codigo: TIntegerField
      FieldName = 'Cli_Codigo'
    end
    object oCDS_PesquisaResponsavel: TStringField
      FieldName = 'Responsavel'
      Size = 100
    end
    object oCDS_PesquisaDep_Codigo: TIntegerField
      FieldName = 'Dep_Codigo'
    end
    object oCDS_PesquisaDependente: TStringField
      FieldName = 'Dependente'
      Size = 100
    end
  end
end
