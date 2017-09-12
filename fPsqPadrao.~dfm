object ovF_PsqPadrao: TovF_PsqPadrao
  Left = 265
  Top = 136
  Width = 1277
  Height = 679
  Caption = 'ovF_PsqPadrao'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PrintScale = poNone
  OnCreate = FormCreate
  DesignSize = (
    1261
    640)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 1121
    Top = 0
    Width = 140
    Height = 640
    Align = alRight
    TabOrder = 0
    object ovB_Atualizar: TButton
      Left = 2
      Top = 5
      Width = 135
      Height = 25
      Caption = 'A&tualizar'
      TabOrder = 0
      OnClick = ovB_AtualizarClick
    end
    object ovB_Confirmar: TButton
      Left = 2
      Top = 30
      Width = 135
      Height = 25
      Caption = '&Confirmar'
      ModalResult = 1
      TabOrder = 1
    end
    object ovB_Voltar: TButton
      Left = 2
      Top = 55
      Width = 135
      Height = 25
      Caption = '&Voltar'
      ModalResult = 2
      TabOrder = 2
    end
  end
  object ovDBG_Pesquisa: TDBGrid
    Left = 0
    Top = 176
    Width = 1117
    Height = 464
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = oDS_Pesquisa
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = ovDBG_PesquisaDblClick
  end
  object oCDS_Pesquisa: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 40
    Top = 416
  end
  object oDS_Pesquisa: TDataSource
    DataSet = oCDS_Pesquisa
    Left = 8
    Top = 416
  end
end
