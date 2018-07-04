object f_dialog: Tf_dialog
  Left = 722
  Top = 110
  BorderStyle = bsDialog
  Caption = #1042#1099#1073#1086#1088' '#1092#1091#1085#1082#1094#1080#1081
  ClientHeight = 341
  ClientWidth = 418
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 418
    Height = 341
    Align = alClient
    Shape = bsFrame
    Style = bsRaised
  end
  object Label_el_n: TLabel
    Left = 24
    Top = 184
    Width = 132
    Height = 18
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1090#1086#1095#1077#1082
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Bookman Old Style'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label_f: TLabel
    Left = 24
    Top = 8
    Width = 150
    Height = 18
    Caption = #1044#1086#1089#1090#1091#1087#1085#1099#1077' '#1092#1091#1085#1082#1094#1080#1080
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Bookman Old Style'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label_k: TLabel
    Left = 216
    Top = 8
    Width = 118
    Height = 18
    Caption = #1050#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090#1099
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Bookman Old Style'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label_a: TLabel
    Left = 216
    Top = 32
    Width = 21
    Height = 18
    Caption = 'a ='
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Bookman Old Style'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label_b: TLabel
    Left = 216
    Top = 56
    Width = 22
    Height = 18
    Caption = 'b ='
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Bookman Old Style'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label_c: TLabel
    Left = 216
    Top = 80
    Width = 21
    Height = 18
    Caption = 'c ='
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Bookman Old Style'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label_i: TLabel
    Left = 216
    Top = 120
    Width = 129
    Height = 18
    Caption = #1048#1085#1090#1077#1088#1074#1072#1083', [x1; x2]'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Bookman Old Style'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label_x2: TLabel
    Left = 296
    Top = 144
    Width = 29
    Height = 18
    Caption = 'x2 ='
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Bookman Old Style'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label_x1: TLabel
    Left = 216
    Top = 144
    Width = 29
    Height = 18
    Caption = 'x1 ='
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Bookman Old Style'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 24
    Top = 240
    Width = 114
    Height = 18
    Caption = #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1082#1072#1082
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Bookman Old Style'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object BitBtn1: TBitBtn
    Left = 68
    Top = 296
    Width = 113
    Height = 33
    TabOrder = 0
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object SpinEdit1: TSpinEdit
    Left = 24
    Top = 200
    Width = 73
    Height = 22
    Ctl3D = False
    Increment = 10
    MaxLength = 5
    MaxValue = 10000
    MinValue = 10
    ParentCtl3D = False
    TabOrder = 1
    Value = 100
  end
  object ListBox1: TListBox
    Left = 24
    Top = 32
    Width = 177
    Height = 137
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemHeight = 20
    Items.Strings = (
      'y=ax'
      'y=ax^2'
      'y=ax^3'
      'y=a/(bx)'
      'y=a*sin(bx)'
      'y=a*cos(bx)'
      'y=a*tg(bx)'
      'y=a*ctg(bx)'
      'y=a*e^(bx)'
      'y=a*b^(cx)'
      'y=a*ln(bx)'
      'y=a*lg(bx)'
      'y=c*log a (bx)')
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 2
  end
  object BitBtn2: TBitBtn
    Left = 236
    Top = 296
    Width = 113
    Height = 33
    TabOrder = 3
    Kind = bkCancel
  end
  object Edit_a: TEdit
    Left = 240
    Top = 32
    Width = 65
    Height = 19
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 4
    Text = '1'
  end
  object Edit_b: TEdit
    Left = 240
    Top = 56
    Width = 65
    Height = 19
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 5
    Text = '1'
  end
  object Edit_c: TEdit
    Left = 240
    Top = 80
    Width = 65
    Height = 19
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 6
    Text = '1'
  end
  object Edit_x1: TEdit
    Left = 248
    Top = 144
    Width = 41
    Height = 19
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 7
    Text = '-5,5'
  end
  object Edit_x2: TEdit
    Left = 328
    Top = 144
    Width = 49
    Height = 19
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 8
    Text = '5,5'
  end
  object ComboBox1: TComboBox
    Left = 24
    Top = 256
    Width = 145
    Height = 24
    Style = csDropDownList
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Georgia'
    Font.Style = [fsBold]
    ItemHeight = 16
    ItemIndex = 0
    ParentFont = False
    TabOrder = 9
    Text = #1090#1086#1095#1082#1080
    Items.Strings = (
      #1090#1086#1095#1082#1080
      #1089#1077#1090#1082#1072
      #1087#1086#1074#1077#1088#1093#1085#1086#1089#1090#1100)
  end
  object Button1: TButton
    Left = 216
    Top = 168
    Width = 105
    Height = 25
    Caption = #1052#1072#1082#1089#1080#1084#1072#1083#1100#1085#1099#1081
    TabOrder = 10
    OnClick = Button1Click
  end
end
