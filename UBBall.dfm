object MainForm: TMainForm
  Left = 311
  Top = 208
  Width = 432
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
    Left = 70
    Top = 153
    Width = 51
    Height = 13
    Caption = 'Time scale'
  end
  object CoefficientLabel: TLabel
    Left = 38
    Top = 95
    Width = 106
    Height = 13
    Caption = 'Coefficient of Elasticity'
  end
  object CPanel: TPanel
    Left = 185
    Top = 8
    Width = 224
    Height = 489
    Color = 16777088
    FullRepaint = False
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
    Left = 6
    Top = 10
    Width = 171
    Height = 39
    Caption = 'Drop the ball'
    TabOrder = 1
    OnClick = DropBtnClick
  end
  object ResetBtn: TButton
    Left = 6
    Top = 52
    Width = 171
    Height = 37
    Caption = 'Reset the ball'
    TabOrder = 2
    OnClick = ResetBtnClick
  end
  object TimeScaleBar: TTrackBar
    Left = 6
    Top = 167
    Width = 171
    Height = 34
    Max = 50
    PageSize = 5
    Position = 25
    TabOrder = 3
  end
  object CEBar: TTrackBar
    Left = 6
    Top = 108
    Width = 171
    Height = 37
    Position = 8
    TabOrder = 4
  end
end
