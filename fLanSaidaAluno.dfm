inherited ovF_LanSaidaAluno: TovF_LanSaidaAluno
  Caption = 'Sa'#237'da aluno'
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
      Top = 83
      Visible = False
    end
    inherited ovB_Sair: TButton
      Top = 52
    end
    inherited ovB_Excluir: TButton
      Top = 78
      Visible = False
    end
  end
  inherited ovP_Container: TPanel
    Width = 473
    Height = 87
    object Label1: TLabel
      Left = 11
      Top = 48
      Width = 53
      Height = 13
      Caption = 'Hora sa'#237'da'
    end
    inline ovFra_Dependentes1: TovFra_Dependentes
      Left = 0
      Top = 0
      Width = 475
      Height = 51
      TabOrder = 0
    end
    object ovDTP_HoraSaida: TDateTimePicker
      Left = 125
      Top = 43
      Width = 95
      Height = 21
      Date = 43012.206779004630000000
      Time = 43012.206779004630000000
      Kind = dtkTime
      TabOrder = 1
    end
    object ovB_Atualizar: TButton
      Left = 222
      Top = 46
      Width = 75
      Height = 17
      Caption = 'Atualizar'
      TabOrder = 2
      OnClick = ovB_AtualizarClick
    end
  end
end
