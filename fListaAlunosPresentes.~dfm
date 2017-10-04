object ovF_ListaAlunosPresentes: TovF_ListaAlunosPresentes
  Left = 265
  Top = 136
  Width = 1305
  Height = 675
  BorderIcons = [biMaximize]
  Caption = 'Alunos presentes'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 1160
    Top = 0
    Width = 129
    Height = 636
    Align = alRight
    TabOrder = 0
    object ovB_Atualizar: TButton
      Left = 0
      Top = 0
      Width = 128
      Height = 30
      Caption = 'A&tualizar'
      TabOrder = 0
      OnClick = ovB_AtualizarClick
    end
    object ovB_Sair: TButton
      Left = 0
      Top = 32
      Width = 128
      Height = 30
      Caption = '&Sair'
      ModalResult = 2
      TabOrder = 1
      OnClick = ovB_SairClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 1160
    Height = 636
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 1
    object RxDBGrid1: TRxDBGrid
      Left = 1
      Top = 1
      Width = 1158
      Height = 634
      Align = alClient
      DataSource = oDS_Alunos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Consolas'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'Dependente'
          Width = 366
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Responsavel'
          Title.Caption = 'Respons'#225'vel'
          Width = 419
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Lan_DataHoraEnt'
          Title.Caption = 'Hora entrada'
          Width = 349
          Visible = True
        end>
    end
  end
  object oCDS_Alunos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 616
    Top = 216
    object oCDS_AlunosLan_Codigo: TIntegerField
      FieldName = 'Lan_Codigo'
    end
    object oCDS_AlunosDep_Codigo: TIntegerField
      FieldName = 'Dep_Codigo'
    end
    object oCDS_AlunosCli_Codigo: TIntegerField
      FieldName = 'Cli_Codigo'
    end
    object oCDS_AlunosDependente: TStringField
      FieldName = 'Dependente'
      Size = 100
    end
    object oCDS_AlunosResponsavel: TStringField
      FieldName = 'Responsavel'
      Size = 100
    end
    object oCDS_AlunosLan_DataHoraEnt: TDateTimeField
      FieldName = 'Lan_DataHoraEnt'
    end
  end
  object oDS_Alunos: TDataSource
    DataSet = oCDS_Alunos
    Left = 448
    Top = 248
  end
end
