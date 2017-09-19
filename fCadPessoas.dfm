inherited ovF_CadPessoas: TovF_CadPessoas
  Left = 642
  Top = 416
  Caption = 'Clientes'
  ClientHeight = 352
  ClientWidth = 719
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl1: TPanel
    Left = 618
    Height = 352
    inherited ovB_Pesquisar: TButton
      OnClick = ovB_PesquisarClick
    end
  end
  inherited ovP_Container: TPanel
    Width = 618
    Height = 352
    object ovPC_Container: TPageControl
      Left = 1
      Top = 1
      Width = 616
      Height = 350
      ActivePage = TabSheet2
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'Dados do cliente'
        object Panel2: TPanel
          Left = 0
          Top = 42
          Width = 608
          Height = 280
          Align = alClient
          TabOrder = 0
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
          object Label7: TLabel
            Left = 10
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
          object ovME_CPF: TMaskEdit
            Left = 125
            Top = 21
            Width = 116
            Height = 21
            EditMask = '999\.999\.999\-99;0; '
            MaxLength = 14
            TabOrder = 4
          end
        end
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 608
          Height = 42
          Align = alTop
          TabOrder = 1
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
            OnExit = ovCE_CodigoExit
          end
          object ovE_Nome: TEdit
            Left = 125
            Top = 22
            Width = 375
            Height = 21
            TabOrder = 1
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Dependentes'
        ImageIndex = 1
        object Label3: TLabel
          Left = 10
          Top = 7
          Width = 33
          Height = 13
          Caption = 'C'#243'digo'
        end
        object Label6: TLabel
          Left = 10
          Top = 24
          Width = 28
          Height = 13
          Caption = 'Nome'
        end
        object Label8: TLabel
          Left = 12
          Top = 41
          Width = 95
          Height = 13
          Caption = 'Data de nascimento'
        end
        object DBGrid1: TDBGrid
          Left = 0
          Top = 100
          Width = 608
          Height = 222
          Align = alBottom
          DataSource = oDS_Dependentes
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'Pes_Nome'
              Title.Caption = 'Nome'
              Width = 354
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Pes_DataNascimento'
              Title.Caption = 'Data de nascimento'
              Width = 137
              Visible = True
            end>
        end
        object ovCE_DepCodigo: TRxCalcEdit
          Left = 125
          Top = 5
          Width = 121
          Height = 21
          AutoSize = False
          DecimalPlaces = 0
          DisplayFormat = '0'
          Enabled = False
          ButtonWidth = 0
          NumGlyphs = 2
          TabOrder = 1
        end
        object ovE_DepNome: TEdit
          Left = 125
          Top = 22
          Width = 375
          Height = 21
          TabOrder = 2
        end
        object ovDE_DepDataNascimento: TDateEdit
          Left = 125
          Top = 42
          Width = 121
          Height = 21
          NumGlyphs = 2
          TabOrder = 3
        end
        object ovB_DepAdicionar: TButton
          Left = 168
          Top = 72
          Width = 75
          Height = 25
          Caption = 'Adicionar'
          TabOrder = 4
          OnClick = ovB_DepAdicionarClick
        end
        object ovB_DepRemover: TButton
          Left = 256
          Top = 72
          Width = 75
          Height = 25
          Caption = 'Remover'
          TabOrder = 5
        end
      end
    end
  end
  object oCDS_Dependentes: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 141
    Top = 185
    object oCDS_DependentesDep_Codigo: TIntegerField
      FieldName = 'Dep_Codigo'
    end
    object oCDS_DependentesPes_Nome: TStringField
      FieldName = 'Pes_Nome'
      Size = 100
    end
    object oCDS_DependentesPes_DataNascimento: TDateField
      FieldName = 'Pes_DataNascimento'
    end
  end
  object oDS_Dependentes: TDataSource
    DataSet = oCDS_Dependentes
    Left = 213
    Top = 161
  end
end
