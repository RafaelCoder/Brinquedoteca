object ovF_RelFiltrosPadrao: TovF_RelFiltrosPadrao
  Left = 560
  Top = 170
  Width = 534
  Height = 506
  BorderIcons = [biSystemMenu]
  Caption = 'ovF_RelFiltrosPadrao'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PrintScale = poNone
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 416
    Height = 467
    Align = alClient
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 416
    Top = 0
    Width = 102
    Height = 467
    Align = alRight
    TabOrder = 1
    object ovP_Imprimir: TButton
      Left = 1
      Top = 0
      Width = 100
      Height = 25
      Caption = '&Imprimir'
      TabOrder = 0
      OnClick = ovP_ImprimirClick
    end
    object ovB_Cancelar: TButton
      Left = 1
      Top = 25
      Width = 100
      Height = 25
      Caption = 'C&ancelar'
      TabOrder = 1
      OnClick = ovB_CancelarClick
    end
    object ovB_Sair: TButton
      Left = 1
      Top = 50
      Width = 100
      Height = 25
      Caption = '&Sair'
      TabOrder = 2
    end
  end
end
