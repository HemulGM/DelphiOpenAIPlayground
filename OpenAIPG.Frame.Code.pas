unit OpenAIPG.Frame.Code;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Controls.Presentation, FMX.Memo.Types, FMX.ScrollBox,
  FMX.Memo;

type
  TFrameCode = class(TFrame)
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    LabelTitle: TLabel;
    ButtonCopy: TButton;
    MemoCode: TMemo;
    procedure ButtonCopyClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  FMX.platform;

{$R *.fmx}

procedure CopyToClipboard(const Text: string); overload;
var
  Clipboard: IFMXClipboardService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService) then
  begin
    Clipboard := IFMXClipboardService(TPlatformServices.Current.GetPlatformService(IFMXClipboardService));
    Clipboard.SetClipboard(Text);
  end;
end;

procedure TFrameCode.ButtonCopyClick(Sender: TObject);
begin
  CopyToClipboard(MemoCode.Lines.Text);
end;

end.

