inherited ovF_CadPessoas: TovF_CadPessoas
  Left = 428
  Top = 225
  Caption = 'Alunos'
  ClientHeight = 160
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl1: TPanel
    Height = 160
  end
  inherited ovP_Container: TPanel
    Height = 160
    object ovP_Aluno: TPanel
      Left = 1
      Top = 43
      Width = 504
      Height = 21
      Align = alTop
      TabOrder = 1
      object Label3: TLabel
        Left = 10
        Top = 2
        Width = 62
        Height = 13
        Caption = 'Respons'#225'vel'
      end
      object ovE_Responsavel: TEdit
        Left = 125
        Top = 0
        Width = 375
        Height = 21
        TabOrder = 0
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 504
      Height = 42
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 10
        Top = 7
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
      end
      object Label2: TLabel
        Left = 10
        Top = 24
        Width = 28
        Height = 13
        Caption = 'Nome'
      end
      object ovCE_Codigo: TRxCalcEdit
        Left = 125
        Top = 5
        Width = 121
        Height = 21
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0'
        ButtonWidth = 0
        NumGlyphs = 2
        TabOrder = 0
      end
      object ovE_Nome: TEdit
        Left = 125
        Top = 22
        Width = 375
        Height = 21
        TabOrder = 1
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 64
      Width = 504
      Height = 95
      Align = alTop
      TabOrder = 2
      object Label4: TLabel
        Left = 10
        Top = 2
        Width = 77
        Height = 13
        Caption = 'DDD / Telefone'
      end
      object Label5: TLabel
        Left = 248
        Top = 2
        Width = 67
        Height = 13
        Caption = 'DDD / Celular'
      end
      object Label6: TLabel
        Left = 10
        Top = 24
        Width = 95
        Height = 13
        Caption = 'Data de nascimento'
      end
      object Label7: TLabel
        Left = 256
        Top = 24
        Width = 20
        Height = 13
        Caption = 'CPF'
      end
      object ovCE_DDDFone: TRxCalcEdit
        Left = 125
        Top = 0
        Width = 30
        Height = 21
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0'
        ButtonWidth = 0
        NumGlyphs = 2
        TabOrder = 0
      end
      object ovCE_Fone: TRxCalcEdit
        Left = 160
        Top = 0
        Width = 80
        Height = 21
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0'
        ButtonWidth = 0
        MaxLength = 9
        MaxValue = 999999999.000000000000000000
        NumGlyphs = 2
        TabOrder = 1
      end
      object ovCE_DDDCel: TRxCalcEdit
        Left = 328
        Top = 0
        Width = 30
        Height = 21
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0'
        ButtonWidth = 0
        NumGlyphs = 2
        TabOrder = 2
      end
      object ovCE_Celular: TRxCalcEdit
        Left = 363
        Top = 0
        Width = 80
        Height = 21
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0'
        ButtonWidth = 0
        MaxValue = 999999999.000000000000000000
        NumGlyphs = 2
        TabOrder = 3
      end
      object ovDE_Nascimento: TDateEdit
        Left = 125
        Top = 21
        Width = 116
        Height = 21
        NumGlyphs = 2
        TabOrder = 4
      end
      object ovME_CPF: TMaskEdit
        Left = 286
        Top = 21
        Width = 116
        Height = 21
        EditMask = '999\.999\.999\-99;0; '
        MaxLength = 14
        TabOrder = 5
      end
    end
  end
end
