inherited ovF_LanEntradaAluno: TovF_LanEntradaAluno
  Caption = 'ovF_LanEntradaAluno'
  ClientHeight = 161
  ClientWidth = 641
  OldCreateOrder = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl1: TPanel
    Left = 540
    Height = 161
  end
  inherited ovP_Container: TPanel
    Width = 540
    Height = 161
    inline ovFra_Dependentes1: TovFra_Dependentes
      Left = 0
      Top = 0
      Width = 475
      Height = 51
      TabOrder = 0
    end
    object DateTimePicker1: TDateTimePicker
      Left = 126
      Top = 45
      Width = 186
      Height = 21
      Date = 43010.762192280090000000
      Time = 43010.762192280090000000
      TabOrder = 1
    end
  end
end
