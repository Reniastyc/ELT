{*******************************************************}
{                                                       }
{             Delphi FireMonkey Platform                }
{                                                       }
{                     ELT Extra                         }
{                   ELT 额外函数                        }
{                     ELT 1.22                         }
{                                                       }
{    Copyright(c) 2016-2018 Reniasty de El Magnifico    }
{                   天道玄虚 出品                       }
{                 All rights reserved                   }
{                   保留所有权利                        }
{                                                       }
{*******************************************************}

unit ELT.Extra;

interface

uses
  System.Classes, System.SysUtils, System.ZLib, System.UITypes;

type
  TManagerEvent = procedure(Sender, Control: TObject) of object;

  TCharAttrib = (Font, Size, Opacity, BgOpacity, Offset, Color, BgColor, Style);
  TCharEffect = (Text, Image);
  TManagerInfo = (Create, Move);
  TMouseInfo = (Moving, Sizing, Wheeling);
  TMouseInfos = set of TMouseInfo;
  TParaAlign = (Left, Center, Right, Justify, Stretch);

  PCharSct = ^TCharSct;
  TCharSct = record
    Font:                    Integer;       // 字体列表编号
    Size:                    Single;        // 字体大小
    Opacity:                 Single;        // 字体透明度
    BgOpacity:               Single;        // 背景透明度
    Offset:                  Single;        // 字体偏移
    Color:                   Cardinal;      // 字体颜色
    BgColor:                 Cardinal;      // 背景颜色
    Style:                   TFontStyles;   // 字体属性
    Effect:                  TCharEffect;   // 效果（文字、图像等）
  end;

  PParaSct = ^TParaSct;
  TParaSct = record
    FirstIndent:             Single;        // 首行缩进
    LeftOffset:              Single;        // 左侧偏移
    RightOffset:             Single;        // 右侧偏移
    SpaceBefore:             Single;        // 段前间距
    SpaceAfter:              Single;        // 段后间距
    LineSpace:               Single;        // 行后间距
    Alignment:               TParaAlign;    // 对齐方式
    IndentLevel:             Integer;       // 缩进级别
    IsFolded:                Boolean;       // 是否折叠
    // 临时储存，由绘图获得
    IsShowed:                Boolean;       // 是否被显示（仅用于记录）
  end;

  PSctStr = ^TSctStr;
  TSctStr = record
    Sct:                     PCharSct;
    Str:                     string;
  end;

function CharSct(Font: Integer; Size, Opacity, BgOpacity, Offset: Single; Color, BgColor: Cardinal;
  Style: TFontStyles; Effect: TCharEffect): TCharSct;
function CharSctP(Font: Integer; Size, Opacity, BgOpacity, Offset: Single; Color, BgColor: Cardinal;
  Style: TFontStyles; Effect: TCharEffect): PCharSct; overload;
function CharSctP(ACharSct: TCharSct): PCharSct; overload; // 生成原有结构体副本的指针
function CharSctSame(CS1, CS2: TCharSct): Boolean;
procedure CopyCharSct(PCS: PCharSct; ACS: TCharSct);

function ParaSct(FirstIndent, LeftOffset, RightOffset, SpaceBefore, SpaceAfter,
  LineSpace: Single; Alignment: TParaAlign; IndentLevel: Integer; IsFolded: Boolean): TParaSct;
function ParaSctP(FirstIndent, LeftOffset, RightOffset, SpaceBefore, SpaceAfter,
  LineSpace: Single; Alignment: TParaAlign; IndentLevel: Integer; IsFolded: Boolean): PParaSct; overload;
function ParaSctP(AParaSct: TParaSct): PParaSct; overload;
function ParaSctSame(PS1, PS2: TParaSct): Boolean;
procedure CopyParaSct(PPS: PParaSct; APS: TParaSct);

function SctStr(Sct: PCharSct; Str: string): TSctStr;
function SctStrP(Sct: PCharSct; Str: string): PSctStr; overload;
function SctStrP(Sct: TCharSct; Str: string): PSctStr; overload; // 获取结构体副本的指针
procedure SetStrSct(ASctStr: PSctStr; ACharSct: TCharSct); // 将结构体复制

function AlphaOrNum(AChar: Char): Boolean; inline;

function GetFileName(Path: string): string; inline;
function GetDirectory(Path: string): string; inline;

