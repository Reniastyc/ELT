program DemoPreject;

uses
  System.StartUpCopy,
  FMX.Forms,
  DemoUnit in 'DemoUnit.pas' {DemoForm},
  ELT.Extra in 'ELT.Extra.pas',
  ELT.Main in 'ELT.Main.pas',
  ELT.Windows in 'ELT.Windows.pas',
  ELT_PsgFrame in 'ELT_PsgFrame.pas' {PsgFrame: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDemoForm, DemoForm);
  Application.Run;
end.
