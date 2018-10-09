program DemoProject;

uses
  System.StartUpCopy,
  FMX.Forms,
  Demo in 'Demo.pas' {ELTForm},
  ELT_PsgFrame in 'ELT_PsgFrame.pas' {PsgFrame: TFrame},
  ELT.Extra in 'ELT.Extra.pas',
  ELT.Main in 'ELT.Main.pas',
  ELT.Windows in 'ELT.Windows.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TELTForm, ELTForm);
  Application.Run;
end.
