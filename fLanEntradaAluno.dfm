inherited ovF_LanEntradaAluno: TovF_LanEntradaAluno
  Caption = 'Entrada aluno'
  ClientHeight = 87
  ClientWidth = 574
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl1: TPanel
    Left = 473
    Height = 87
    inherited ovB_Pesquisar: TButton
      Left = 8
      Top = 109
      Visible = False
    end
    inherited ovB_Sair: TButton
      Top = 50
    end
    inherited ovB_Excluir: TButton
      Top = 85
      Visible = False
    end
  end
  inherited ovP_Container: TPanel
    Width = 473
    Height = 87
    object Label1: TLabel
      Left = 12
      Top = 49
      Width = 62
      Height = 13
      Caption = 'Hora entrada'
    end
    inline ovFra_Dependentes1: TovFra_Dependentes
      Left = 0
      Top = 0
      Width = 475
      Height = 51
      TabOrder = 0
    end
    object ovDTP_HoraEntrada: TDateTimePicker
      Left = 125
      Top = 46
      Width = 94
      Height = 21
      Date = 43012.209260486110000000
      Time = 43012.209260486110000000
      Kind = dtkTime
      TabOrder = 1
    end
    object Button1: TButton
      Left = 220
      Top = 48
      Width = 75
      Height = 18
      Caption = 'Atualizar'
      TabOrder = 2
      OnClick = Button1Click
    end
  end
end
