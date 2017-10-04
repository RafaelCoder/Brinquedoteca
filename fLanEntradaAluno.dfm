inherited ovF_LanEntradaAluno: TovF_LanEntradaAluno
  Caption = 'Entrada alunos'
  ClientHeight = 87
  ClientWidth = 641
  OldCreateOrder = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl1: TPanel
    Left = 540
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
    Width = 540
    Height = 87
    inline ovFra_Dependentes1: TovFra_Dependentes
      Left = 0
      Top = 0
      Width = 475
      Height = 51
      TabOrder = 0
    end
    object ovC_Hora: TRxClock
      Left = 127
      Top = 47
      Width = 176
      Height = 33
    end
  end
end
