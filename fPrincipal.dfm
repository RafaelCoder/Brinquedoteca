object ovF_Principal: TovF_Principal
  Left = 275
  Top = 134
  Width = 1305
  Height = 675
  Caption = 'Principal'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = oMM_Menu
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object oMM_Menu: TMainMenu
    Left = 256
    Top = 88
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object Alunos1: TMenuItem
        Caption = 'Clientes'
        OnClick = Alunos1Click
      end
    end
    object Lanamentos1: TMenuItem
      Caption = 'Lan'#231'amentos'
      object Entradadealuno1: TMenuItem
        Caption = 'Entrada de aluno'
        OnClick = Entradadealuno1Click
      end
      object Saidadealuno1: TMenuItem
        Caption = 'Saida de aluno'
      end
    end
    object Pesquisa1: TMenuItem
      Caption = 'Pesquisa'
      Visible = False
    end
  end
end
