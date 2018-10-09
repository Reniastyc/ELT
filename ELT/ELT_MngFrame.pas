{*******************************************************}
{                                                       }
{             Delphi FireMonkey Platform                }
{                                                       }
{              ELT Manager Control Frame                }
{                 ELT 管理器控制框架                    }
{                     ELT 1.21                          }
{                                                       }
{    Copyright(c) 2016-2018 Reniasty de El Magnifico    }
{                   天道玄虚 出品                       }
{                 All rights reserved                   }
{                   保留所有权利                        }
{                                                       }
{*******************************************************}

unit ELT_MngFrame;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, FMX.Types, FMX.Graphics,
  FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, FMX.Layouts, FMX.Objects,
  ELT.Main, FMX.Controls.Presentation, FMX.Colors, FMX.ListBox, FMX.Edit, FMX.EditBox, FMX.NumberBox;

type
  TMngFrame = class(TFrame)
    BackGround: TScrollBox;
    RecMiniMap: TRectangle;
    BtnLoad: TButton;
    BtnSave: TButton;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    GroupList: TGroupBox;
    CamList: TListBox;
    Label1: TLabel;
    BtnRecord: TButton;
    CamRename: TEdit;
    CamRenClr: TClearEditButton;
    BtnDelete: TButton;
    BtnUp: TButton;
    BtnDn: TButton;
    BtnListClr: TButton;
    BtnOverwrite: TButton;
    BtnClear: TButton;
    BtnDone: TButton;
    GroupInt: TGroupBox;
    IntervalBL: TLabel;
    IntervalPL: TLabel;
    IntervalP: TNumberBox;
    IntervalB: TNumberBox;
    GroupAttrib: TGroupBox;
    IsDeleted: TCheckBox;
    Label15: TLabel;
    SwShowBack: TSwitch;
    Label16: TLabel;
    SwShowImag: TSwitch;
    Label2: TLabel;
    SwShowSides: TSwitch;
    Label3: TLabel;
    BackColor: TComboColorBox;
    Label4: TLabel;
    SidesColor: TComboColorBox;
    Label23: TLabel;
    SidesWidth: TNumberBox;
    GroupMap: TGroupBox;
    procedure BtnLoadClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure RecMiniMapMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure RecMiniMapMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Single);
    procedure RecMiniMapMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure BtnRecordClick(Sender: TObject);
    procedure CamListClick(Sender: TObject);
    procedure CamRenameChange(Sender: TObject);
    procedure SwShowBackClick(Sender: TObject);
    procedure BtnDeleteClick(Sender: TObject);
    procedure SwShowImagClick(Sender: TObject);
    procedure BackColorChange(Sender: TObject);
    procedure BtnOverwriteClick(Sender: TObject);
    procedure BtnListClrClick(Sender: TObject);
    procedure BtnUpClick(Sender: TObject);
    procedure BtnDnClick(Sender: TObject);
    procedure BtnClearClick(Sender: TObject);
    procedure SidesColorChange(Sender: TObject);
    procedure SwShowSidesSwitch(Sender: TObject);
    procedure SidesWidthChange(Sender: TObject);
    procedure IntervalBChange(Sender: TObject);
    procedure IntervalPChange(Sender: TObject);
  private
    { Private declarations }
    FManager: TUIManager;
    FMouseDn: Boolean;
    FPause: Boolean;
    procedure DrawMiniMap(Sender: TObject);
    procedure SetManager(const Value: TUIManager);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    procedure ContinueDeal;
    property Manager: TUIManager       read FManager            write SetManager;
    property Pause:   Boolean          read FPause;
  end;

implementation

{$R *.fmx}

{ TMngFrame }

procedure TMngFrame.BtnRecordClick(Sender: TObject);
begin
  if FManager <> nil then
    FManager.SetCamera;
  CamList.Items.Text := FManager.GetCameraNames;
  CamList.ItemIndex := CamList.Items.Count - 1;
  CamRename.Text := CamList.Items[CamList.ItemIndex];
end;

procedure TMngFrame.BackColorChange(Sender: TObject);
begin
  if FManager = nil then
    Exit;
  FManager.Fill.Color := BackColor.Color;
end;

procedure TMngFrame.BtnClearClick(Sender: TObject);
begin
  if FManager = nil then
    Exit;
  FManager.Clear;
  CamList.Items.Clear;
  SwShowBack.IsChecked := False;
  SwShowBackClick(SwShowBack);
end;

procedure TMngFrame.BtnDeleteClick(Sender: TObject);
var
  i: Integer;
