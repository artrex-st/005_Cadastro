object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Cadastro'
  ClientHeight = 475
  ClientWidth = 483
  Color = clActiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 85
    Width = 48
    Height = 13
    Caption = 'Cadastro:'
  end
  object Label2: TLabel
    Left = 304
    Top = 85
    Width = 31
    Height = 13
    Caption = 'Nome:'
  end
  object Label3: TLabel
    Left = 304
    Top = 148
    Width = 58
    Height = 13
    Caption = 'Sobrenome:'
  end
  object Label4: TLabel
    Left = 304
    Top = 205
    Width = 23
    Height = 13
    Caption = 'CPF:'
  end
  object Label5: TLabel
    Left = 304
    Top = 260
    Width = 100
    Height = 13
    Caption = 'Data de Nascimento:'
  end
  object edtNome: TEdit
    Left = 304
    Top = 104
    Width = 130
    Height = 21
    TabOrder = 0
  end
  object edtSnome: TEdit
    Left = 304
    Top = 167
    Width = 130
    Height = 21
    TabOrder = 1
  end
  object cbCad: TComboBox
    Left = 32
    Top = 104
    Width = 217
    Height = 21
    AutoComplete = False
    Style = csDropDownList
    ImeMode = imDisable
    TabOrder = 5
    OnChange = cbCadChange
  end
  object btnAdd: TButton
    Left = 304
    Top = 325
    Width = 130
    Height = 33
    Caption = 'Gravar'
    TabOrder = 4
    OnClick = btnAddClick
  end
  object meCpf: TMaskEdit
    Left = 304
    Top = 224
    Width = 130
    Height = 21
    EditMask = '###.###.###-##;0;_'
    MaxLength = 14
    TabOrder = 2
    Text = ''
    OnKeyPress = meCpfKeyPress
  end
  object dtpData: TDateTimePicker
    Left = 304
    Top = 279
    Width = 130
    Height = 21
    Date = 43608.000000000000000000
    Time = 0.894294965277367700
    TabOrder = 3
  end
  object btnEdit: TButton
    Left = 304
    Top = 376
    Width = 55
    Height = 33
    Caption = 'Editar'
    Enabled = False
    TabOrder = 6
    OnClick = btnEditClick
  end
  object btnExcluir: TButton
    Left = 379
    Top = 376
    Width = 55
    Height = 33
    Caption = 'Excluir'
    Enabled = False
    TabOrder = 7
    OnClick = btnExcluirClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 483
    Height = 73
    Align = alTop
    Caption = 'Cadastro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
  end
  object btnKill: TButton
    Left = 304
    Top = 415
    Width = 130
    Height = 34
    Caption = 'EXCLUIR TUDOS'
    Enabled = False
    TabOrder = 9
    OnClick = btnKillClick
  end
end
