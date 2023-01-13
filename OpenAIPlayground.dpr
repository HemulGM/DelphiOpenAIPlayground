program OpenAIPlayground;

uses
  System.StartUpCopy,
  FMX.Forms,
  ChatGPT.Main in 'ChatGPT.Main.pas' {FormMain},
  ChatGPT.Frame.Code in 'ChatGPT.Frame.Code.pas' {FrameCode: TFrame},
  ChatGPT.Frame.Score in 'ChatGPT.Frame.Score.pas' {FrameScore: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