begin
  i := CamList.ItemIndex;
  if i > -1 then
  begin
    FManager.DeleteCamera(i);
    CamList.Items.Delete(i);
  end;
end;

procedure TMngFrame.BtnDnClick(Sender: TObject);
var
  i: Integer;
begin
  i := CamList.ItemIndex;
  if i = CamList.Items.Count - 1 then
    Exit;
  CamList.Items.Move(i, i + 1);
  CamList.ItemIndex := i + 1;
  FManager.MoveCameraItem(i, i + 1);
end;

procedure TMngFrame.BtnListClrClick(Sender: TObject);
begin
  CamList.Items.Clear;
  FManager.ClearCamera;
end;

procedure TMngFrame.BtnLoadClick(Sender: TObject);
var
  fn: string;
begin
  if FManager = nil then
    Exit;
  OpenDialog.Filter := 'ELT文档(*.eltm)|*.eltm';
  if OpenDialog.Execute then
    fn := OpenDialog.FileName
  else
    Exit;
  FManager.LoadFromFile(fn);
  CamList.Items.Text := FManager.GetCameraNames;
  RecMiniMap.Fill.Bitmap.Bitmap.Assign(FManager.MiniMap);
  Manager := FManager;
end;

procedure TMngFrame.BtnOverwriteClick(Sender: TObject);
begin
  if CamList.ItemIndex > -1 then
  begin
    FManager.OverWriteCam(CamList.ItemIndex);
    CamRename.Text := CamList.Items[CamList.ItemIndex];
  end;
end;

procedure TMngFrame.BtnSaveClick(Sender: TObject);
var
  fn: string;
begin
  if FManager = nil then
    Exit;
  SaveDialog.Filter := 'ELT文档(*.eltm)|*.eltm';
  SaveDialog.DefaultExt := 'eltm';
  if SaveDialog.Execute then
    fn := SaveDialog.FileName
  else
    Exit;
  FManager.SaveToFile(fn);
end;

procedure TMngFrame.BtnUpClick(Sender: TObject);
var
  i: Integer;
begin
  i := CamList.ItemIndex;
  if i = 0 then
    Exit;
  CamList.Items.Move(i, i - 1);
  CamList.ItemIndex := i - 1;
  FManager.MoveCameraItem(i, i - 1);
end;

procedure TMngFrame.CamListClick(Sender: TObject);
begin
  if CamList.ItemIndex > -1 then
  begin
    FManager.ApplyCamera(CamList.ItemIndex);
    CamRename.Text := CamList.Items[CamList.ItemIndex];
  end;
end;

procedure TMngFrame.CamRenameChange(Sender: TObject);
var
  i: Integer;
begin
  if CamList.ItemIndex > -1 then
  begin
    i := CamList.ItemIndex;
    FManager.CamName[i] := CamRename.Text;
    CamList.Items[i] := CamRename.Text;
  end;
end;

procedure TMngFrame.ContinueDeal;
begin
  FPause := False;
end;

constructor TMngFrame.Create(AOwner: TComponent);
begin
  inherited;
  FManager := nil;
  FPause := False;
  FMouseDn := False;
end;

procedure TMngFrame.DrawMiniMap(Sender: TObject);
begin
  RecMiniMap.Fill.Bitmap.Bitmap.Assign(FManager.MiniMap);
end;

procedure TMngFrame.IntervalBChange(Sender: TObject);
begin
  if FManager = nil then
    Exit;
  FManager.IntervalBase := IntervalB.Value;
end;

procedure TMngFrame.IntervalPChange(Sender: TObject);
begin
  if FManager = nil then
    Exit;
  FManager.IntervalPlus := IntervalP.Value;
end;

procedure TMngFrame.RecMiniMapMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  if FManager = nil then
    Exit;
  FMouseDn := True;
  FManager.ViewMiniMap(X, Y);
end;

procedure TMngFrame.RecMiniMapMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Single);
begin
  if (FManager = nil) or (not FMouseDn) then
    Exit;
  FManager.ViewMiniMap(X, Y);
end;

procedure TMngFrame.RecMiniMapMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  FMouseDn := False;
end;

procedure TMngFrame.SetManager(const Value: TUIManager);
var
  i: Integer;
