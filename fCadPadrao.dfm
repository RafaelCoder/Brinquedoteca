object ovF_CadPadrao: TovF_CadPadrao
  Left = 418
  Top = 309
  BorderStyle = bsSingle
  Caption = 'ovF_CadPadrao'
  ClientHeight = 542
  ClientWidth = 607
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 506
    Top = 0
    Width = 101
    Height = 542
    Align = alRight
    TabOrder = 0
    object ovB_Confirmar: TButton
      Left = 0
      Top = 0
      Width = 100
      Height = 25
      Caption = '&Confirmar'
      TabOrder = 0
      OnClick = ovB_ConfirmarClick
    end
    object ovB_Cancelar: TButton
      Left = 0
      Top = 25
      Width = 100
      Height = 25
      Caption = 'C&ancelar'
      TabOrder = 1
      OnClick = ovB_CancelarClick
    end
    object Button1: TButton
      Left = 0
      Top = 50
      Width = 100
      Height = 25
      Caption = '&Pesquisar'
      TabOrder = 2
    end
    object ovB_Sair: TButton
      Left = 0
      Top = 75
      Width = 100
      Height = 25
      Caption = '&Sair'
      TabOrder = 3
      OnClick = ovB_SairClick
    end
  end
  object ovP_Container: TPanel
    Left = 0
    Top = 0
    Width = 506
    Height = 542
    Align = alClient
    TabOrder = 1
  end
end
