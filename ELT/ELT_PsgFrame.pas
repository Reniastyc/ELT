{*******************************************************}
{                                                       }
{             Delphi FireMonkey Platform                }
{                                                       }
{              ELT Passage Control Frame                }
{                 ELT 文段控制框架                      }
{                     ELT 1.21                          }
{                                                       }
{    Copyright(c) 2016-2018 Reniasty de El Magnifico    }
{                   天道玄虚 出品                       }
{                 All rights reserved                   }
{                   保留所有权利                        }
{                                                       }
{*******************************************************}

unit ELT_PsgFrame;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, System.Generics.Collections,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, FMX.Edit, FMX.ListBox, FMX.Layouts,
  FMX.Controls.Presentation, FMX.Colors,
  ELT.Main, ELT.Extra, ELT.Windows, FMX.EditBox, FMX.NumberBox;

type
  TPsgFrame = class(TFrame)
    BackGround: TScrollBox;
    BtnLoad: TButton;
    BtnSave: TButton;
    GroupCon: TGroupBox;
    Label15: TLabel;
    SwShowBack: TSwitch;
    Label16: TLabel;
    SwShowImag: TSwitch;
    Label17: TLabel;
    SwMoving: TSwitch;
    Label18: TLabel;
    SwSizing: TSwitch;
    Label19: TLabel;
    SwWheeling: TSwitch;
    GroupChar: TGroupBox;
    Label1: TLabel;
    FontList: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    BtnUl: TButton;
    BtnBd: TButton;
    BtnIt: TButton;
    BtnSO: TButton;
    GroupPara: TGroupBox;
    ALBox: TComboBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    GroupImag: TGroupBox;
    IMInsert: TButton;
    Label14: TLabel;
    Label13: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    SaveDialog: TSaveDialog;
    OpenDialog: TOpenDialog;
    BtnDelete: TButton;
    GroupFind: TGroupBox;
    EditFind: TEdit;
    FindClr: TClearEditButton;
    PosList: TListBox;
    EditReplace: TEdit;
    ReplaceClr: TClearEditButton;
    Label24: TLabel;
    BtnRpAll: TButton;
    BtnRpCancel: TButton;
    BtnRpSkip: TButton;
    BtnRpNext: TButton;
    Label25: TLabel;
    Label4: TLabel;
    BackColor: TComboColorBox;
    Label26: TLabel;
    ColorBox: TComboColorBox;
    BgColorBox: TComboColorBox;
    EditPL: TNumberBox;
    EditPR: TNumberBox;
    EditPT: TNumberBox;
    EditPB: TNumberBox;
    IMWidth: TNumberBox;
    IMHeight: TNumberBox;
    SizeBox: TNumberBox;
    OffsetBox: TNumberBox;
    OpacityList: TNumberBox;
    BgOpacityList: TNumberBox;
    Label27: TLabel;
    Label28: TLabel;
    FIBox: TNumberBox;
    Label29: TLabel;
    LIBox: TNumberBox;
    Label30: TLabel;
    RIBox: TNumberBox;
    Label31: TLabel;
    PBBox: TNumberBox;
    Label32: TLabel;
    PABox: TNumberBox;
    Label33: TLabel;
    LSBox: TNumberBox;
    Label34: TLabel;
    Label35: TLabel;
    SwShowSides: TSwitch;
    Label36: TLabel;
    SidesColor: TComboColorBox;
    Label37: TLabel;
    SidesWidth: TNumberBox;
    BtnDone: TButton;
    GroupIndent: TGroupBox;
    Label38: TLabel;
    LFBox: TNumberBox;
    Label39: TLabel;
    Label40: TLabel;
    LLBox: TNumberBox;
    Label41: TLabel;
    Label42: TLabel;
    LRBox: TNumberBox;
    Label43: TLabel;
    Label44: TLabel;
    ILvBox: TNumberBox;
    Label45: TLabel;
    Label46: TLabel;
    SwFold: TSwitch;
    Label47: TLabel;
    FLColor: TComboColorBox;
    Label48: TLabel;
    FLWidth: TNumberBox;
    procedure SwShowBackClick(Sender: TObject);
    procedure SwShowImagClick(Sender: TObject);
    procedure FontListChange(Sender: TObject);
    procedure SizeBoxChange(Sender: TObject);
    procedure FIBoxChange(Sender: TObject);
    procedure ColorBtnClick(Sender: TObject);
    procedure OffsetBoxChange(Sender: TObject);
    procedure OpacityListChange(Sender: TObject);
    procedure BgOpacityListChange(Sender: TObject);
    procedure LIBoxChange(Sender: TObject);
    procedure RIBoxChange(Sender: TObject);
    procedure PBBoxChange(Sender: TObject);
    procedure PABoxChange(Sender: TObject);
    procedure LSBoxChange(Sender: TObject);
    procedure ALBoxChange(Sender: TObject);
    procedure IMInsertClick(Sender: TObject);
    procedure BtnHTMLClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure BtnLoadClick(Sender: TObject);
    procedure BtnUlClick(Sender: TObject);
    procedure BtnBdClick(Sender: TObject);
    procedure BtnItClick(Sender: TObject);
    procedure BtnSOClick(Sender: TObject);
    procedure SwMovingClick(Sender: TObject);
    procedure SwSizingClick(Sender: TObject);
    procedure SwWheelingClick(Sender: TObject);
    procedure IMWidthChange(Sender: TObject);
    procedure IMHeightChange(Sender: TObject);
    procedure ColorBoxChange(Sender: TObject);
    procedure BgColorBoxChange(Sender: TObject);
    procedure BackColorChange(Sender: TObject);
    procedure EditPLChange(Sender: TObject);
    procedure EditPRChange(Sender: TObject);
    procedure EditPTChange(Sender: TObject);
    procedure EditPBChange(Sender: TObject);
    procedure BtnDeleteClick(Sender: TObject);
    procedure EditFindChange(Sender: TObject);
    procedure PosListClick(Sender: TObject);
    procedure BtnRpAllClick(Sender: TObject);
    procedure EditReplaceChange(Sender: TObject);
    procedure BtnRpNextClick(Sender: TObject);
    procedure BtnRpSkipClick(Sender: TObject);
    procedure BtnRpCancelClick(Sender: TObject);
    procedure BtnRTFClick(Sender: TObject);
    procedure SwShowSidesSwitch(Sender: TObject);
    procedure SidesColorChange(Sender: TObject);
    procedure SidesWidthChange(Sender: TObject);
    procedure LFBoxChange(Sender: TObject);
    procedure LLBoxChange(Sender: TObject);
    procedure LRBoxChange(Sender: TObject);
    procedure SwFoldSwitch(Sender: TObject);
    procedure ILvBoxChange(Sender: TObject);
    procedure FLColorChange(Sender: TObject);
    procedure FLWidthChange(Sender: TObject);
  private
    FPassage: TUIPassage;
    FIsImgUpdating: Boolean;
    procedure SetPassage(const Value: TUIPassage);
    procedure PassageSelChange(Sender: TObject);
    procedure UpdatePassage;
  public
    property Passage:             TUIPassage     read FPassage       write SetPassage;
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.fmx}

