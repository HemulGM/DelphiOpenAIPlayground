program OpenAIPlayground;

uses
  System.StartUpCopy,
  FMX.Forms,
  OpenAIPG.Main in 'OpenAIPG.Main.pas' {FormMain},
  OpenAIPG.Frame.Code in 'OpenAIPG.Frame.Code.pas' {FrameCode: TFrame},
  OpenAIPG.Frame.Score in 'OpenAIPG.Frame.Score.pas' {FrameScore: TFrame},
  OpenAI.API.Params in 'DelphiOpenAI\OpenAI.API.Params.pas',
  OpenAI.API in 'DelphiOpenAI\OpenAI.API.pas',
  OpenAI.Completions in 'DelphiOpenAI\OpenAI.Completions.pas',
  OpenAI.Edits in 'DelphiOpenAI\OpenAI.Edits.pas',
  OpenAI.Embeddings in 'DelphiOpenAI\OpenAI.Embeddings.pas',
  OpenAI.Engines in 'DelphiOpenAI\OpenAI.Engines.pas',
  OpenAI.Errors in 'DelphiOpenAI\OpenAI.Errors.pas',
  OpenAI.Files in 'DelphiOpenAI\OpenAI.Files.pas',
  OpenAI.FineTunes in 'DelphiOpenAI\OpenAI.FineTunes.pas',
  OpenAI.Images in 'DelphiOpenAI\OpenAI.Images.pas',
  OpenAI.Models in 'DelphiOpenAI\OpenAI.Models.pas',
  OpenAI.Moderations in 'DelphiOpenAI\OpenAI.Moderations.pas',
  OpenAI in 'DelphiOpenAI\OpenAI.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