function Larger2(a1, a2, b1, b2: Integer): Boolean;
function Equal2(a1, a2, b1, b2: Integer): Boolean; inline;
function Smaller2(a1, a2, b1, b2: Integer): Boolean;
function Larger3(a1, a2, a3, b1, b2, b3: Integer): Boolean;
function Equal3(a1, a2, a3, b1, b2, b3: Integer): Boolean; inline;
function Smaller3(a1, a2, a3, b1, b2, b3: Integer): Boolean;

function ColorToRTFCode(AColor: TAlphaColor): string;
function StreamToRTFCode(AStream: TStream): string;
function StrToRTFCode(AStr: string): string;
function RTFCodeToColor(Code: string): TAlphaColor;
function RTFCodeToStream(Code: string): TStream;
function RTFCodeToStr(Code: string): string;

implementation

function CharSct(Font: Integer; Size, Opacity, BgOpacity, Offset: Single; Color, BgColor: Cardinal;
  Style: TFontStyles; Effect: TCharEffect): TCharSct;
begin
  Result.Font := Font;
  Result.Size := Size;
  Result.Opacity := Opacity;
  Result.BgOpacity := BgOpacity;
  Result.Offset := Offset;
  Result.Color := Color;
  Result.BgColor := BgColor;
  Result.Style := Style;
  Result.Effect := Effect;
end;

function CharSctP(Font: Integer; Size, Opacity, BgOpacity, Offset: Single; Color, BgColor: Cardinal;
  Style: TFontStyles; Effect: TCharEffect): PCharSct;
begin
  New(Result);
  Result.Font := Font;
  Result.Size := Size;
  Result.Opacity := Opacity;
  Result.BgOpacity := BgOpacity;
  Result.Offset := Offset;
  Result.Color := Color;
  Result.BgColor := BgColor;
  Result.Style := Style;
  Result.Effect := Effect;
end;

function CharSctP(ACharSct: TCharSct): PCharSct;
begin
  New(Result);
  with ACharSct do
  begin
    Result.Font := Font;
    Result.Size := Size;
    Result.Opacity := Opacity;
    Result.BgOpacity := BgOpacity;
    Result.Offset := Offset;
    Result.Color := Color;
    Result.BgColor := BgColor;
    Result.Style := Style;
    Result.Effect := Effect;
  end;
end;

function CharSctSame(CS1, CS2: TCharSct): Boolean;
begin
  with CS1 do
  if (Font = CS2.Font) and (Size = CS2.Size) and (Opacity = CS2.Opacity)
    and (BgOpacity = CS2.BgOpacity) and (Offset = CS2.Offset) and (Color = CS2.Color)
    and (BgColor = CS2.BgColor) and (Style = CS2.Style) and (Effect = CS2.Effect) then
    Exit(True)
  else
    Exit(False);
end;

procedure CopyCharSct(PCS: PCharSct; ACS: TCharSct);
begin
  with ACS do
  begin
    PCS.Font := Font;
    PCS.Size := Size;
    PCS.Opacity := Opacity;
    PCS.BgOpacity := BgOpacity;
    PCS.Offset := Offset;
    PCS.Color := Color;
    PCS.BgColor := BgColor;
    PCS.Style := Style;
    PCS.Effect := Effect;
  end;
end;

function ParaSct(FirstIndent, LeftOffset, RightOffset, SpaceBefore, SpaceAfter,
  LineSpace: Single; Alignment: TParaAlign; IndentLevel: Integer; IsFolded: Boolean): TParaSct;
begin
  Result.FirstIndent := FirstIndent;
  Result.LeftOffset := LeftOffset;
  Result.RightOffset := RightOffset;
  Result.SpaceBefore := SpaceBefore;
  Result.SpaceAfter := SpaceAfter;
  Result.LineSpace := LineSpace;
  Result.Alignment := Alignment;
  Result.IndentLevel := IndentLevel;
  Result.IsFolded := IsFolded;
end;

function ParaSctP(FirstIndent, LeftOffset, RightOffset, SpaceBefore, SpaceAfter,
  LineSpace: Single; Alignment: TParaAlign; IndentLevel: Integer; IsFolded: Boolean): PParaSct;