{ TConFrame }

procedure TPsgFrame.ALBoxChange(Sender: TObject);
begin
  if (FPassage = nil) or FPassage.IsPsgUpdating then
    Exit;
  case ALBox.ItemIndex of
    0: FPassage.SelStruct.Alignment := TParaAlign.Left;
    1: FPassage.SelStruct.Alignment := TParaAlign.Center;
    2: FPassage.SelStruct.Alignment := TParaAlign.Right;
    3: FPassage.SelStruct.Alignment := TParaAlign.Justify;
    4: FPassage.SelStruct.Alignment := TParaAlign.Stretch;
  end;
end;

procedure TPsgFrame.PassageSelChange(Sender: TObject);
var
  i: Integer;
begin
  if FPassage = nil then
    Exit;
  FIsImgUpdating := True;
  try
    if FPassage.SelImage then
    begin
      IMWidth.Enabled := True;
      IMHeight.Enabled := True;
      IMWidth.Value := FPassage.SelStruct.ImageWidth;
      IMHeight.Value := FPassage.SelStruct.ImageHeight;
    end
    else
    begin
      IMWidth.Enabled := False;
      IMHeight.Enabled := False;
    end;
    for i := 0 to FontList.Count - 1 do
    begin
      if FontList.Items[i] = FPassage.SelStruct.Font then
      begin
        FontList.ItemIndex := i;
        Break;
      end;
    end;
    SizeBox.Value := FPassage.SelStruct.Size;
    OffsetBox.Value := FPassage.SelStruct.Offset;
    ColorBox.Color := FPassage.SelStruct.Color;
    BgColorBox.Color := FPassage.SelStruct.BgColor;
    OpacityList.Value := Trunc(FPassage.SelStruct.Opacity * 100);
    BgOpacityList.Value := Trunc(FPassage.SelStruct.BgOpacity * 100);
    FIBox.Value := FPassage.SelStruct.FirstIndent;
    LIBox.Value := FPassage.SelStruct.LeftOffset;
    RIBox.Value := FPassage.SelStruct.RightOffset;
    PBBox.Value := FPassage.SelStruct.SpaceBefore;
    PABox.Value := FPassage.SelStruct.SpaceAfter;
    LSBox.Value := FPassage.SelStruct.LineSpace;
    case FPassage.SelStruct.Alignment of
      TParaAlign.Left: ALBox.ItemIndex := 0;
      TParaAlign.Center: ALBox.ItemIndex := 1;
      TParaAlign.Right: ALBox.ItemIndex := 2;
      TParaAlign.Justify: ALBox.ItemIndex := 3;
      TParaAlign.Stretch: ALBox.ItemIndex := 4;
    end;
    ILvBox.Value := FPassage.SelStruct.IndentLevel;
    SwFold.IsChecked := FPassage.SelStruct.IsFolded;
  finally
    FIsImgUpdating := False;
  end;
