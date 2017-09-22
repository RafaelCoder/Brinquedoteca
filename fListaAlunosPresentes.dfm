object ovF_ListaAlunosPresentes: TovF_ListaAlunosPresentes
  Left = 265
  Top = 136
  Width = 1305
  Height = 675
  Caption = 'ovF_ListaAlunosPresentes'
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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 1160
    Top = 0
    Width = 129
    Height = 636
    Align = alRight
    Caption = 'Panel1'
    TabOrder = 0
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
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
  end
  object oCDS_Alunos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 616
    Top = 216
  end
  object oDS_Alunos: TDataSource
    DataSet = oCDS_Alunos
    Left = 440
    Top = 160
  end
end
