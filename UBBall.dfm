object MainForm: TMainForm
  Left = 475
  Top = 246
  Width = 572
  Height = 540
  Caption = 'Bouncing Ball Example'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PrintScale = poPrintToFit
  Scaled = False
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object TimeScaleLabel: TLabel
    Left = 30
    Top = 305
    Width = 51
    Height = 13
    Caption = 'Time scale'
  end
  object CoefficientLabel: TLabel
    Left = 30
    Top = 207
    Width = 106
    Height = 13
    Caption = 'Coefficient of Elasticity'
  end
  object CPanel: TPanel
    Left = 257
    Top = 14
    Width = 224
    Height = 473
    Color = 16777088
    TabOrder = 0
    object RShape: TShape
      Left = 98
      Top = 32
      Width = 31
      Height = 31
      Brush.Color = clBlue
      Shape = stCircle
    end
  end
  object DropBtn: TButton
    Left = 30
    Top = 98
    Width = 91
    Height = 31
    Caption = 'Drop the ball'
    TabOrder = 1
    OnClick = DropBtnClick
  end
  object ResetBtn: TButton
    Left = 30
    Top = 148
    Width = 92
    Height = 30
    Caption = 'Reset the ball'
    TabOrder = 2
    OnClick = ResetBtnClick
  end
  object TimeScaleBar: TTrackBar
    Left = 30
    Top = 335
    Width = 148
    Height = 44
    Max = 50
    PageSize = 5
    Position = 25
    TabOrder = 3
  end
  object CEBar: TTrackBar
    Left = 30
    Top = 236
    Width = 150
    Height = 45
    Position = 8
    TabOrder = 4
  end
end
