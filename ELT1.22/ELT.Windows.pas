{*******************************************************}
{                                                       }
{             Delphi FireMonkey Platform                }
{                                                       }
{               ELT Windows OS Add-Ons                  }
{                 ELT Windows 插件                      }
{                     ELT 1.22                          }
{                                                       }
{    Copyright(c) 2016-2018 Reniasty de El Magnifico    }
{                   天道玄虚 出品                       }
{                 All rights reserved                   }
{                   保留所有权利                        }
{                                                       }
{*******************************************************}

unit ELT.Windows;

interface

uses
  System.SysUtils, System.Classes, Winapi.Windows;

function GetFonts: TStringList;
function GetTempDirectory: string;

implementation

function EnumFontsProc(var LogFont: TLogFont; var TextMetric: TTextMetric; FontType: Integer;
  Data: Pointer): Integer; stdcall;
var
  S: TStrings;
  Temp: string;
begin
  S := TStrings(Data);
  Temp := LogFont.lfFaceName;
  if (S.Count = 0) or (AnsiCompareText(S[S.Count- 1], Temp) <> 0) then
    S.Add(Temp);
  Result := 1;
end;

function GetFonts: TStringList;
var
  DC: HDC;
  LFont: TLogFont;
  FFonts: TStringList;
begin
  FFonts := TStringList.Create;
  DC := GetDC(0);
  try
    FillChar(LFont, SizeOf(LFont), 0);
    LFont.lfCharSet := DEFAULT_CHARSET;
    EnumFontFamiliesEx(DC, LFont, @EnumFontsProc, Winapi.Windows.LPARAM(FFonts), 0);
    FFonts.Sorted := True;
  finally
    ReleaseDC(0, DC);
  end;
  Exit(FFonts);
end;

function GetTempDirectory: string;
var
  lpBuffer: array[0..MAX_PATH] of Char;
begin
  GetTempPath(MAX_PATH, @lpBuffer);
  Result := StrPas(lpBuffer);
end;

end.
