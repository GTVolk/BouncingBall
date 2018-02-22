unit UBBal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Comctrls, ExtCtrls, ShellAPI;

type
  TMainForm = class(TForm)
    CPanel: TPanel;
    DropBtn: TButton;
    RShape: TShape;
    ResetBtn: TButton;
    TimeScaleBar: TTrackBar;
    TimeScaleLabel: TLabel;
    CoefficientLabel: TLabel;
    CEBar: TTrackBar;
    procedure FormActivate(Sender: TObject);
    procedure DropBtnClick(Sender: TObject);
    procedure ResetBtnClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  public
    initTop:integer;
  end;

var
  MainForm: TForm1;

implementation

{$R *.DFM}

procedure TMainForm.FormActivate(Sender: TObject);
begin
   CPanel.doubleBuffered:=true; {for smoother animation}
   initTop:=RShape.top; {save first ball position so we can reset it after a drop}
end;

procedure TMainForm.DropBtnClick(Sender: TObject);
var
  v:real;     {current velocity in pixles}
  nextV:real; {look ahead to next velocity}
  c:real;     {Coefficient of elasticity}
  stopped:boolean;  {stop flag}
  lastTop:integer;
Begin
  resetBtnClick(sender);
  v := 0;
  stopped := false;
  tag := 0;
  lastTop := 0;
  with RShape do {so all uses of 'top' and 'height' in this loop mean refer to shape1}
  repeat
    {increment velocity 1 pixel per loop, i.e. gravity = 1 pixel per loop per loop}
    nextV := v + 1.0;
    //*{debugging}listbox1.items.add(format('top %3d, v %5.1f, nextv %5.1f',[top,v,nextv]));
    If v >= 0 then {moving down}
    Begin
      if (top + round(nextv) >= CPanel.height - height)
      then {next move would go below the floor}
      Begin
        lastTop := top;
        top := CPanel.height - height; {so just set it on the floor}
        c := sqrt(CEBar.position / CEBar.max); {set coefficient of elasticity}
        nextV := -(nextV) * c; {lose a little energy and start it back up}
        if nextV > -3 then stopped := true; {If we won't move at least 3 pixels, then stop}
      end
      else top := top + round(nextV);
    end
    else {moving up}
    Begin
      If top + round(nextV)<0
      then {shouldn't happen, but if next move goes through the ceiling} top:=0
      else
      if lastTop > 0 then {first move up, use last move down position}
      begin
        top := lastTop;
        lastTop := 0;
        nextV := nextV - 1;
      end
      else
      begin
         top := top + round(nextV);
      end;
    end;
    v := nextV;
    Application.processMessages; {Let the screen update, etc.}
    sleep(TimeScaleBar.max - TimeScaleBar.position); {Wait a few milliseconds}
    if self.tag > 0 then stopped := true;
  until stopped;
end;

procedure TForm1.ResetBtnClick(Sender: TObject);
begin
  tag := 1;
  RShape.top := initTop;
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  tag := 1;
end;

end.