begin
  New(Result);
  Result.FirstIndent := FirstIndent;
  Result.LeftOffset := LeftOffset;
  Result.RightOffset := RightOffset;
  Result.SpaceBefore := SpaceBefore;
  Result.SpaceAfter := SpaceAfter;
  Result.LineSpace := LineSpace;
  Result.Alignment := Alignment;
  Result.IndentLevel := IndentLevel;
  Result.IsFolded := IsFolded;
end;

function ParaSctP(AParaSct: TParaSct): PParaSct;
begin
  New(Result);
  with AParaSct do
  begin
    Result.FirstIndent := FirstIndent;
    Result.LeftOffset := LeftOffset;
    Result.RightOffset := RightOffset;
    Result.SpaceBefore := SpaceBefore;
    Result.SpaceAfter := SpaceAfter;
    Result.LineSpace := LineSpace;
    Result.Alignment := Alignment;
    Result.IndentLevel := IndentLevel;
    Result.IsFolded := IsFolded;
  end;
end;

function ParaSctSame(PS1, PS2: TParaSct): Boolean;
begin
  with PS1 do
  if (FirstIndent = PS2.FirstIndent) and (LeftOffset = PS2.LeftOffset) and (RightOffset = PS2.RightOffset)
    and (SpaceBefore = PS2.SpaceBefore) and (SpaceAfter = PS2.SpaceAfter) and (LineSpace = PS2.LineSpace)
    and (Alignment = PS2.Alignment) and (IndentLevel = PS2.IndentLevel) and (IsFolded = PS2.IsFolded) then
    Exit(True)
  else
    Exit(False);
end;

procedure CopyParaSct(PPS: PParaSct; APS: TParaSct);
begin
  with APS do
  begin
    PPS.FirstIndent := FirstIndent;
    PPS.LeftOffset := LeftOffset;
    PPS.RightOffset := RightOffset;
    PPS.SpaceBefore := SpaceBefore;
    PPS.SpaceAfter := SpaceAfter;
    PPS.LineSpace := LineSpace;
    PPS.Alignment := Alignment;
    PPS.IndentLevel := IndentLevel;
    PPS.IsFolded := IsFolded;
  end;
end;

function SctStr(Sct: PCharSct; Str: string): TSctStr;
begin
  Result.Sct := Sct;
  Result.Str := Str;
end;

function SctStrP(Sct: PCharSct; Str: string): PSctStr;
begin
  New(Result);
  Result.Sct := Sct;
  Result.Str := Str;
end;

function SctStrP(Sct: TCharSct; Str: string): PSctStr;
begin
  New(Result);
  Result.Sct := CharSctP(Sct);
  Result.Str := Str;
end;

procedure SetStrSct(ASctStr: PSctStr; ACharSct: TCharSct);
begin
  Dispose(ASctStr.Sct);
  ASctStr.Sct := CharSctP(ACharSct);
end;

function AlphaOrNum(AChar: Char): Boolean;
begin
  case AChar of
    '0' .. '9', '.', 'A' .. 'Z', 'a' .. 'z', '_': Exit(True);
  else
    Exit(False);
  end
end;

function GetFileName(Path: string): string;
begin
  Exit(Path.Substring(Path.LastIndexOf(PathDelim) + 1));
end;

function GetDirectory(Path: string): string;
begin
  Exit(Path.Substring(0, Path.LastIndexOf(PathDelim)));
end;

function Larger2(a1, a2, b1, b2: Integer): Boolean;
begin
  if a1 > b1 then
    Exit(True)
  else if a1 < b1 then
    Exit(False);
  if a2 > b2 then
    Exit(True)
  else if a2 < b2 then
    Exit(False);
  Exit(False);
end;

function Equal2(a1, a2, b1, b2: Integer): Boolean;
begin
  Exit((a1 = b1) and (a2 = b2));
end;

function Smaller2(a1, a2, b1, b2: Integer): Boolean;
begin
  if a1 < b1 then
    Exit(True)
  else if a1 > b1 then
    Exit(False);
  if a2 < b2 then
    Exit(True)
  else if a2 > b2 then
    Exit(False);
  Exit(False);
end;

function Larger3(a1, a2, a3, b1, b2, b3: Integer): Boolean;
begin
  if a1 > b1 then
    Exit(True)
  else if a1 < b1 then
    Exit(False);
  if a2 > b2 then
    Exit(True)
  else if a2 < b2 then
    Exit(False);
  if a3 > b3 then
    Exit(True)
  else if a3 < b3 then
    Exit(False);
  Exit(False);
