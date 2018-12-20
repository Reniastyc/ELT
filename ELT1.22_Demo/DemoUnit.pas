unit DemoUnit;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects, ELT.Main, ELT_PsgFrame;

type
  TDemoForm = class(TForm)
    EditControl: TPsgFrame;
    MainPassage: TUIPassage;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DemoForm: TDemoForm;

implementation

{$R *.fmx}

procedure TDemoForm.FormCreate(Sender: TObject);
begin
  EditControl.Passage := MainPassage;
end;

end.
