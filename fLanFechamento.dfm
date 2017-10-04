inherited ovF_LanFechamento: TovF_LanFechamento
  Caption = 'Fechamento'
  ClientHeight = 152
  ClientWidth = 576
  OldCreateOrder = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl1: TPanel
    Left = 475
    Height = 152
    inherited ovB_Pesquisar: TButton
      Top = 100
      Visible = False
    end
    inherited ovB_Sair: TButton
      Top = 50
    end
    inherited ovB_Excluir: TButton
      Top = 75
      Visible = False
    end
  end
  inherited ovP_Container: TPanel
    Width = 475
    Height = 152
    inline ovFra_Lancamentos1: TovFra_Lancamentos
      Left = 0
      Top = 0
      Width = 475
      Height = 22
      TabOrder = 0
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 37
      Width = 470
      Height = 48
      Caption = 'Tempo total'
      TabOrder = 2
      object Label1: TLabel
        Left = 10
        Top = 20
        Width = 63
        Height = 13
        Caption = 'Hora Entrada'
      end
      object Label2: TLabel
        Left = 155
        Top = 20
        Width = 53
        Height = 13
        Caption = 'Hora sa'#237'da'
      end
      object Label3: TLabel
        Left = 296
        Top = 20
        Width = 24
        Height = 13
        Caption = 'Total'
      end
      object DateTimePicker1: TDateTimePicker
        Left = 80
        Top = 15
        Width = 70
        Height = 21
        Date = 43012.000000000000000000
        Time = 43012.000000000000000000
        Kind = dtkTime
        TabOrder = 0
      end
      object DateTimePicker2: TDateTimePicker
        Left = 215
        Top = 15
        Width = 70
        Height = 21
        Date = 43012.000000000000000000
        Time = 43012.000000000000000000
        Kind = dtkTime
        TabOrder = 1
      end
      object DateTimePicker3: TDateTimePicker
        Left = 328
        Top = 14
        Width = 70
        Height = 21
        Date = 43012.000000000000000000
        Time = 43012.000000000000000000
        Kind = dtkTime
        TabOrder = 2
      end
    end
    object GroupBox2: TGroupBox
      Left = 1
      Top = 84
      Width = 470
      Height = 49
      Caption = 'Valores'
      TabOrder = 3
      object Label4: TLabel
        Left = 8
        Top = 20
        Width = 63
        Height = 13
        Caption = 'Valor da hora'
      end
      object Label5: TLabel
        Left = 196
        Top = 20
        Width = 47
        Height = 13
        Caption = 'Valor total'
      end
      object RxCalcEdit1: TRxCalcEdit
        Left = 88
        Top = 15
        Width = 95
        Height = 21
        AutoSize = False
        NumGlyphs = 2
        TabOrder = 0
      end
      object RxCalcEdit2: TRxCalcEdit
        Left = 252
        Top = 15
        Width = 95
        Height = 21
        AutoSize = False
        NumGlyphs = 2
        TabOrder = 1
      end
    end
    object CheckBox1: TCheckBox
      Left = 10
      Top = 21
      Width = 97
      Height = 14
      Caption = 'Fhechado'
      Enabled = False
      TabOrder = 1
    end
  end
end
