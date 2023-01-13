unit ChatGPT.Frame.Score;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Controls.Presentation;

type
  TFrameScore = class(TFrame)
    LabelTitle: TLabel;
    RectangleValue: TRectangle;
    procedure FrameResize(Sender: TObject);
  private
    FValue: Single;
    procedure SetValue(const Value: Single);
    procedure UpdateValue;
  public
    property Value: Single read FValue write SetValue;
  end;

implementation

uses
  System.Math;

{$R *.fmx}

{ TFrameScore }

procedure TFrameScore.UpdateValue;
begin
  RectangleValue.Width := Max((Width * FValue), RectangleValue.Height);
end;

procedure TFrameScore.FrameResize(Sender: TObject);
begin
  UpdateValue;
end;

procedure TFrameScore.SetValue(const Value: Single);
begin
  FValue := Value;
  UpdateValue;
end;

end.

