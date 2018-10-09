unit Demo;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects, ELT.Main, ELT_PsgFrame;

type
  TELTForm = class(TForm)
    PsgFrame: TPsgFrame;
    UIManager: TUIManager;
    UIPassage: TUIPassage;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ELTForm: TELTForm;

implementation

{$R *.fmx}

procedure TELTForm.FormCreate(Sender: TObject);
begin
  UIPassage.Manager := UIManager;
  PsgFrame.Passage := UIPassage;
end;

procedure TELTForm.FormResize(Sender: TObject);
begin
  UIPassage.Redraw;
end;

end.
