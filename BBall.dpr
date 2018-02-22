program BBall;

uses
  Forms,
  UBBall in 'UBBall.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
