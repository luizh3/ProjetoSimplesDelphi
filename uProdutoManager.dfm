object FCadastroProduto: TFCadastroProduto
  Left = 192
  Top = 125
  Width = 1088
  Height = 639
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'FCadastroProduto'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblNomeProduto: TLabeledEdit
    Left = 112
    Top = 120
    Width = 177
    Height = 27
    AutoSize = False
    Ctl3D = False
    EditLabel.Width = 68
    EditLabel.Height = 13
    EditLabel.Caption = 'Nome Produto'
    ParentCtl3D = False
    TabOrder = 0
  end
  object lblDescricao: TLabeledEdit
    Left = 312
    Top = 120
    Width = 177
    Height = 27
    AutoSize = False
    Ctl3D = False
    EditLabel.Width = 48
    EditLabel.Height = 13
    EditLabel.Caption = 'Descricao'
    ParentCtl3D = False
    TabOrder = 1
  end
  object lblValor: TLabeledEdit
    Left = 504
    Top = 120
    Width = 185
    Height = 27
    AutoSize = False
    Ctl3D = False
    EditLabel.Width = 24
    EditLabel.Height = 13
    EditLabel.Caption = 'Valor'
    ParentCtl3D = False
    TabOrder = 2
    OnKeyPress = lblValorKeyPress
  end
  object lblDesconto: TLabeledEdit
    Left = 112
    Top = 168
    Width = 177
    Height = 27
    AutoSize = False
    Ctl3D = False
    EditLabel.Width = 46
    EditLabel.Height = 13
    EditLabel.Caption = 'Desconto'
    ParentCtl3D = False
    TabOrder = 3
    OnKeyPress = lblDescontoKeyPress
  end
  object cbTpProduto: TComboBox
    Left = 312
    Top = 168
    Width = 177
    Height = 28
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 20
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 4
    Text = 'Tipo Produto'
  end
  object gridProdutos: TStringGrid
    Left = 112
    Top = 208
    Width = 849
    Height = 273
    ColCount = 7
    Ctl3D = False
    DefaultColWidth = 120
    RowCount = 1
    FixedRows = 0
    ParentCtl3D = False
    TabOrder = 5
  end
  object BitBtn1: TBitBtn
    Left = 112
    Top = 504
    Width = 185
    Height = 49
    Caption = '&Adicionar Produto'
    TabOrder = 6
    OnClick = BitBtn1Click
    Kind = bkYes
  end
  object Panel1: TPanel
    Left = -8
    Top = 0
    Width = 1081
    Height = 81
    BevelOuter = bvNone
    Caption = 'Cadastro Produto'
    Color = clTeal
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -47
    Font.Name = 'Yu Gothic UI'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 7
  end
  object BitBtn2: TBitBtn
    Left = 312
    Top = 504
    Width = 169
    Height = 49
    TabOrder = 8
    OnClick = BitBtn2Click
    Kind = bkClose
  end
end