end;

procedure TPsgFrame.BackColorChange(Sender: TObject);
begin
  if FPassage = nil then
    Exit;
  FPassage.Fill.Color := BackColor.Color;
end;

procedure TPsgFrame.BgColorBoxChange(Sender: TObject);
begin
  if (FPassage = nil) or FPassage.IsPsgUpdating then
    Exit;
  FPassage.SelStruct.BgColor := BgColorBox.Color;
end;

procedure TPsgFrame.BgOpacityListChange(Sender: TObject);
begin
  if (FPassage = nil) or FPassage.IsPsgUpdating then
    Exit;
  FPassage.SelStruct.BgOpacity := BgOpacityList.Value / 100;
end;

procedure TPsgFrame.BtnBdClick(Sender: TObject);
begin
  if (FPassage = nil) or FPassage.IsPsgUpdating then
    Exit;
  with FPassage.SelStruct do if TFontStyle.fsBold in Style then
    Style := Style - [TFontStyle.fsBold]
  else
    Style := Style + [TFontStyle.fsBold];
end;

procedure TPsgFrame.BtnDeleteClick(Sender: TObject);
begin
  FPassage.Manager.RemovePassage(FPassage);
  FPassage := nil;
end;

procedure TPsgFrame.BtnItClick(Sender: TObject);
begin
  if (FPassage = nil) or FPassage.IsPsgUpdating then
    Exit;
  with FPassage.SelStruct do if TFontStyle.fsItalic in Style then
    Style := Style - [TFontStyle.fsItalic]
  else
    Style := Style + [TFontStyle.fsItalic];
end;

procedure TPsgFrame.BtnLoadClick(Sender: TObject);
var
  fn: string;
begin
  if FPassage = nil then
    Exit;
  OpenDialog.Filter := 'ELT文段(*.eltp)|*.eltp';
  if OpenDialog.Execute then
    fn := OpenDialog.FileName
  else
    Exit;
  FPassage.LoadFromFile(fn);
  if Assigned(FPassage.OnEnter) then
    FPassage.OnEnter(FPassage);
  UpdatePassage;
end;

procedure TPsgFrame.BtnRpAllClick(Sender: TObject);
var
  s: string;
  i, p: Integer;
  lp: TList<Integer>;
begin
  if (PosList.Items.Count = 0) or (FPassage = nil) then
    Exit;
  lp := TList<Integer>.Create;
  for i := 0 to PosList.Items.Count - 1 do
  begin
    s := PosList.Items[i];
    p := StrToIntDef(s.Substring(1, s.IndexOf(' ') - 1), 0);
    lp.Add(p);
  end;
  FPassage.ReplaceByList(EditFind.Text.Length, lp, EditReplace.Text);
  EditFind.Text := '';
  EditReplace.Text := '';
