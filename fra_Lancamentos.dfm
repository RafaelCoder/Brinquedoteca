object ovFra_Lancamentos: TovFra_Lancamentos
  Left = 0
  Top = 0
  Width = 475
  Height = 22
  TabOrder = 0
  object Label1: TLabel
    Left = 10
    Top = 5
    Width = 59
    Height = 13
    Caption = 'Lan'#231'amento'
  end
  object ovCE_Codigo: TRxCalcEdit
    Left = 125
    Top = 0
    Width = 95
    Height = 21
    AutoSize = False
    DisplayFormat = '0'
    GlyphKind = gkCustom
    Glyph.Data = {
      42040000424D4204000000000000420000002800000010000000100000000100
      20000300000000040000000000000000000000000000000000000000FF0000FF
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000003000000070000000B0000000E0000
      00100000001100000011000000100000000E0000000B000000075E5E5E5C5454
      54150000000000000002000000080000000D000000120000001759595928A0A0
      A0499898984B45454530000000210000001C000000178E8E8ED9D7D7D7FFBFBF
      BFF13F3F3F0C0000000000000003000000080000000D00000011BEBEBE3FDFDF
      DF72DDDDDD72B1B1B142000000171313131A919191EEA6A6A6FFB2B2B2FFABAB
      ABE800000000000000000000000000000000000000009F9F9F08858585288686
      8637707070190000000261616115979797F7A9A9A9FF979797FF8B8B8BF23333
      330500000000000000000000000000000000A8A8A873CBCBCBF1DAD9D7FADAD8
      D5FBD2D2D2F5A4A4A4B7A6A6A6F6ADADADFF939393FF878787DE000000000000
      0000000000000000000000000000BBBBBB9FDDDBDAFEC9AD97E8BD9776CABE98
      75BDC3A489D9DAD3CEFED4D4D4FEA0A0A0FF848484BF00000000000000000000
      00000000000000000000A4A4A460DDDBDAFEBD9772CFCA986C7FCF9D7161D09E
      7257CD9B7066BD8C61A7DBD5D0FBA4A4A4DC0000000000000000000000000000
      000000000000FFFFFF01C2C2C2ECC3A78EECCE9D6E92CF9F7170D09E7352CDA1
      6F39CFA07056CF9F7175BE977AC2D6D2CFF97272723100000000000000000000
      00000000000087878711CDCAC9F6BD9570D7E8D2BBBDECDBCDB4EFE0D2A6E9D4
      C083D1A57A64CE9E727AC28D64ADD9D1CBFFA0A0A06C00000000000000000000
      0000000000008C8C8C14CBC7C2F6BF9772D1EEDDCDD3F1E2D7CDF3E7DAC4F1E5
      D7BCE6CFBBA6CF9F718BBE8D63B6D9D0C8FFA7A7A77A00000000000000000000
      00000000000000000000C4C1C1EEC09D82E7EDDACBDAF3E9E0E2F3EBE2DEF1E8
      DCD4EDDDCECDD5AB84ABBE9471C2D8D4D0FC8B8B8B3500000000000000000000
      00000000000000000000B4B4B47FD4CBC4FDCEA887D1F6ECE6EBF7EDE8ECF2E7
      DCE3EDDACBDACA9E78C3CDBBADF3C3C3C3E80000000000000000000000000000
      0000000000000000000000000000C4C4C4BFD5CBC3FDC9A688D5DBBBA1D8D8BA
      9DD4C79F7DCBCABBADF4D2D2D2F4A5A5A5140000000000000000000000000000
      000000000000000000000000000000000000BBBBBBA6D4D1CEF5D5CCC5FED3C9
      C0FED8D3CFFAC1C1C1E09F9F9F10000000000000000000000000000000000000
      0000000000000000000000000000000000000000000090909017A3A3A340A6A6
      A6518E8E8E220000000000000000000000000000000000000000000000000000
      000000000000}
    NumGlyphs = 1
    TabOrder = 0
    OnButtonClick = ovCE_CodigoButtonClick
    OnExit = ovCE_CodigoExit
  end
  object ovP_Descricao: TPanel
    Left = 221
    Top = 0
    Width = 250
    Height = 20
    Alignment = taLeftJustify
    TabOrder = 1
  end
end