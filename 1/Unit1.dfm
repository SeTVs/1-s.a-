object Form1: TForm1
  Left = 649
  Top = 255
  BorderStyle = bsSingle
  Caption = 'Trie Tree '
  ClientHeight = 423
  ClientWidth = 583
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 296
    Top = 0
    Width = 9
    Height = 419
    Align = alCustom
  end
  object TreeView1: TTreeView
    Left = 0
    Top = 24
    Width = 297
    Height = 393
    BevelEdges = []
    Indent = 19
    TabOrder = 0
  end
  object Memo: TMemo
    Left = 304
    Top = 24
    Width = 273
    Height = 393
    BevelEdges = []
    HideSelection = False
    Lines.Strings = (
      '')
    ReadOnly = True
    TabOrder = 1
  end
  object MainMenu1: TMainMenu
    object mFile: TMenuItem
      Caption = #1060#1072#1081#1083' '
      object MNew: TMenuItem
        Caption = #1053#1086#1074#1099#1081
        OnClick = MNewClick
      end
      object MOpen: TMenuItem
        Caption = #1054#1090#1082#1088#1099#1090#1100
        OnClick = MOpenClick
      end
      object MSave: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        OnClick = MSaveClick
      end
      object MSaveAS: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1082#1072#1082
        OnClick = MSaveASClick
      end
      object Close: TMenuItem
        Caption = #1047#1072#1082#1088#1099#1090#1100
        OnClick = CloseClick
      end
    end
    object MEditing: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '
      object MAddWord: TMenuItem
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1083#1086#1074#1086
        OnClick = MAddWordClick
      end
      object MDeleteWord: TMenuItem
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1089#1083#1086#1074#1086
        OnClick = MDeleteWordClick
      end
      object MClearWord: TMenuItem
        Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1076#1077#1088#1077#1074#1086
        OnClick = MClearWordClick
      end
    end
    object MTask: TMenuItem
      Caption = #1047#1072#1076#1072#1095#1072
      OnClick = MTaskClick
    end
    object ViewTree: TMenuItem
      Caption = #1042#1099#1074#1077#1089#1090#1080' '#1076#1077#1088#1077#1074#1086
      OnClick = ViewTreeClick
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = '*.txt|*.txt'
    Left = 24
  end
  object SaveDialog1: TSaveDialog
    Filter = '*.txt|*.txt'
    Left = 48
  end
end