end;

procedure TPsgFrame.BtnRpCancelClick(Sender: TObject);
begin
  EditFind.Text := '';
  EditReplace.Text := '';
end;

procedure TPsgFrame.BtnRpNextClick(Sender: TObject);
var
  hc: Boolean;
  i, p, d, n: Integer;
  s: string;
begin
  if (FPassage = nil) or (PosList.Items.Count = 0) then
    Exit;
  n := FPassage.SelStart;
  if FPassage.SelText = EditFind.Text then
  begin
    d := EditReplace.Text.Length - EditFind.Text.Length;
    FPassage.SelText := EditReplace.Text;
    hc := True;
    i := 0;
    while i < PosList.Items.Count do
    begin
      s := PosList.Items[i];
      p := StrToIntDef(s.Substring(1, s.IndexOf(' ') - 1), 0);
      if p = n then
      begin
        PosList.Items.Delete(i);
        Dec(i);
      end
      else if p > n then
      begin
        PosList.Items[i] := Format('#%d - %s', [p + d, s.Substring(s.IndexOf(' '))]);
        if hc then
        begin
          FPassage.SetSelInfo(p + d, EditFind.Text.Length);
          hc := False;
        end;
      end;
      Inc(i);
    end;
  end
  else
  begin
    for i := 0 to PosList.Items.Count do
    begin
      s := PosList.Items[i];
      p := StrToIntDef(s.Substring(1, s.IndexOf(' ') - 1), 0);
      if p > FPassage.SelStart then
      begin
        FPassage.SetSelInfo(p, EditFind.Text.Length);
        Exit;
      end;
    end;
  end;
end;

procedure TPsgFrame.BtnRpSkipClick(Sender: TObject);
var
  i, p: Integer;
  s: string;
begin
  if (FPassage = nil) or (PosList.Items.Count = 0) then
    Exit;
  for i := 0 to PosList.Items.Count - 1 do
  begin
    s := PosList.Items[i];
    p := StrToIntDef(s.Substring(1, s.IndexOf(' ') - 1), 0);
    if p > FPassage.SelStart then
    begin
      FPassage.SetSelInfo(p, EditFind.Text.Length);
      Exit;
    end;
  end;
end;

procedure TPsgFrame.BtnRTFClick(Sender: TObject);
var
  fn: string;
begin
  if FPassage = nil then
    Exit;
  SaveDialog.Filter := '富文本文件(*.rtf)|*.rtf';
  SaveDialog.DefaultExt := 'rtf';
  if SaveDialog.Execute then
    fn := SaveDialog.FileName
  else
    Exit;
  FPassage.SaveToRTF(fn);
end;

procedure TPsgFrame.BtnSaveClick(Sender: TObject);
var
  fn, s: string;
begin
  if FPassage = nil then
    Exit;
  SaveDialog.Filter := 'ELT文段(*.eltp)|*.eltp|富文本文件(*.rtf)|*.rtf|网页文件(*.html)|*.html';
  SaveDialog.DefaultExt := 'eltp|rtf|html';
  if SaveDialog.Execute then
    fn := SaveDialog.FileName
  else
    Exit;
  s := fn.Substring(fn.LastIndexOf('.'));
  if s = '.eltp' then
    FPassage.SaveToFile(fn)
  else if s = '.rtf' then
    FPassage.SaveToRTF(fn)
  else if s = '.html' then
    FPassage.SaveToHTML(fn);
  if Assigned(FPassage.OnEnter) then
    FPassage.OnEnter(FPassage);
end;

procedure TPsgFrame.BtnSOClick(Sender: TObject);
begin
  if FPassage = nil then
    Exit;
  with FPassage.SelStruct do
    if TFontStyle.fsStrikeOut in Style then
      Style := Style - [TFontStyle.fsStrikeOut]
    else
      Style := Style + [TFontStyle.fsStrikeOut];
end;

procedure TPsgFrame.BtnUlClick(Sender: TObject);
begin
  if (FPassage = nil) or FPassage.IsPsgUpdating then
    Exit;
  with FPassage.SelStruct do if TFontStyle.fsUnderline in Style then
    Style := Style - [TFontStyle.fsUnderline]
  else
    Style := Style + [TFontStyle.fsUnderline];
end;

