object f_rotate: Tf_rotate
  Left = 202
  Top = 112
  BorderStyle = bsDialog
  Caption = #1042#1088#1072#1097#1072#1077#1084'...'
  ClientHeight = 273
  ClientWidth = 280
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
  object Label1: TLabel
    Left = 8
    Top = 160
    Width = 206
    Height = 16
    Caption = #1058#1086#1095#1085#1086#1089#1090#1100' '#1087#1086#1074#1077#1088#1093#1085#1086#1089#1090#1080', PI/n'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Lucida Sans Unicode'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object RadioGroup1: TRadioGroup
    Left = 0
    Top = 0
    Width = 280
    Height = 145
    Align = alTop
    Caption = #1055#1086#1074#1088#1072#1097#1072#1090#1100' '#1074#1086#1082#1088#1091#1075'...'
    Ctl3D = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemIndex = 3
    Items.Strings = (
      '... '#1086#1089#1080' X'
      '... '#1086#1089#1080' Y'
      '... '#1086#1089#1080' Z'
      '... '#1085#1077' '#1074#1088#1072#1097#1072#1090#1100)
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 2
  end
  object BitBtn1: TBitBtn
    Left = 30
    Top = 224
    Width = 93
    Height = 33
    TabOrder = 0
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 158
    Top = 224
    Width = 93
    Height = 33
    TabOrder = 1
    Kind = bkCancel
  end
  object SpinEdit1: TSpinEdit
    Left = 8
    Top = 176
    Width = 73
    Height = 22
    Ctl3D = False
    MaxValue = 1000
    MinValue = 1
    ParentCtl3D = False
    TabOrder = 3
    Value = 32
  end
end