begin
  if Value <> nil then
  begin
    IsDeleted.IsChecked := False;
    if FManager <> Value then
    begin
      if FManager <> nil then
      begin
        FManager.OnDrawMiniMap := nil;
        FManager.DisableUndo;
        FManager.ReadOnly := True;
      end;
      FManager := Value;
      FManager.EnableUndo(16);
      FManager.ReadOnly := False;
      FManager.OnDrawMiniMap := DrawMiniMap;
    end;
    FManager.DrawMiniMap;
    case FManager.Fill.Kind of
      TBrushKind.None:
        begin
          SwShowBack.IsChecked := False;
          SwShowImag.IsChecked := False;
          SwShowImag.Enabled := False;
          BackColor.Enabled := False;
        end;
      TBrushKind.Solid, TBrushKind.Gradient, TBrushKind.Resource:
        begin
          SwShowBack.IsChecked := True;
          SwShowImag.IsChecked := False;
          SwShowImag.Enabled := True;
          BackColor.Enabled := True;
          BackColor.Color := FManager.Fill.Color;
        end;
      TBrushKind.Bitmap:
        begin
          SwShowBack.IsChecked := True;
          SwShowImag.IsChecked := True;
          SwShowImag.Enabled := True;
          BackColor.Enabled := False;
        end;
    end;
    if FManager.ShowSides then        
    begin                       
      SwShowSides.IsChecked := True;
      SidesColor.Enabled := True;
      SidesWidth.Enabled := True;
      FManager.ShowSides := True;
      SidesColor.Color := FManager.SidesColor;
      SidesWidth.Value := FManager.SidesWidth;
    end
    else
    begin                 
      SwShowSides.IsChecked := False;
      SidesColor.Enabled := False;
      FManager.ShowSides := False;   
      SidesWidth.Enabled := False;
    end;
    CamList.Items.Clear;
    CamList.Items.Text := FManager.CamNameList;
    if CamList.Items.Count > 0 then
    begin
      i := FManager.CurCamera;
      if i = -1 then
      begin
        FManager.CurCamera := 0;
        CamList.ItemIndex := 0;
      end
      else
        CamList.ItemIndex := i;
    end;
    IntervalB.Value := FManager.IntervalBase;
    IntervalP.Value := FManager.IntervalPlus;
  end
  else
  begin
    if FManager <> nil then
    begin
      FManager.OnDrawMiniMap := nil;
      FManager.DisableUndo;
      FManager.ReadOnly := True;
    end;
    FManager := nil;
  end;
end;

procedure TMngFrame.SidesColorChange(Sender: TObject);
begin
  if FManager = nil then
    Exit;
  FManager.SidesColor := SidesColor.Color;     
end;

procedure TMngFrame.SidesWidthChange(Sender: TObject);
begin
  if FManager = nil then
    Exit;
  FManager.SidesWidth := SidesWidth.Value;
end;

procedure TMngFrame.SwShowBackClick(Sender: TObject);
begin
  if FManager = nil then
    Exit;
  if SwShowBack.IsChecked then
  begin
    FManager.Fill.Kind := TBrushKind.Solid;
    FManager.Fill.Color := BackColor.Color;
    SwShowImag.Enabled := True;
    BackColor.Enabled := True;
  end
  else
  begin
    FManager.Fill.Kind := TBrushKind.None;
    SwShowImag.IsChecked := False;
    SwShowImag.Enabled := False;
    BackColor.Enabled := False;
  end;
end;

procedure TMngFrame.SwShowImagClick(Sender: TObject);
begin
  if FManager = nil then
    Exit;
  OpenDialog.Filter := '';
  if SwShowImag.IsChecked then
  begin
    OpenDialog.Title := '图像背景';
    OpenDialog.Filter := '';
    if OpenDialog.Execute then
    begin
      FManager.SetBackground(OpenDialog.FileName);
      BackColor.Enabled := False;
    end
    else
    begin
      FManager.Fill.Kind := TBrushKind.Bitmap;
      BackColor.Enabled := False;
    end;
  end
  else
  begin
    FManager.Fill.Kind := TBrushKind.Solid;
    FManager.Fill.Color := BackColor.Color;
    BackColor.Enabled := True;
  end;
end;

procedure TMngFrame.SwShowSidesSwitch(Sender: TObject);
begin
  if FManager = nil then
    Exit;
  if SwShowSides.IsChecked then
  begin
    SidesColor.Enabled := True;
    SidesWidth.Enabled := True;
    FManager.ShowSides := True;
    SidesColor.Color := FManager.SidesColor;
    SidesWidth.Value := FManager.SidesWidth;
  end
  else
  begin
    SidesColor.Enabled := False;
    FManager.ShowSides := False;   
    SidesWidth.Enabled := False;
  end;
end;

end.