procedure TPsgFrame.ColorBoxChange(Sender: TObject);
begin
  if (FPassage = nil) or FPassage.IsPsgUpdating then
    Exit;
  FPassage.SelStruct.Color := ColorBox.Color;
end;

procedure TPsgFrame.ColorBtnClick(Sender: TObject);
begin
  if FPassage = nil then
    Exit;
  FPassage.SelStruct.Color := ColorBox.Color;
end;

constructor TPsgFrame.Create(AOwner: TComponent);
var
  i: Integer;
begin
  inherited;
  FIsImgUpdating := False;
  FontList.Items := GetFonts;
  for i := 0 to FontList.Count - 1 do
    if FontList.Items[i] = '宋体' then
    begin
      FontList.ItemIndex := i;
      Break;
    end;
  with ALBox.Items do
  begin
    Add('左对齐');
    Add('居中对齐');
    Add('右对齐');
    Add('两端对齐');
    Add('拉伸对齐');
  end;
end;

procedure TPsgFrame.EditFindChange(Sender: TObject);
var
  pl: TList<Integer>;
  i: Integer;
  str, s: string;
begin
  if FPassage = nil then
    Exit;
  if EditFind.Text = '' then
  begin
    PosList.Items.Clear;
    Exit;
  end;
  pl := TList<Integer>.Create;
  try
    FPassage.FindPosList(EditFind.Text, str, pl);
    PosList.Items.Clear;
    for i := 0 to pl.Count - 1 do
    begin
      s := str.Substring(pl[i] - 5, 12).Replace(#13, ' ');
      PosList.Items.Add(Format('#%d - %s', [pl[i], s]));
    end;
  finally
    FreeAndNil(pl);
  end;
end;

procedure TPsgFrame.EditPBChange(Sender: TObject);
var
  p: Single;
begin
  if FPassage = nil then
    Exit;
  p := EditPB.Value;
  if p <= 0 then
    p := 0;
  if p <> FPassage.Padding.Bottom then
  begin
    FPassage.Padding.Bottom := p;
    FPassage.Redraw;
  end;
end;

procedure TPsgFrame.EditPLChange(Sender: TObject);
var
  p: Single;
begin
  if FPassage = nil then
    Exit;
  p := EditPL.Value;
  if p <= 0 then
    p := 0;
  if p <> FPassage.Padding.Left then
  begin
    FPassage.Padding.Left := p;
    FPassage.Redraw;
  end;
end;

procedure TPsgFrame.EditPRChange(Sender: TObject);
var
  p: Single;
begin
  if FPassage = nil then
    Exit;
  p := EditPR.Value;
  if p <= 0 then
    p := 0;
  if p <> FPassage.Padding.Right then
  begin
    FPassage.Padding.Right := p;
    FPassage.Redraw;
  end;
end;

procedure TPsgFrame.EditPTChange(Sender: TObject);
var
  p: Single;
begin
  if FPassage = nil then
    Exit;
  p := EditPT.Value;
  if p <= 0 then
    p := 0;
  if p <> FPassage.Padding.Top then
  begin
    FPassage.Padding.Top := p;
    FPassage.Redraw;
  end;
end;

procedure TPsgFrame.EditReplaceChange(Sender: TObject);
var
  i, p: Integer;
  s: string;
begin
  if (FPassage = nil) or (PosList.Items.Count = 0) then
    Exit;
  for i := 0 to PosList.Items.Count do
  begin
    s := PosList.Items[i];
    p := StrToIntDef(s.Substring(1, s.IndexOf(' ') - 1), 0);
    if p >= FPassage.SelStart then
    begin
      FPassage.SetSelInfo(p, EditFind.Text.Length);
      Exit;
    end;
  end;
end;

procedure TPsgFrame.FIBoxChange(Sender: TObject);
begin
  if (FPassage = nil) or FPassage.IsPsgUpdating then
    Exit;
  FPassage.SelStruct.FirstIndent := FIBox.Value;
end;

procedure TPsgFrame.FLColorChange(Sender: TObject);
begin
  if (FPassage = nil) or FPassage.IsPsgUpdating then
    Exit;
  FPassage.FoldLineColor := FLColor.Color;
end;

procedure TPsgFrame.FLWidthChange(Sender: TObject);
begin
  if (FPassage = nil) or FPassage.IsPsgUpdating then
    Exit;
  FPassage.FoldLineWidth := FLWidth.Value;
end;

procedure TPsgFrame.FontListChange(Sender: TObject);
begin
  if (FPassage = nil) or FPassage.IsPsgUpdating then
    Exit;
  FPassage.SelStruct.Font := FontList.Items[FontList.ItemIndex];
end;

procedure TPsgFrame.ILvBoxChange(Sender: TObject);
begin
  if (FPassage = nil) or FPassage.IsPsgUpdating then
    Exit;
  FPassage.SelStruct.IndentLevel := Trunc(ILvBox.Value);
end;

procedure TPsgFrame.IMHeightChange(Sender: TObject);
begin
  if (FPassage = nil) and FIsImgUpdating then
    Exit;
  FIsImgUpdating := True;
  try
    FPassage.SelStruct.ImageHeight := IMHeight.Value;
    IMWidth.Value := FPassage.SelStruct.ImageWidth;
  finally
    FIsImgUpdating := False;
  end;
end;

procedure TPsgFrame.IMInsertClick(Sender: TObject);
var
  fn: string;
begin
  if FPassage = nil then
    Exit;
  OpenDialog.Title := '插图';
  OpenDialog.Filter := '';
  if OpenDialog.Execute then
    fn := OpenDialog.FileName
  else
    Exit;
  FPassage.InsertImage(fn);
end;

procedure TPsgFrame.IMWidthChange(Sender: TObject);
begin
  if (FPassage = nil) and FIsImgUpdating then
    Exit;
  FIsImgUpdating := True;
  try
    FPassage.SelStruct.ImageWidth := IMWidth.Value;
    IMHeight.Value := FPassage.SelStruct.ImageHeight;
  finally
    FIsImgUpdating := False;
  end;
end;

procedure TPsgFrame.LFBoxChange(Sender: TObject);
begin
  if (FPassage = nil) or FPassage.IsPsgUpdating then
    Exit;
  FPassage.LevelFirst := LFBox.Value;
end;

procedure TPsgFrame.LIBoxChange(Sender: TObject);
begin
  if (FPassage = nil) or FPassage.IsPsgUpdating then
    Exit;
  FPassage.SelStruct.LeftOffset := LIBox.Value;
end;

procedure TPsgFrame.LLBoxChange(Sender: TObject);
begin
  if (FPassage = nil) or FPassage.IsPsgUpdating then
    Exit;
  FPassage.LevelLeft := LLBox.Value;
end;

procedure TPsgFrame.LRBoxChange(Sender: TObject);
begin
  if (FPassage = nil) or FPassage.IsPsgUpdating then
    Exit;
  FPassage.LevelRight := LRBox.Value;
end;

procedure TPsgFrame.LSBoxChange(Sender: TObject);
begin
  if (FPassage = nil) or FPassage.IsPsgUpdating then
    Exit;
  FPassage.SelStruct.LineSpace := LSBox.Value;
end;

procedure TPsgFrame.OffsetBoxChange(Sender: TObject);
begin
  if (FPassage = nil) or FPassage.IsPsgUpdating then
    Exit;
  FPassage.SelStruct.Offset := OffsetBox.Value;
end;

procedure TPsgFrame.OpacityListChange(Sender: TObject);
begin
  if (FPassage = nil) or FPassage.IsPsgUpdating then
    Exit;
  FPassage.SelStruct.Opacity := OpacityList.Value / 100;
end;

procedure TPsgFrame.BtnHTMLClick(Sender: TObject);
var
  fn: string;
begin
  if FPassage = nil then
    Exit;
  SaveDialog.Filter := '网页文件(*.html)|*.html';
  SaveDialog.DefaultExt := 'html';
  if SaveDialog.Execute then
    fn := SaveDialog.FileName
  else
    Exit;
  FPassage.SaveToHTML(fn);
end;

procedure TPsgFrame.PABoxChange(Sender: TObject);
begin
  if (FPassage = nil) or FPassage.IsPsgUpdating then
    Exit;
  FPassage.SelStruct.SpaceAfter := PABox.Value
end;

procedure TPsgFrame.PBBoxChange(Sender: TObject);
begin
  if (FPassage = nil) or FPassage.IsPsgUpdating then
    Exit;
  FPassage.SelStruct.SpaceBefore := PBBox.Value
end;

procedure TPsgFrame.PosListClick(Sender: TObject);
var
  p: Integer;
  s: string;
begin
  if FPassage = nil then
    Exit;
  if PosList.ItemIndex >= 0 then
  begin
    s := PosList.Items[PosList.ItemIndex];
    p := StrToIntDef(s.Substring(1, s.IndexOf(' ') - 1), 0);
    FPassage.SetSelInfo(p, EditFind.Text.Length);
  end;
end;

procedure TPsgFrame.RIBoxChange(Sender: TObject);
begin
  if (FPassage = nil) or FPassage.IsPsgUpdating then
    Exit;
  FPassage.SelStruct.RightOffset := RIBox.Value
end;

procedure TPsgFrame.SetPassage(const Value: TUIPassage);
begin
  if Value <> nil then
  begin
    if FPassage <> Value then
    begin
      if FPassage <> nil then
      begin
        FPassage.OnSelChange := nil;
        FPassage.DisableUndo;
      end;
      FPassage := Value;
      FPassage.EnableUndo(16);
      FPassage.BeginUpdating;
      try
        FPassage.OnSelChange := PassageSelChange;
        PassageSelChange(FPassage);
        case FPassage.Fill.Kind of
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
              BackColor.Color := FPassage.Fill.Color;
            end;
          TBrushKind.Bitmap:
            begin
              SwShowBack.IsChecked := True;
              SwShowImag.IsChecked := True;
              SwShowImag.Enabled := True;
              BackColor.Enabled := False;
            end;
        end;
        if TMouseInfo.Moving in FPassage.MouseCon then
          SwMoving.IsChecked := True
        else
          SwMoving.IsChecked := False;
        if TMouseInfo.Sizing in FPassage.MouseCon then
          SwSizing.IsChecked := True
        else
          SwSizing.IsChecked := False;
        if TMouseInfo.Wheeling in FPassage.MouseCon then
          SwWheeling.IsChecked := True
        else
          SwWheeling.IsChecked := False;
        EditPL.Value := FPassage.Padding.Left;
        EditPR.Value := FPassage.Padding.Right;
        EditPT.Value := FPassage.Padding.Top;
        EditPB.Value := FPassage.Padding.Bottom;
        LFBox.Value := FPassage.LevelFirst;
        LLBox.Value := FPassage.LevelLeft;
        LRBox.Value := FPassage.LevelRight;
        FLColor.Color := FPassage.FoldLineColor;
        FLWidth.Value := FPassage.FoldLineWidth;
      finally
        FPassage.EndUpdating;
      end;
    end;
  end
  else
  begin
    if FPassage <> nil then
    begin
      FPassage.OnSelChange := nil;
      FPassage.DisableUndo;
    end;
    FPassage := nil;
  end;
end;

procedure TPsgFrame.SidesColorChange(Sender: TObject);
begin
  if FPassage = nil then
    Exit;
  FPassage.SidesColor := SidesColor.Color;
end;

procedure TPsgFrame.SidesWidthChange(Sender: TObject);
begin
  if Fpassage = nil then
    Exit;
  Fpassage.SidesWidth := SidesWidth.Value;
end;

procedure TPsgFrame.SizeBoxChange(Sender: TObject);
begin
  if (FPassage = nil) or FPassage.IsPsgUpdating then
    Exit;
  FPassage.SelStruct.Size := SizeBox.Value;
end;

procedure TPsgFrame.SwFoldSwitch(Sender: TObject);
begin
  if (FPassage = nil) or FPassage.IsPsgUpdating then
    Exit;
  FPassage.SelStruct.IsFolded := SwFold.IsChecked;
end;

procedure TPsgFrame.SwMovingClick(Sender: TObject);
begin
  if FPassage = nil then
    Exit;
  if SwMoving.IsChecked then
    FPassage.MouseCon := FPassage.MouseCon + [TMouseInfo.Moving]
  else
    FPassage.MouseCon := FPassage.MouseCon - [TMouseInfo.Moving];
  FPassage.Repaint;
  FPassage.SetFocus;
end;

procedure TPsgFrame.SwShowBackClick(Sender: TObject);
begin
  if FPassage = nil then
    Exit;
  if SwShowBack.IsChecked then
  begin
    FPassage.Fill.Kind := TBrushKind.Solid;
    FPassage.Fill.Color := BackColor.Color;
    SwShowImag.Enabled := True;
    BackColor.Enabled := True;
  end
  else
  begin
    FPassage.Fill.Kind := TBrushKind.None;
    SwShowImag.IsChecked := False;
    SwShowImag.Enabled := False;
    BackColor.Enabled := False;
  end;
  FPassage.SetFocus;
end;

procedure TPsgFrame.SwShowImagClick(Sender: TObject);
begin
  if FPassage = nil then
    Exit;
  if SwShowImag.IsChecked then
  begin
    OpenDialog.Title := '图像背景';
    OpenDialog.Filter := '';
    if OpenDialog.Execute then
    begin
      FPassage.SetBackground(OpenDialog.FileName);
      BackColor.Enabled := False;
    end
    else
    begin
      FPassage.Fill.Kind := TBrushKind.Bitmap;
      BackColor.Enabled := False;
    end
  end
  else
  begin
    FPassage.Fill.Kind := TBrushKind.Solid;
    FPassage.Fill.Color := BackColor.Color;
    BackColor.Enabled := True;
  end;
  FPassage.SetFocus;
end;

procedure TPsgFrame.SwShowSidesSwitch(Sender: TObject);
begin
  if FPassage = nil then
    Exit;
  if SwShowSides.IsChecked then
  begin
    SidesColor.Enabled := True;
    SidesWidth.Enabled := True;
    FPassage.ShowSides := True;
    SidesColor.Color := FPassage.SidesColor;
    SidesWidth.Value := FPassage.SidesWidth;
  end
  else
  begin
    SidesColor.Enabled := False;
    FPassage.ShowSides := False;
    SidesWidth.Enabled := False;
  end;
  FPassage.SetFocus;
end;

procedure TPsgFrame.SwSizingClick(Sender: TObject);
begin
  if FPassage = nil then
    Exit;
  if SwSizing.IsChecked then
    FPassage.MouseCon := FPassage.MouseCon + [TMouseInfo.Sizing]
  else
    FPassage.MouseCon := FPassage.MouseCon - [TMouseInfo.Sizing];
  FPassage.Repaint;
  FPassage.SetFocus;
end;

procedure TPsgFrame.SwWheelingClick(Sender: TObject);
begin
  if FPassage = nil then
    Exit;
  if SwWheeling.IsChecked then
    FPassage.MouseCon := FPassage.MouseCon + [TMouseInfo.Wheeling]
  else
    FPassage.MouseCon := FPassage.MouseCon - [TMouseInfo.Wheeling];
  FPassage.Repaint;
  FPassage.SetFocus;
end;

procedure TPsgFrame.UpdatePassage;
begin
  FPassage.BeginUpdating;
  try
    FPassage.OnSelChange := PassageSelChange;
    PassageSelChange(FPassage);
    case FPassage.Fill.Kind of
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
          BackColor.Color := FPassage.Fill.Color;
        end;
      TBrushKind.Bitmap:
        begin
          SwShowBack.IsChecked := True;
          SwShowImag.IsChecked := True;
          SwShowImag.Enabled := True;
          BackColor.Enabled := False;
        end;
    end;
    if TMouseInfo.Moving in FPassage.MouseCon then
      SwMoving.IsChecked := True
    else
      SwMoving.IsChecked := False;
    if TMouseInfo.Sizing in FPassage.MouseCon then
      SwSizing.IsChecked := True
    else
      SwSizing.IsChecked := False;
    if TMouseInfo.Wheeling in FPassage.MouseCon then
      SwWheeling.IsChecked := True
    else
      SwWheeling.IsChecked := False;
    EditPL.Value := FPassage.Padding.Left;
    EditPR.Value := FPassage.Padding.Right;
    EditPT.Value := FPassage.Padding.Top;
    EditPB.Value := FPassage.Padding.Bottom;
    LFBox.Value := FPassage.LevelFirst;
    LLBox.Value := FPassage.LevelLeft;
    LRBox.Value := FPassage.LevelRight;
    FLColor.Color := FPassage.FoldLineColor;
    FLWidth.Value := FPassage.FoldLineWidth;
  finally
    FPassage.EndUpdating;
  end;
end;

end.
