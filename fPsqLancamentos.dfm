inherited ovF_PsqLancamentos: TovF_PsqLancamentos
  Width = 1327
  Caption = 'Pesquisa de lan'#231'amentos'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 104
    Top = 55
    Width = 14
    Height = 13
    Caption = 'De'
  end
  object Label2: TLabel [1]
    Left = 224
    Top = 52
    Width = 16
    Height = 13
    Caption = 'At'#233
  end
  inherited Panel1: TPanel
    Left = 1171
  end
  inherited ovDBG_Pesquisa: TDBGrid
    Top = 72
    Width = 1167
    Height = 568
    Columns = <
      item
        Expanded = False
        FieldName = 'Lan_Codigo'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Dependente'
        Width = 331
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Responsavel'
        Title.Caption = 'Respons'#225'vel'
        Width = 283
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Lan_Data'
        Title.Caption = 'Data'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Lan_DataHoraEnt'
        Title.Caption = 'Hora entrada'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Lan_DataHoraSai'
        Title.Caption = 'Hora sa'#237'da'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Lan_TotalHoras'
        Title.Caption = 'Total horas'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Lan_Fechado'
        Title.Caption = 'Fechado'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Lan_VlrHora'
        Title.Caption = 'Valor hora'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Lan_VlrTotal'
        Title.Caption = 'Valor total'
        Visible = True
      end>
  end
  inline ovFra_Dependentes1: TovFra_Dependentes [4]
    Left = 0
    Top = 0
    Width = 475
    Height = 43
    TabOrder = 2
  end
  object ovDE_De: TDateEdit [5]
    Left = 124
    Top = 49
    Width = 96
    Height = 21
    NumGlyphs = 2
    TabOrder = 3
  end
  object ovDE_Ate: TDateEdit [6]
    Left = 246
    Top = 48
    Width = 96
    Height = 21
    NumGlyphs = 2
    TabOrder = 4
  end
  object ovCB_Fechados: TCheckBox [7]
    Left = 344
    Top = 49
    Width = 193
    Height = 17
    Caption = 'Somento lan'#231'amentos fechados'
    TabOrder = 5
  end
  inherited oCDS_Pesquisa: TClientDataSet [8]
    object oCDS_PesquisaLan_Codigo: TIntegerField
      FieldName = 'Lan_Codigo'
    end
    object oCDS_PesquisaDep_Codigo: TIntegerField
      FieldName = 'Dep_Codigo'
    end
    object oCDS_PesquisaCli_Codigo: TIntegerField
      FieldName = 'Cli_Codigo'
    end
    object oCDS_PesquisaDependente: TStringField
      FieldName = 'Dependente'
      Size = 100
    end
    object oCDS_PesquisaResponsavel: TStringField
      FieldName = 'Responsavel'
      Size = 100
    end
    object oCDS_PesquisaLan_Data: TDateField
      FieldName = 'Lan_Data'
    end
    object oCDS_PesquisaLan_DataHoraEnt: TDateTimeField
      FieldName = 'Lan_DataHoraEnt'
    end
    object oCDS_PesquisaLan_DataHoraSai: TDateTimeField
      FieldName = 'Lan_DataHoraSai'
    end
    object oCDS_PesquisaLan_Fechado: TStringField
      FieldName = 'Lan_Fechado'
      Size = 3
    end
    object oCDS_PesquisaLan_VlrHora: TFloatField
      FieldName = 'Lan_VlrHora'
    end
    object oCDS_PesquisaLan_VlrTotal: TFloatField
      FieldName = 'Lan_VlrTotal'
    end
    object oCDS_PesquisaLan_TotalHoras: TDateTimeField
      FieldName = 'Lan_TotalHoras'
    end
  end
end