end;

function Equal3(a1, a2, a3, b1, b2, b3: Integer): Boolean;
begin
  Exit((a1 = b1) and (a2 = b2) and (a3 = b3));
end;

function Smaller3(a1, a2, a3, b1, b2, b3: Integer): Boolean;
begin
  if a1 < b1 then
    Exit(True)
  else if a1 > b1 then
    Exit(False);
  if a2 < b2 then
    Exit(True)
  else if a2 > b2 then
    Exit(False);
  if a3 < b3 then
    Exit(True)
  else if a3 > b3 then
    Exit(False);
  Exit(False);
end;

function ColorToRTFCode(AColor: TAlphaColor): string;
begin
  with TAlphaColorRec(AColor) do
    Exit(Format('\red%d\green%d\blue%d;', [R, G, B]));
end;

function StreamToRTFCode(AStream: TStream): string;
var
  bs: TBytes;
  i, l: Integer;
  s: string;
begin
  l := AStream.Size;
  SetLength(bs, l);
  AStream.ReadBuffer(bs, l);
  s := '';
  for i := 0 to Length(bs) - 1 do
    s := s + IntToHex(bs[i], 2);
  Exit(s);
end;

function StrToRTFCode(AStr: string): string;
var
  s: string;
  bs: TBytes;
  i: Integer;
begin
  bs := BytesOf(AStr);
  s := '';
  for i := 0 to Length(bs) - 1 do
  begin
    if bs[i] >= 127 then
      s := s + Format('\''%s', [IntToHex(bs[i], 2)])
    else if Chr(bs[i]) = '\'  then
      s := s + '\\'
    else
      s := s + Chr(bs[i]);
  end;
  Exit(s);
end;

function RTFCodeToColor(Code: string): TAlphaColor;
var
  tr, tg, tb: Byte;
  i, j: Integer;
  c: TAlphaColor;
begin
  tr := 0;
  tg := 0;
  tb := 0;
  j := 0;
  if Code.Substring(0, 4) = '\red' then
  begin
    j := Code.IndexOf('\', 1);
    i := StrToIntDef(Code.Substring(4, j - 3), 0);
    tr := i mod 256;
  end;
  Code := Code.Substring(j);
  if Code.Substring(0, 6) = '\green' then
  begin
    j := Code.IndexOf('\', 1);
    i := StrToIntDef(Code.Substring(6, j - 5), 0);
    tg := i mod 256;
  end;
  Code := Code.Substring(j);
  if Code.Substring(0, 5) = '\blue' then
  begin
    j := Code.IndexOf('\', 1);
    i := StrToIntDef(Code.Substring(5, j - 4), 0);
    tb := i mod 256;
  end;
  with TAlphaColorRec(c) do
  begin
    A := 255;
    R := tr;
    G := tg;
    B := tb;
  end;
  Exit(c);
end;

function RTFCodeToStream(Code: string): TStream;
var
  bs: TBytes;
  i, l: Integer;
  AStream: TStream;
begin
  l := Code.Length div 2;
  SetLength(bs, l);
  for i := 0 to l - 1 do
    bs[i] := StrToIntDef('$' + Code.Substring(i * 2, 2), 0);
  AStream := TStream.Create;
  AStream.WriteBuffer(bs, l);
  Exit(AStream);
end;

function RTFCodeToStr(Code: string): string;
var
  s: string;
  bs: TBytes;
  i: Integer;
begin
  s := '';
  SetLength(bs, 2);
  i := 0;
  while i < Code.Length do
  begin
    if Code.Chars[i] = '\' then
    begin
      if Code.Substring(i, 2) = '\\' then
      begin
        s := s + '\';
        Inc(i, 2);
      end
      else if (Code.Substring(i, 2) = '\''') and (Code.Substring(i + 4, 2) = '\''') then
      begin
        bs[0] := StrToInt('$' + Code.Substring(i + 2, 2));
        bs[1] := StrToInt('$' + Code.Substring(i + 6, 2));
        s := s + StringOf(bs);
        Inc(i, 8);
      end;
    end
    else
    begin
      s := s + Code.Chars[i];
      Inc(i);
    end;
  end;
  Exit(s);
end;

end.
