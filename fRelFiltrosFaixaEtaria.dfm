inherited ovF_RelFiltrosFaixaEtaria: TovF_RelFiltrosFaixaEtaria
  Height = 128
  Caption = 'Relat'#243'rio de faixa et'#225'ria'
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Height = 89
    object Label1: TLabel
      Left = 10
      Top = 5
      Width = 14
      Height = 13
      Caption = 'De'
    end
    object Label2: TLabel
      Left = 168
      Top = 5
      Width = 16
      Height = 13
      Caption = 'At'#233
    end
    object ovDE_De: TDateEdit
      Left = 32
      Top = 0
      Width = 121
      Height = 21
      NumGlyphs = 2
      TabOrder = 0
    end
    object ovDE_Ate: TDateEdit
      Left = 195
      Top = 1
      Width = 121
      Height = 21
      NumGlyphs = 2
      TabOrder = 1
    end
  end
  inherited Panel2: TPanel
    Height = 89
    inherited ovB_Sair: TButton
      OnClick = ovB_SairClick
    end
  end
end
