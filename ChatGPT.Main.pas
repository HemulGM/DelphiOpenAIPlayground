unit ChatGPT.Main;

interface

uses
  Winapi.Windows, System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Memo.Types,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo, OpenAI,
  FMX.Objects, FMX.Layouts, FMX.TabControl, FMX.ListBox, ChatGPT.Frame.Code,
  FMX.Edit, System.ImageList, FMX.ImgList, FMX.Effects, FMX.Filter.Effects,
  FMX.EditBox, FMX.SpinBox, FMX.ComboEdit, ChatGPT.Frame.Score, OpenAI.Models,
  OpenAI.Images;

type
  TFormMain = class(TForm)
    LayoutMenu: TLayout;
    TabControlMain: TTabControl;
    TabItemModels: TTabItem;
    TabItemCompletions: TTabItem;
    TabItemEdits: TTabItem;
    TabItemImages: TTabItem;
    TabItemEmbeddings: TTabItem;
    TabItemFiles: TTabItem;
    TabItemFinetunes: TTabItem;
    TabItemModerations: TTabItem;
    TabItemEngines: TTabItem;
    Layout2: TLayout;
    Rectangle1: TRectangle;
    StyleBook: TStyleBook;
    VertScrollBoxMenu: TVertScrollBox;
    LayoutExModels: TLayout;
    CheckBoxModels: TCheckBox;
    ButtonModelList: TButton;
    ButtonModelRetreive: TButton;
    LayoutExImages: TLayout;
    CheckBoxImages: TCheckBox;
    ButtonImageCreate: TButton;
    LayoutExCompletions: TLayout;
    CheckBoxCompletions: TCheckBox;
    ButtonCompletionCreate: TButton;
    LayoutExEmbeddings: TLayout;
    CheckBoxEmbeddings: TCheckBox;
    ButtonEmbeddingCreate: TButton;
    LayoutExEdits: TLayout;
    CheckBoxEdits: TCheckBox;
    ButtonEditCreate: TButton;
    LayoutExModerations: TLayout;
    CheckBoxModerations: TCheckBox;
    ButtonModerationCreate: TButton;
    VertScrollBoxModels: TVertScrollBox;
    LabelModelList: TLabel;
    Label1: TLabel;
    VertScrollBoxCompletions: TVertScrollBox;
    Label2: TLabel;
    Label3: TLabel;
    Layout1: TLayout;
    ListBoxModels: TListBox;
    Rectangle2: TRectangle;
    Layout3: TLayout;
    Line1: TLine;
    ButtonModelListExecute: TButton;
    Layout4: TLayout;
    FrameCode1: TFrameCode;
    AniIndicatorModels: TAniIndicator;
    LabelRetrieveModel: TLabel;
    Label5: TLabel;
    Layout5: TLayout;
    FrameCode2: TFrameCode;
    Layout6: TLayout;
    Rectangle3: TRectangle;
    Layout7: TLayout;
    Line2: TLine;
    ButtonModelRetreiveExecute: TButton;
    AniIndicatorModelRetreive: TAniIndicator;
    MemoModel: TMemo;
    EditModelId: TEdit;
    ImageList: TImageList;
    ButtonGitHub: TButton;
    ButtonOpenAI: TButton;
    Path1: TPath;
    TabItemHome: TTabItem;
    VertScrollBoxHome: TVertScrollBox;
    Label8: TLabel;
    Layout8: TLayout;
    ButtonGoToAPIKeys: TButton;
    Label4: TLabel;
    Layout9: TLayout;
    EditToken: TEdit;
    LabelCompletions: TLabel;
    Label9: TLabel;
    LabelComplCreate: TLabel;
    Label11: TLabel;
    Layout10: TLayout;
    FrameCode3: TFrameCode;
    Layout11: TLayout;
    Rectangle4: TRectangle;
    Layout12: TLayout;
    Line3: TLine;
    MemoComplResult: TMemo;
    LayoutComplCreate: TLayout;
    ButtonComplSend: TButton;
    MemoComplPrompt: TMemo;
    Line4: TLine;
    Layout14: TLayout;
    ButtonConnect: TButton;
    VertScrollBox1: TVertScrollBox;
    Label13: TLabel;
    Label12: TLabel;
    SpinBoxComplMaxTokens: TSpinBox;
    ComboEditComplModel: TComboEdit;
    EditComplSuffix: TEdit;
    Label14: TLabel;
    Label15: TLabel;
    SpinBoxComplTemp: TSpinBox;
    Label16: TLabel;
    SpinBoxComplTopP: TSpinBox;
    Label17: TLabel;
    SpinBoxComplN: TSpinBox;
    CheckBoxComplStream: TCheckBox;
    Label18: TLabel;
    Label19: TLabel;
    SpinBoxComplFrequencyPenalty: TSpinBox;
    Label20: TLabel;
    CheckBoxComplEcho: TCheckBox;
    Label21: TLabel;
    EditComplStop: TEdit;
    Label22: TLabel;
    SpinBoxComplPresencePenalty: TSpinBox;
    Label23: TLabel;
    SpinBoxComplLogProbs: TSpinBox;
    Label24: TLabel;
    SpinBoxComplBestOf: TSpinBox;
    Label25: TLabel;
    EditComplUser: TEdit;
    AniIndicatorComplCreate: TAniIndicator;
    VertScrollBoxEdits: TVertScrollBox;
    Label7: TLabel;
    Label10: TLabel;
    LabelEditsCreate: TLabel;
    Label27: TLabel;
    Layout13: TLayout;
    FrameCode4: TFrameCode;
    Layout15: TLayout;
    Rectangle5: TRectangle;
    Layout16: TLayout;
    Line5: TLine;
    VertScrollBox4: TVertScrollBox;
    Label28: TLabel;
    ComboEditEditsModel: TComboEdit;
    EditEditsInstruction: TEdit;
    Label30: TLabel;
    Label31: TLabel;
    SpinBoxEditsTemp: TSpinBox;
    Label32: TLabel;
    SpinBoxEditsTopP: TSpinBox;
    Label33: TLabel;
    SpinBoxEditsN: TSpinBox;
    MemoEditsResult: TMemo;
    LayoutEditsSend: TLayout;
    Line6: TLine;
    ButtonEditsSend: TButton;
    AniIndicatorEditsSend: TAniIndicator;
    MemoEditsInput: TMemo;
    VertScrollBoxModerations: TVertScrollBox;
    Label26: TLabel;
    Label29: TLabel;
    LabelModerCreate: TLabel;
    Label35: TLabel;
    Layout17: TLayout;
    FrameCode5: TFrameCode;
    Layout18: TLayout;
    Rectangle6: TRectangle;
    Layout19: TLayout;
    Line7: TLine;
    VertScrollBox5: TVertScrollBox;
    Label36: TLabel;
    ComboEditModerModel: TComboEdit;
    LayoutModerSend: TLayout;
    Line8: TLine;
    ButtonModerSend: TButton;
    AniIndicatorModerCreate: TAniIndicator;
    MemoModerInput: TMemo;
    Layout20: TLayout;
    FrameScoreH: TFrameScore;
    FrameScoreVG: TFrameScore;
    FrameScoreV: TFrameScore;
    FrameScoreSM: TFrameScore;
    FrameScoreS: TFrameScore;
    FrameScoreSH: TFrameScore;
    FrameScoreHT: TFrameScore;
    VertScrollBoxEmbeddings: TVertScrollBox;
    Label34: TLabel;
    Label37: TLabel;
    LabelEmbCreate: TLabel;
    Label39: TLabel;
    Layout21: TLayout;
    FrameCode6: TFrameCode;
    Layout22: TLayout;
    Rectangle7: TRectangle;
    Layout23: TLayout;
    Line9: TLine;
    VertScrollBox6: TVertScrollBox;
    Label40: TLabel;
    ComboEditEmbModel: TComboEdit;
    Label53: TLabel;
    EditEmbUser: TEdit;
    MemoEmbResult: TMemo;
    LayoutEmbCreate: TLayout;
    Line10: TLine;
    ButtonEmbSend: TButton;
    AniIndicatorEmbSend: TAniIndicator;
    MemoEmbInput: TMemo;
    AniIndicatorLoad: TAniIndicator;
    LayoutContent: TLayout;
    VertScrollBoxEngines: TVertScrollBox;
    LabelEngList: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Layout24: TLayout;
    Rectangle8: TRectangle;
    ListBoxEngList: TListBox;
    Layout25: TLayout;
    Line11: TLine;
    ButtonEngList: TButton;
    AniIndicatorEngList: TAniIndicator;
    Layout26: TLayout;
    FrameCode7: TFrameCode;
    LabelEngRetreive: TLabel;
    Label45: TLabel;
    Layout27: TLayout;
    FrameCode8: TFrameCode;
    Layout28: TLayout;
    Rectangle9: TRectangle;
    Layout29: TLayout;
    Line12: TLine;
    ButtonEngRetrieve: TButton;
    AniIndicatorEngRetreive: TAniIndicator;
    EditEngineId: TEdit;
    MemoEngItem: TMemo;
    Layout30: TLayout;
    Rectangle10: TRectangle;
    Layout31: TLayout;
    Path2: TPath;
    Label46: TLabel;
    Label47: TLabel;
    Rectangle11: TRectangle;
    Label38: TLabel;
    Rectangle12: TRectangle;
    Label48: TLabel;
    LayoutExEngines: TLayout;
    CheckBoxEngines: TCheckBox;
    ButtonEngineList: TButton;
    ButtonEngineRetreive: TButton;
    Rectangle13: TRectangle;
    Label44: TLabel;
    VertScrollBoxImages: TVertScrollBox;
    Label49: TLabel;
    Label50: TLabel;
    LabelImgCreate: TLabel;
    Label52: TLabel;
    Layout32: TLayout;
    FrameCode9: TFrameCode;
    Layout33: TLayout;
    Rectangle14: TRectangle;
    Layout34: TLayout;
    Line13: TLine;
    VertScrollBox7: TVertScrollBox;
    Label56: TLabel;
    Label59: TLabel;
    SpinBoxImgCreateN: TSpinBox;
    Label67: TLabel;
    EditImgCreateUser: TEdit;
    LayoutImgCreate: TLayout;
    Line14: TLine;
    ButtonImgCreate: TButton;
    AniIndicatorImgCreate: TAniIndicator;
    MemoImgCreatePrompt: TMemo;
    VertScrollBoxImgCreateResult: TVertScrollBox;
    FlowLayoutImgCreateResult: TFlowLayout;
    ComboBoxImgCreateSize: TComboBox;
    Layout35: TLayout;
    Rectangle15: TRectangle;
    Layout36: TLayout;
    Line15: TLine;
    VertScrollBox2: TVertScrollBox;
    Label51: TLabel;
    Label54: TLabel;
    SpinBoxImgEditN: TSpinBox;
    Label55: TLabel;
    EditImgEditUser: TEdit;
    ComboBoxImgEditSize: TComboBox;
    LayoutImgEdit: TLayout;
    Line16: TLine;
    ButtonImgEdit: TButton;
    AniIndicatorImgEdit: TAniIndicator;
    MemoImgEditPrompt: TMemo;
    VertScrollBoxImgEditResult: TVertScrollBox;
    FlowLayoutImgEditResult: TFlowLayout;
    Layout38: TLayout;
    FrameCode10: TFrameCode;
    Label57: TLabel;
    LabelImgEdit: TLabel;
    Label58: TLabel;
    EditImgEditImage: TEdit;
    EditButtonImgEditImage: TEditButton;
    OpenDialogPNG: TOpenDialog;
    EditImgEditMask: TEdit;
    EditButtonImgEditMask: TEditButton;
    Label60: TLabel;
    ButtonImageEdit: TButton;
    Layout37: TLayout;
    Rectangle16: TRectangle;
    Layout39: TLayout;
    Line17: TLine;
    VertScrollBox8: TVertScrollBox;
    Label61: TLabel;
    Label62: TLabel;
    SpinBoxImgVarN: TSpinBox;
    Label63: TLabel;
    EditImgVarUser: TEdit;
    ComboBoxImgVarSize: TComboBox;
    Label64: TLabel;
    EditImgVarImage: TEdit;
    EditButtonImgVar: TEditButton;
    LayoutImgVar: TLayout;
    Line18: TLine;
    ButtonImgVarSend: TButton;
    AniIndicatorImgVar: TAniIndicator;
    VertScrollBoxImgVarResult: TVertScrollBox;
    FlowLayoutImgVarResult: TFlowLayout;
    Layout41: TLayout;
    FrameCode11: TFrameCode;
    Label66: TLabel;
    LabelImgVar: TLabel;
    ButtonImageVariation: TButton;
    VertScrollBoxFiles: TVertScrollBox;
    LabelFiles: TLabel;
    Label68: TLabel;
    LabelFilesList: TLabel;
    Label70: TLabel;
    Layout40: TLayout;
    FrameCode12: TFrameCode;
    Layout42: TLayout;
    Rectangle17: TRectangle;
    ListBoxFileList: TListBox;
    Layout43: TLayout;
    Line19: TLine;
    ButtonFileList: TButton;
    AniIndicatorFileList: TAniIndicator;
    LayoutExFiles: TLayout;
    CheckBoxFiles: TCheckBox;
    ButtonFilesList: TButton;
    ButtonFilesUploadFile: TButton;
    ButtonFilesDeleteFile: TButton;
    ButtonFilesRetreiveFile: TButton;
    ButtonFilesRetreiveFileContent: TButton;
    Layout44: TLayout;
    Rectangle18: TRectangle;
    Layout45: TLayout;
    Line20: TLine;
    ButtonFilesUpload: TButton;
    AniIndicatorFilesUpload: TAniIndicator;
    EditFilesUploadFile: TEdit;
    MemoFilesUploadResult: TMemo;
    Layout46: TLayout;
    FrameCode13: TFrameCode;
    Label65: TLabel;
    LabelFilesUpload: TLabel;
    EditFilesUploadPurpose: TEdit;
    EditButtonFilesUpload: TEditButton;
    OpenDialogAll: TOpenDialog;
    LabelFilesDelete: TLabel;
    Label71: TLabel;
    Layout47: TLayout;
    Rectangle19: TRectangle;
    Layout48: TLayout;
    Line21: TLine;
    ButtonFilesDelete: TButton;
    AniIndicatorFilesDelete: TAniIndicator;
    EditFilesDeleteFileId: TEdit;
    MemoFilesDeleteResult: TMemo;
    LabelFilesRetreive: TLabel;
    Label72: TLabel;
    Layout49: TLayout;
    FrameCode14: TFrameCode;
    Layout50: TLayout;
    FrameCode15: TFrameCode;
    Layout51: TLayout;
    Rectangle20: TRectangle;
    Layout52: TLayout;
    Line22: TLine;
    ButtonFilesRetreive: TButton;
    AniIndicatorFilesRetreive: TAniIndicator;
    MemoFilesRetreiveResult: TMemo;
    EditFilesRetreiveFileId: TEdit;
    LabelFilesRetreiveContent: TLabel;
    Label73: TLabel;
    Layout53: TLayout;
    FrameCode16: TFrameCode;
    Layout54: TLayout;
    Rectangle21: TRectangle;
    Layout55: TLayout;
    Line23: TLine;
    ButtonFilesRetreiveContent: TButton;
    AniIndicatorRetreiveContent: TAniIndicator;
    EditFilesRetreiveContentFileId: TEdit;
    LabelFilesDownload: TLabel;
    SaveDialogFilesContent: TSaveDialog;
    Label69: TLabel;
    Label74: TLabel;
    Layout56: TLayout;
    FrameCode17: TFrameCode;
    Layout57: TLayout;
    FrameCode18: TFrameCode;
    Layout58: TLayout;
    FrameCode19: TFrameCode;
    Label75: TLabel;
    Label76: TLabel;
    LayoutExFT: TLayout;
    CheckBoxFTs: TCheckBox;
    ButtonFTsCreate: TButton;
    ButtonFTsList: TButton;
    ButtonFTsRetreive: TButton;
    ButtonFTsCancel: TButton;
    ButtonFTsListEvents: TButton;
    ButtonFTsDeleteModel: TButton;
    VertScrollBoxFTs: TVertScrollBox;
    LabelFTCreate: TLabel;
    LabelFTs: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    Layout61: TLayout;
    FrameCode20: TFrameCode;
    LabelFTList: TLabel;
    Label82: TLabel;
    Layout62: TLayout;
    FrameCode21: TFrameCode;
    Layout63: TLayout;
    Rectangle23: TRectangle;
    Layout64: TLayout;
    Line25: TLine;
    ButtonFTList: TButton;
    AniIndicatorFTList: TAniIndicator;
    Layout59: TLayout;
    Rectangle22: TRectangle;
    Layout60: TLayout;
    Line24: TLine;
    VertScrollBox3: TVertScrollBox;
    Label78: TLabel;
    Label83: TLabel;
    ComboEditFTCreateModel: TComboEdit;
    EditFTCreateTrainingFile: TEdit;
    Label84: TLabel;
    Label85: TLabel;
    SpinBoxFTCreateNepochs: TSpinBox;
    Label86: TLabel;
    SpinBoxFTCreateBatchSize: TSpinBox;
    Label87: TLabel;
    SpinBoxFTCreateLRM: TSpinBox;
    CheckBoxFTCreateCCM: TCheckBox;
    Label88: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    Label93: TLabel;
    SpinBoxFTCreatePLW: TSpinBox;
    EditFTCreateSuffix: TEdit;
    MemoFTCreateResult: TMemo;
    LayoutFTCreate: TLayout;
    Line26: TLine;
    ButtonFTCreate: TButton;
    AniIndicatorFTCreate: TAniIndicator;
    EditFTCreateValidationFile: TEdit;
    SpinBoxFTCreateCNC: TSpinBox;
    EditFTCreateCPC: TEdit;
    Label91: TLabel;
    ListBoxFTList: TListBox;
    Layout65: TLayout;
    Rectangle24: TRectangle;
    Layout66: TLayout;
    Line27: TLine;
    ButtonFTRetreive: TButton;
    AniIndicatorFTRetrieve: TAniIndicator;
    EditFTRetrieveId: TEdit;
    MemoFTRetreive: TMemo;
    Layout67: TLayout;
    FrameCode22: TFrameCode;
    Label77: TLabel;
    LabelFTRetrieve: TLabel;
    Layout68: TLayout;
    Rectangle25: TRectangle;
    Layout69: TLayout;
    Line28: TLine;
    ButtonFTCancel: TButton;
    AniIndicatorFTCancel: TAniIndicator;
    EditFTCancelId: TEdit;
    MemoFTCancel: TMemo;
    Layout70: TLayout;
    FrameCode23: TFrameCode;
    Label81: TLabel;
    LabelFTCancel: TLabel;
    Layout71: TLayout;
    Rectangle26: TRectangle;
    Layout72: TLayout;
    Line29: TLine;
    ButtonFTListEvents: TButton;
    AniIndicatorFTListEvents: TAniIndicator;
    ListBoxFTListEvents: TListBox;
    Layout73: TLayout;
    FrameCode24: TFrameCode;
    Label92: TLabel;
    LabelFTListEvents: TLabel;
    EditFTListEventsId: TEdit;
    CheckBoxFTListEventsStream: TCheckBox;
    Layout74: TLayout;
    Rectangle27: TRectangle;
    Layout75: TLayout;
    Line30: TLine;
    ButtonFTDelete: TButton;
    AniIndicatorFTDelete: TAniIndicator;
    EditFTDeleteModel: TEdit;
    MemoFTDeleteResult: TMemo;
    Layout76: TLayout;
    FrameCode25: TFrameCode;
    Label94: TLabel;
    LabelFTDelete: TLabel;
    Label95: TLabel;
    Layout77: TLayout;
    Path3: TPath;
    Label96: TLabel;
    Label6: TLabel;
    Layout78: TLayout;
    Label97: TLabel;
    procedure ButtonComplSendClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBoxModelsChange(Sender: TObject);
    procedure ButtonModelListClick(Sender: TObject);
    procedure ButtonCompletionCreateClick(Sender: TObject);
    procedure ButtonModelListExecuteClick(Sender: TObject);
    procedure ButtonModelRetreiveClick(Sender: TObject);
    procedure ButtonModelRetreiveExecuteClick(Sender: TObject);
    procedure ButtonOpenAIClick(Sender: TObject);
    procedure ButtonConnectClick(Sender: TObject);
    procedure ButtonEditsSendClick(Sender: TObject);
    procedure ButtonEditCreateClick(Sender: TObject);
    procedure ButtonModerationCreateClick(Sender: TObject);
    procedure ButtonModerSendClick(Sender: TObject);
    procedure ButtonEmbSendClick(Sender: TObject);
    procedure ButtonEmbeddingCreateClick(Sender: TObject);
    procedure ButtonEngListClick(Sender: TObject);
    procedure ButtonEngRetrieveClick(Sender: TObject);
    procedure ButtonEngineListClick(Sender: TObject);
    procedure ButtonEngineRetreiveClick(Sender: TObject);
    procedure ButtonImageCreateClick(Sender: TObject);
    procedure ButtonImgCreateClick(Sender: TObject);
    procedure FlowLayoutImgCreateResultResize(Sender: TObject);
    procedure EditButtonImgEditImageClick(Sender: TObject);
    procedure EditButtonImgEditMaskClick(Sender: TObject);
    procedure ButtonImgEditClick(Sender: TObject);
    procedure ButtonImageEditClick(Sender: TObject);
    procedure ButtonImageVariationClick(Sender: TObject);
    procedure ButtonImgVarSendClick(Sender: TObject);
    procedure EditButtonImgVarClick(Sender: TObject);
    procedure ButtonFilesListClick(Sender: TObject);
    procedure EditButtonFilesUploadClick(Sender: TObject);
    procedure ButtonFilesUploadClick(Sender: TObject);
    procedure ButtonFilesUploadFileClick(Sender: TObject);
    procedure ButtonFilesDeleteClick(Sender: TObject);
    procedure ButtonFilesRetreiveClick(Sender: TObject);
    procedure ListBoxFileListItemClick(const Sender: TCustomListBox; const Item: TListBoxItem);
    procedure ButtonFilesDeleteFileClick(Sender: TObject);
    procedure ButtonFilesRetreiveFileClick(Sender: TObject);
    procedure ButtonFilesRetreiveContentClick(Sender: TObject);
    procedure ButtonFilesRetreiveFileContentClick(Sender: TObject);
    procedure ButtonFTsCreateClick(Sender: TObject);
    procedure ButtonFTsListClick(Sender: TObject);
    procedure ButtonFTsRetreiveClick(Sender: TObject);
    procedure ButtonFTsCancelClick(Sender: TObject);
    procedure ButtonFTsListEventsClick(Sender: TObject);
    procedure ButtonFTsDeleteModelClick(Sender: TObject);
    procedure ButtonFTCreateClick(Sender: TObject);
    procedure ButtonFTListClick(Sender: TObject);
    procedure ButtonFTRetreiveClick(Sender: TObject);
    procedure ButtonFTCancelClick(Sender: TObject);
    procedure ButtonFTListEventsClick(Sender: TObject);
    procedure ButtonFTDeleteClick(Sender: TObject);
    procedure ButtonGitHubClick(Sender: TObject);
  private
    OpenAI: TOpenAI;
    procedure OpenTab(Tab: TTabItem; ScrollToControl: TControl);
    procedure LoadModels;
    procedure ShowError(const Text: string);
    procedure FillModels(Combo: TComboEdit; Models: TModels);
    procedure FillFlowLayout(Layout: TFlowLayout; Images: TImageGenerations);
  public
    { Public declarations }
  end;

const
  API_TOKEN = '';

var
  FormMain: TFormMain;

implementation

uses
  FMX.Ani, FMX.DialogService, System.Threading, System.JSON, Rest.Json,
  System.Net.HttpClient, System.Net.URLClient, OpenAI.Completions,
  HGM.Common.Download, HGM.FMX.Image, OpenAI.API, OpenAI.Edits,
  OpenAI.Moderations, OpenAI.Embeddings, System.Math, OpenAI.Files,
  OpenAI.FineTunes, Winapi.ShellAPI, FMX.Platform.Win;

{$R *.fmx}

procedure OpenUrlShell(const Url: string);
begin
  ShellExecute(ApplicationHWND, 'open', PChar(Url), nil, nil, SW_SHOWNORMAL);
end;

procedure TFormMain.ButtonComplSendClick(Sender: TObject);
begin
  LayoutComplCreate.Enabled := False;
  AniIndicatorComplCreate.Enabled := True;
  AniIndicatorComplCreate.Visible := True;
  TTask.Run(
    procedure
    begin
      try
        var Completions := OpenAI.Completion.Create(
          procedure(Params: TCompletionParams)
          begin
            Params.Prompt(MemoComplPrompt.Text);
            Params.MaxTokens(Trunc(SpinBoxComplMaxTokens.Value));
            if not ComboEditComplModel.Text.IsEmpty then
              Params.Model(ComboEditComplModel.Text);
            if not EditComplSuffix.Text.IsEmpty then
              Params.Suffix(EditComplSuffix.Text);
            Params.Temperature(SpinBoxComplTemp.Value);
            Params.TopP(SpinBoxComplTopP.Value);
            Params.N(Trunc(SpinBoxComplN.Value));
            if CheckBoxComplStream.IsChecked then
              Params.Stream;
            if CheckBoxComplEcho.IsChecked then
              Params.Echo;
            if SpinBoxComplLogProbs.Value <> 0 then
              Params.LogProbs(Trunc(SpinBoxComplLogProbs.Value));
            if not EditComplStop.Text.IsEmpty then
              Params.Stop(EditComplStop.Text);
            if SpinBoxComplPresencePenalty.Value <> 0 then
              Params.PresencePenalty(SpinBoxComplPresencePenalty.Value);
            if SpinBoxComplFrequencyPenalty.Value <> 0 then
              Params.FrequencyPenalty(SpinBoxComplFrequencyPenalty.Value);
            if SpinBoxComplBestOf.Value <> 1 then
              Params.BestOf(Trunc(SpinBoxComplBestOf.Value));
            if not EditComplUser.Text.IsEmpty then
              Params.User(EditComplUser.Text);
          end);
        try
          TThread.Synchronize(nil,
            procedure
            begin
              for var Choice in Completions.Choices do
                MemoComplResult.Lines.Add(Choice.Text);
            end);
        finally
          Completions.Free;
        end;
      except
        on E: OpenAIException do
          ShowError('OpenAI Error: ' + E.Message);
        on E: Exception do
          ShowError('Error: ' + E.Message);
      end;
      TThread.Queue(nil,
        procedure
        begin
          LayoutComplCreate.Enabled := True;
          AniIndicatorComplCreate.Enabled := False;
          AniIndicatorComplCreate.Visible := False;
        end);
    end);
end;

procedure TFormMain.OpenTab(Tab: TTabItem; ScrollToControl: TControl);
begin
  TabControlMain.ActiveTab := Tab;
  if Assigned(ScrollToControl) and Assigned(ScrollToControl.ParentControl) and (ScrollToControl.ParentControl.ParentControl is TVertScrollBox) then
  begin
    var Scroll := ScrollToControl.ParentControl.ParentControl as TVertScrollBox;
    Scroll.ViewportPosition := TPointF.Create(0, ScrollToControl.Position.Y);
  end
  else if ScrollToControl is TVertScrollBox then
    (ScrollToControl as TVertScrollBox).ViewportPosition := TPointF.Create(0, 0);
end;

procedure TFormMain.ButtonCompletionCreateClick(Sender: TObject);
begin
  OpenTab(TabItemCompletions, LabelComplCreate);
end;

procedure TFormMain.FillModels(Combo: TComboEdit; Models: TModels);
begin
  Combo.Clear;
  Combo.BeginUpdate;
  for var Model in Models.Data do
    Combo.Items.Add(Model.Id);
  Combo.EndUpdate;
end;

procedure TFormMain.FlowLayoutImgCreateResultResize(Sender: TObject);
var
  Layout: TFlowLayout absolute Sender;
begin
  var H: Single := 0.0;
  for var Control in Layout.Controls do
    H := Max(H, Control.Position.Y + Control.Height);
  if Layout.Height <> H then
    Layout.Height := H;
end;

procedure TFormMain.ListBoxFileListItemClick(const Sender: TCustomListBox; const Item: TListBoxItem);
begin
  EditFilesDeleteFileId.Text := Item.TagString;
  EditFilesRetreiveFileId.Text := Item.TagString;
  EditFilesRetreiveContentFileId.Text := Item.TagString;
end;

procedure TFormMain.LoadModels;
begin
  LayoutContent.Enabled := False;
  AniIndicatorLoad.Enabled := True;
  AniIndicatorLoad.Visible := True;
  TTask.Run(
    procedure
    begin
      try
        var Models := OpenAI.Model.List;
        try
          TThread.Synchronize(nil,
            procedure
            begin
              FillModels(ComboEditComplModel, Models);
              FillModels(ComboEditEditsModel, Models);
              FillModels(ComboEditEmbModel, Models);
            end);
        finally
          Models.Free;
        end;
      except
        on E: OpenAIException do
          ShowError('OpenAI Error: ' + E.Message);
        on E: Exception do
          ShowError('Error: ' + E.Message);
      end;
      TThread.Queue(nil,
        procedure
        begin
          LayoutContent.Enabled := True;
          AniIndicatorLoad.Enabled := False;
          AniIndicatorLoad.Visible := False;
        end);
    end);
end;

procedure TFormMain.ButtonConnectClick(Sender: TObject);
begin
  OpenAI.Token := EditToken.Text;
  LoadModels;
end;

procedure TFormMain.ButtonEditCreateClick(Sender: TObject);
begin
  OpenTab(TabItemEdits, LabelEditsCreate);
end;

procedure TFormMain.ButtonEditsSendClick(Sender: TObject);
begin
  LayoutEditsSend.Enabled := False;
  AniIndicatorEditsSend.Enabled := True;
  AniIndicatorEditsSend.Visible := True;
  TTask.Run(
    procedure
    begin
      try
        var Edits := OpenAI.Edit.Create(
          procedure(Params: TEditParams)
          begin
            Params.Input(MemoEditsInput.Text);
            if not ComboEditEditsModel.Text.IsEmpty then
              Params.Model(ComboEditEditsModel.Text);
            if not EditEditsInstruction.Text.IsEmpty then
              Params.Instruction(EditEditsInstruction.Text);
            Params.Temperature(SpinBoxEditsTemp.Value);
            Params.TopP(SpinBoxEditsTopP.Value);
            Params.N(Trunc(SpinBoxEditsN.Value));
          end);
        try
          TThread.Synchronize(nil,
            procedure
            begin
              for var Choice in Edits.Choices do
                MemoEditsResult.Lines.Add(Choice.Text);
            end);
        finally
          Edits.Free;
        end;
      except
        on E: OpenAIException do
          ShowError('OpenAI Error: ' + E.Message);
        on E: Exception do
          ShowError('Error: ' + E.Message);
      end;
      TThread.Queue(nil,
        procedure
        begin
          LayoutEditsSend.Enabled := True;
          AniIndicatorEditsSend.Enabled := False;
          AniIndicatorEditsSend.Visible := False;
        end);
    end);
end;

procedure TFormMain.ButtonEmbeddingCreateClick(Sender: TObject);
begin
  OpenTab(TabItemEmbeddings, LabelEmbCreate);
end;

procedure TFormMain.ButtonEmbSendClick(Sender: TObject);
begin
  LayoutEmbCreate.Enabled := False;
  AniIndicatorEmbSend.Enabled := True;
  AniIndicatorEmbSend.Visible := True;
  TTask.Run(
    procedure
    begin
      try
        var Embeddings := OpenAI.Embedding.Create(
          procedure(Params: TEmbeddingParams)
          begin
            Params.Input(MemoEmbInput.Lines.ToStringArray);
            if not ComboEditEmbModel.Text.IsEmpty then
              Params.Model(ComboEditEmbModel.Text);
            if not EditEmbUser.Text.IsEmpty then
              Params.User(EditEmbUser.Text);
          end);
        try
          TThread.Synchronize(nil,
            procedure
            begin
              for var Item in Embeddings.Data do
              begin
                MemoEmbResult.Lines.Add(Item.&Object);
                for var Value in Item.Embedding do
                  MemoEmbResult.Lines.Add(Value.ToString);
              end;
            end);
        finally
          Embeddings.Free;
        end;
      except
        on E: OpenAIException do
          ShowError('OpenAI Error: ' + E.Message);
        on E: Exception do
          ShowError('Error: ' + E.Message);
      end;
      TThread.Queue(nil,
        procedure
        begin
          LayoutEmbCreate.Enabled := True;
          AniIndicatorEmbSend.Enabled := False;
          AniIndicatorEmbSend.Visible := False;
        end);
    end);
end;

procedure TFormMain.ButtonEngineListClick(Sender: TObject);
begin
  OpenTab(TabItemEngines, LabelEngList);
end;

procedure TFormMain.ButtonEngineRetreiveClick(Sender: TObject);
begin
  OpenTab(TabItemEngines, LabelEngRetreive);
end;

procedure TFormMain.ButtonEngListClick(Sender: TObject);
begin
  ButtonEngList.Enabled := False;
  AniIndicatorEngList.Enabled := True;
  AniIndicatorEngList.Visible := True;
  TTask.Run(
    procedure
    begin
      try
        {$WARNINGS OFF}
        var Engines := OpenAI.Engine.List;
        {$WARNINGS ON}
        try
          TThread.Synchronize(nil,
            procedure
            begin
              ListBoxEngList.Clear;
              ListBoxEngList.BeginUpdate;
              for var Engine in Engines.Data do
              begin
                var Item := TListBoxItem.Create(ListBoxEngList);
                Item.Text := Engine.Id;
                Item.Height := 30;
                ListBoxEngList.AddObject(Item);
              end;
              ListBoxEngList.EndUpdate;
            end);
        finally
          Engines.Free;
        end;
      except
        on E: OpenAIException do
          ShowError('OpenAI Error: ' + E.Message);
        on E: Exception do
          ShowError('Error: ' + E.Message);
      end;
      TThread.Queue(nil,
        procedure
        begin
          ButtonEngList.Enabled := True;
          AniIndicatorEngList.Enabled := False;
          AniIndicatorEngList.Visible := False;
        end);
    end);
end;

procedure TFormMain.ButtonEngRetrieveClick(Sender: TObject);
begin
  ButtonEngRetrieve.Enabled := False;
  AniIndicatorEngRetreive.Enabled := True;
  AniIndicatorEngRetreive.Visible := True;
  TTask.Run(
    procedure
    begin
      try
        {$WARNINGS OFF}
        var Engine := OpenAI.Engine.Retrieve(EditEngineId.Text);
        {$WARNINGS ON}
        try
          TThread.Synchronize(nil,
            procedure
            begin
              MemoEngItem.Lines.Clear;
              var JObj := TJson.ObjectToJsonObject(Engine);
              MemoEngItem.Lines.Add(JObj.Format);
              JObj.Free;
            end);
        finally
          Engine.Free;
        end;
      except
        on E: OpenAIException do
          ShowError('OpenAI Error: ' + E.Message);
        on E: Exception do
          ShowError('Error: ' + E.Message);
      end;
      TThread.Queue(nil,
        procedure
        begin
          ButtonEngRetrieve.Enabled := True;
          AniIndicatorEngRetreive.Enabled := False;
          AniIndicatorEngRetreive.Visible := False;
        end);
    end);
end;

procedure TFormMain.ButtonFilesDeleteClick(Sender: TObject);
begin
  if EditFilesDeleteFileId.Text.IsEmpty then
    raise Exception.Create('File Id is empty');
  ButtonFilesDeleteFile.Enabled := False;
  AniIndicatorFilesDelete.Enabled := True;
  AniIndicatorFilesDelete.Visible := True;
  TTask.Run(
    procedure
    begin
      try
        var FileItem := OpenAI.&File.Delete(EditFilesDeleteFileId.Text);
        try
          TThread.Synchronize(nil,
            procedure
            begin
              MemoFilesDeleteResult.Lines.Clear;
              var JObj := TJson.ObjectToJsonObject(FileItem);
              MemoFilesDeleteResult.Lines.Add(JObj.Format);
              JObj.Free;
            end);
        finally
          FileItem.Free;
        end;
      except
        on E: OpenAIException do
          ShowError('OpenAI Error: ' + E.Message);
        on E: Exception do
          ShowError('Error: ' + E.Message);
      end;
      TThread.Queue(nil,
        procedure
        begin
          ButtonFilesDeleteFile.Enabled := True;
          AniIndicatorFilesDelete.Enabled := False;
          AniIndicatorFilesDelete.Visible := False;
        end);
    end);
end;

procedure TFormMain.ButtonFilesDeleteFileClick(Sender: TObject);
begin
  OpenTab(TabItemFiles, LabelFilesDelete);
end;

procedure TFormMain.ButtonFilesListClick(Sender: TObject);
begin
  OpenTab(TabItemFiles, LabelFilesList);
end;

procedure TFormMain.ButtonFilesRetreiveClick(Sender: TObject);
begin
  if EditFilesRetreiveFileId.Text.IsEmpty then
    raise Exception.Create('FileId is empty');
  ButtonFilesRetreive.Enabled := False;
  AniIndicatorFilesRetreive.Enabled := True;
  AniIndicatorFilesRetreive.Visible := True;
  TTask.Run(
    procedure
    begin
      try
        var FileItem := OpenAI.&File.Retrieve(EditFilesRetreiveFileId.Text);
        try
          TThread.Synchronize(nil,
            procedure
            begin
              MemoFilesRetreiveResult.Lines.Clear;
              var JObj := TJson.ObjectToJsonObject(FileItem);
              MemoFilesRetreiveResult.Lines.Add(JObj.Format);
              JObj.Free;
            end);
        finally
          FileItem.Free;
        end;
      except
        on E: OpenAIException do
          ShowError('OpenAI Error: ' + E.Message);
        on E: Exception do
          ShowError('Error: ' + E.Message);
      end;
      TThread.Queue(nil,
        procedure
        begin
          ButtonFilesRetreive.Enabled := True;
          AniIndicatorFilesRetreive.Enabled := False;
          AniIndicatorFilesRetreive.Visible := False;
        end);
    end);
end;

procedure TFormMain.ButtonFilesRetreiveContentClick(Sender: TObject);
var
  FileName: string;
begin
  if EditFilesRetreiveContentFileId.Text.IsEmpty then
    raise Exception.Create('FileId is empty');
  if SaveDialogFilesContent.Execute then
    FileName := SaveDialogFilesContent.FileName
  else
    Exit;
  ButtonFilesRetreiveContent.Enabled := False;
  AniIndicatorRetreiveContent.Enabled := True;
  AniIndicatorRetreiveContent.Visible := True;
  LabelFilesDownload.Text := 'Downloading...';
  TTask.Run(
    procedure
    var
      FileStream: TFileStream;
    begin
      try
        FileStream := TFileStream.Create(FileName, fmCreate);
        try
          OpenAI.&File.Download(EditFilesRetreiveContentFileId.Text, FileStream);
        finally
          FileStream.Free;
        end;
        TThread.Queue(nil,
          procedure
          begin
            LabelFilesDownload.Text := 'Done';
          end);
      except
        on E: OpenAIException do
        begin
          ShowError('OpenAI Error: ' + E.Message);
          try
            DeleteFile(FileName);
          except
          end;
          TThread.Queue(nil,
            procedure
            begin
              LabelFilesDownload.Text := 'Error';
            end);
        end;
        on E: Exception do
        begin
          ShowError('Error: ' + E.Message);
          try
            DeleteFile(FileName);
          except
          end;
          TThread.Queue(nil,
            procedure
            begin
              LabelFilesDownload.Text := 'Error';
            end);
        end;
      end;
      TThread.Queue(nil,
        procedure
        begin
          ButtonFilesRetreiveContent.Enabled := True;
          AniIndicatorRetreiveContent.Enabled := False;
          AniIndicatorRetreiveContent.Visible := False;
        end);
    end);
end;

procedure TFormMain.ButtonFilesRetreiveFileClick(Sender: TObject);
begin
  OpenTab(TabItemFiles, LabelFilesRetreive);
end;

procedure TFormMain.ButtonFilesRetreiveFileContentClick(Sender: TObject);
begin
  OpenTab(TabItemFiles, LabelFilesRetreiveContent);
end;

procedure TFormMain.ButtonFilesUploadClick(Sender: TObject);
begin
  if EditFilesUploadFile.Text.IsEmpty then
    raise Exception.Create('FileName is empty');
  ButtonFilesUploadFile.Enabled := False;
  AniIndicatorFilesUpload.Enabled := True;
  AniIndicatorFilesUpload.Visible := True;
  TTask.Run(
    procedure
    begin
      try
        var FileItem := OpenAI.&File.Create(
          procedure(Params: TFileCreateParams)
          begin
            Params.&File(EditFilesUploadFile.Text);
            Params.Purpose(EditFilesUploadPurpose.Text);
          end);
        try
          TThread.Synchronize(nil,
            procedure
            begin
              MemoFilesUploadResult.Lines.Clear;
              var JObj := TJson.ObjectToJsonObject(FileItem);
              MemoFilesUploadResult.Lines.Add(JObj.Format);
              JObj.Free;
            end);
        finally
          FileItem.Free;
        end;
      except
        on E: OpenAIException do
          ShowError('OpenAI Error: ' + E.Message);
        on E: Exception do
          ShowError('Error: ' + E.Message);
      end;
      TThread.Queue(nil,
        procedure
        begin
          ButtonFilesUploadFile.Enabled := True;
          AniIndicatorFilesUpload.Enabled := False;
          AniIndicatorFilesUpload.Visible := False;
        end);
    end);
end;

procedure TFormMain.ButtonFilesUploadFileClick(Sender: TObject);
begin
  OpenTab(TabItemFiles, LabelFilesUpload);
end;

procedure TFormMain.ButtonFTCancelClick(Sender: TObject);
begin
  ButtonFTCancel.Enabled := False;
  AniIndicatorFTCancel.Enabled := True;
  AniIndicatorFTCancel.Visible := True;
  TTask.Run(
    procedure
    begin
      try
        var FineTune := OpenAI.FineTune.Cancel(EditFTCancelId.Text);
        try
          TThread.Synchronize(nil,
            procedure
            begin
              MemoFTCancel.Lines.Clear;
              var JObj := TJson.ObjectToJsonObject(FineTune);
              MemoFTCancel.Lines.Add(JObj.Format);
              JObj.Free;
            end);
        finally
          FineTune.Free;
        end;
      except
        on E: OpenAIException do
          ShowError('OpenAI Error: ' + E.Message);
        on E: Exception do
          ShowError('Error: ' + E.Message);
      end;
      TThread.Queue(nil,
        procedure
        begin
          ButtonFTCancel.Enabled := True;
          AniIndicatorFTCancel.Enabled := False;
          AniIndicatorFTCancel.Visible := False;
        end);
    end);
end;

procedure TFormMain.ButtonFTCreateClick(Sender: TObject);
begin
  LayoutFTCreate.Enabled := False;
  AniIndicatorFTCreate.Enabled := True;
  AniIndicatorFTCreate.Visible := True;
  TTask.Run(
    procedure
    begin
      try
        var FineTune := OpenAI.FineTune.Create(
          procedure(Params: TFineTuneCreateParams)
          begin
            if not EditFTCreateTrainingFile.Text.IsEmpty then
              Params.TrainingFile(EditFTCreateTrainingFile.Text);
            if not EditFTCreateValidationFile.Text.IsEmpty then
              Params.ValidationFile(EditFTCreateValidationFile.Text);
            if not ComboEditFTCreateModel.Text.IsEmpty then
              Params.Model(ComboEditFTCreateModel.Text);
            Params.nEpochs(Trunc(SpinBoxFTCreateNepochs.Value));
            if SpinBoxFTCreateBatchSize.Value <> 0 then
              Params.BatchSize(Trunc(SpinBoxFTCreateBatchSize.Value));
            if SpinBoxFTCreateLRM.Value <> 0 then
              Params.LearningRateMultiplier(SpinBoxFTCreateLRM.Value);
            Params.PromptLossWeight(SpinBoxFTCreatePLW.Value);
            if CheckBoxFTCreateCCM.IsChecked then
              Params.ComputeClassificationMetrics;
            if SpinBoxFTCreateCNC.Value <> 0 then
              Params.ClassificationNClasses(Trunc(SpinBoxFTCreateCNC.Value));
            if not EditFTCreateCPC.Text.IsEmpty then
              Params.ClassificationPositiveClass(EditFTCreateCPC.Text);
            if not EditFTCreateSuffix.Text.IsEmpty then
              Params.Suffix(EditFTCreateSuffix.Text);
          end);
        try
          TThread.Synchronize(nil,
            procedure
            begin
              MemoFTCreateResult.Lines.Clear;
              var JObj := TJson.ObjectToJsonObject(FineTune);
              MemoFTCreateResult.Lines.Add(JObj.Format);
              JObj.Free;
            end);
        finally
          FineTune.Free;
        end;
      except
        on E: OpenAIException do
          ShowError('OpenAI Error: ' + E.Message);
        on E: Exception do
          ShowError('Error: ' + E.Message);
      end;
      TThread.Queue(nil,
        procedure
        begin
          LayoutFTCreate.Enabled := True;
          AniIndicatorFTCreate.Enabled := False;
          AniIndicatorFTCreate.Visible := False;
        end);
    end);
end;

procedure TFormMain.ButtonFTDeleteClick(Sender: TObject);
begin
  if EditFTDeleteModel.Text.IsEmpty then
    raise Exception.Create('Model is empty');
  ButtonFTDelete.Enabled := False;
  AniIndicatorFTDelete.Enabled := True;
  AniIndicatorFTDelete.Visible := True;
  TTask.Run(
    procedure
    begin
      try
        var DeleteInfo := OpenAI.FineTune.Delete(EditFTDeleteModel.Text);
        try
          TThread.Synchronize(nil,
            procedure
            begin
              MemoFTDeleteResult.Lines.Clear;
              var JObj := TJson.ObjectToJsonObject(DeleteInfo);
              MemoFTDeleteResult.Lines.Add(JObj.Format);
              JObj.Free;
            end);
        finally
          DeleteInfo.Free;
        end;
      except
        on E: OpenAIException do
          ShowError('OpenAI Error: ' + E.Message);
        on E: Exception do
          ShowError('Error: ' + E.Message);
      end;
      TThread.Queue(nil,
        procedure
        begin
          ButtonFTDelete.Enabled := True;
          AniIndicatorFTDelete.Enabled := False;
          AniIndicatorFTDelete.Visible := False;
        end);
    end);
end;

procedure TFormMain.ButtonFTListClick(Sender: TObject);
begin
  ButtonFTList.Enabled := False;
  AniIndicatorFTList.Enabled := True;
  AniIndicatorFTList.Visible := True;
  TTask.Run(
    procedure
    begin
      try
        var FineTunes := OpenAI.FineTune.List;
        try
          TThread.Synchronize(nil,
            procedure
            begin
              ListBoxFTList.Clear;
              ListBoxFTList.BeginUpdate;
              for var FItem in FineTunes.Data do
              begin
                var Item := TListBoxItem.Create(ListBoxFTList);
                Item.Text := FItem.Id + ' Status: ' + FItem.Status;
                Item.Height := 30;
                Item.TagString := FItem.Id;
                ListBoxFTList.AddObject(Item);
              end;
              ListBoxFTList.EndUpdate;
            end);
        finally
          FineTunes.Free;
        end;
      except
        on E: OpenAIException do
          ShowError('OpenAI Error: ' + E.Message);
        on E: Exception do
          ShowError('Error: ' + E.Message);
      end;
      TThread.Queue(nil,
        procedure
        begin
          ButtonFTList.Enabled := True;
          AniIndicatorFTList.Enabled := False;
          AniIndicatorFTList.Visible := False;
        end);
    end);
end;

procedure TFormMain.ButtonFTListEventsClick(Sender: TObject);
begin
  ButtonFTListEvents.Enabled := False;
  AniIndicatorFTListEvents.Enabled := True;
  AniIndicatorFTListEvents.Visible := True;
  TTask.Run(
    procedure
    begin
      try
        var FTEvents := OpenAI.FineTune.ListEvents(EditFTListEventsId.Text, CheckBoxFTListEventsStream.IsChecked);
        try
          TThread.Synchronize(nil,
            procedure
            begin
              ListBoxFTListEvents.Clear;
              ListBoxFTListEvents.BeginUpdate;
              for var FItem in FTEvents.Data do
              begin
                var Item := TListBoxItem.Create(ListBoxFTListEvents);
                Item.Text := FItem.Level + ' ' + FItem.Message;
                Item.Height := 30;
                ListBoxFTListEvents.AddObject(Item);
              end;
              ListBoxFTListEvents.EndUpdate;
            end);
        finally
          FTEvents.Free;
        end;
      except
        on E: OpenAIException do
          ShowError('OpenAI Error: ' + E.Message);
        on E: Exception do
          ShowError('Error: ' + E.Message);
      end;
      TThread.Queue(nil,
        procedure
        begin
          ButtonFTListEvents.Enabled := True;
          AniIndicatorFTListEvents.Enabled := False;
          AniIndicatorFTListEvents.Visible := False;
        end);
    end);
end;

procedure TFormMain.ButtonFTRetreiveClick(Sender: TObject);
begin
  ButtonFTRetreive.Enabled := False;
  AniIndicatorFTRetrieve.Enabled := True;
  AniIndicatorFTRetrieve.Visible := True;
  TTask.Run(
    procedure
    begin
      try
        var FineTune := OpenAI.FineTune.Retrieve(EditFTRetrieveId.Text);
        try
          TThread.Synchronize(nil,
            procedure
            begin
              MemoFTRetreive.Lines.Clear;
              var JObj := TJson.ObjectToJsonObject(FineTune);
              MemoFTRetreive.Lines.Add(JObj.Format);
              JObj.Free;
            end);
        finally
          FineTune.Free;
        end;
      except
        on E: OpenAIException do
          ShowError('OpenAI Error: ' + E.Message);
        on E: Exception do
          ShowError('Error: ' + E.Message);
      end;
      TThread.Queue(nil,
        procedure
        begin
          ButtonFTRetreive.Enabled := True;
          AniIndicatorFTRetrieve.Enabled := False;
          AniIndicatorFTRetrieve.Visible := False;
        end);
    end);
end;

procedure TFormMain.ButtonFTsCancelClick(Sender: TObject);
begin
  OpenTab(TabItemFinetunes, LabelFTCancel);
end;

procedure TFormMain.ButtonFTsCreateClick(Sender: TObject);
begin
  OpenTab(TabItemFinetunes, LabelFTCreate);
end;

procedure TFormMain.ButtonFTsDeleteModelClick(Sender: TObject);
begin
  OpenTab(TabItemFinetunes, LabelFTDelete);
end;

procedure TFormMain.ButtonFTsListClick(Sender: TObject);
begin
  OpenTab(TabItemFinetunes, LabelFTList);
end;

procedure TFormMain.ButtonFTsListEventsClick(Sender: TObject);
begin
  OpenTab(TabItemFinetunes, LabelFTListEvents);
end;

procedure TFormMain.ButtonFTsRetreiveClick(Sender: TObject);
begin
  OpenTab(TabItemFinetunes, LabelFTRetrieve);
end;

procedure TFormMain.ButtonGitHubClick(Sender: TObject);
begin
  OpenUrlShell('https://github.com/HemulGM/DelphiOpenAI');
end;

procedure TFormMain.ButtonImageCreateClick(Sender: TObject);
begin
  OpenTab(TabItemImages, LabelImgCreate);
end;

procedure TFormMain.ButtonImageEditClick(Sender: TObject);
begin
  OpenTab(TabItemImages, LabelImgEdit);
end;

procedure TFormMain.ButtonImageVariationClick(Sender: TObject);
begin
  OpenTab(TabItemImages, LabelImgVar);
end;

procedure TFormMain.ButtonImgCreateClick(Sender: TObject);
begin
  LayoutImgCreate.Enabled := False;
  AniIndicatorImgCreate.Enabled := True;
  AniIndicatorImgCreate.Visible := True;
  TTask.Run(
    procedure
    begin
      try
        var Images := OpenAI.Image.Create(
          procedure(Params: TImageCreateParams)
          begin
            Params.Prompt(MemoImgCreatePrompt.Text);
            Params.Size(ComboBoxImgCreateSize.Items[ComboBoxImgCreateSize.ItemIndex]);
            Params.N(Trunc(SpinBoxImgCreateN.Value));
            if not EditImgCreateUser.Text.IsEmpty then
              Params.User(EditImgCreateUser.Text);
          end);
        try
          TThread.Synchronize(nil,
            procedure
            begin
              FillFlowLayout(FlowLayoutImgCreateResult, Images);
            end);
        finally
          Images.Free;
        end;
      except
        on E: OpenAIException do
          ShowError('OpenAI Error: ' + E.Message);
        on E: Exception do
          ShowError('Error: ' + E.Message);
      end;
      TThread.Queue(nil,
        procedure
        begin
          LayoutImgCreate.Enabled := True;
          AniIndicatorImgCreate.Enabled := False;
          AniIndicatorImgCreate.Visible := False;
        end);
    end);
end;

procedure TFormMain.ButtonImgEditClick(Sender: TObject);
begin
  if EditImgEditImage.Text.IsEmpty then
    raise Exception.Create('Image required');
  LayoutImgEdit.Enabled := False;
  AniIndicatorImgEdit.Enabled := True;
  AniIndicatorImgEdit.Visible := True;
  TTask.Run(
    procedure
    begin
      try
        var Images := OpenAI.Image.Edit(
          procedure(Params: TImageEditParams)
          begin
            Params.Prompt(MemoImgEditPrompt.Text);
            Params.Size(ComboBoxImgEditSize.Items[ComboBoxImgEditSize.ItemIndex]);
            Params.N(Trunc(SpinBoxImgEditN.Value));
            if not EditImgEditUser.Text.IsEmpty then
              Params.User(EditImgEditUser.Text);
            Params.Image(EditImgEditImage.Text);
            if not EditImgEditMask.Text.IsEmpty then
              Params.Mask(EditImgEditMask.Text);
          end);
        try
          TThread.Synchronize(nil,
            procedure
            begin
              FillFlowLayout(FlowLayoutImgEditResult, Images);
            end);
        finally
          Images.Free;
        end;
      except
        on E: OpenAIException do
          ShowError('OpenAI Error: ' + E.Message);
        on E: Exception do
          ShowError('Error: ' + E.Message);
      end;
      TThread.Queue(nil,
        procedure
        begin
          LayoutImgEdit.Enabled := True;
          AniIndicatorImgEdit.Enabled := False;
          AniIndicatorImgEdit.Visible := False;
        end);
    end);
end;

procedure TFormMain.ButtonImgVarSendClick(Sender: TObject);
begin
  if EditImgVarImage.Text.IsEmpty then
    raise Exception.Create('Image required');
  LayoutImgVar.Enabled := False;
  AniIndicatorImgVar.Enabled := True;
  AniIndicatorImgVar.Visible := True;
  TTask.Run(
    procedure
    begin
      try
        var Images := OpenAI.Image.Variation(
          procedure(Params: TImageVariationParams)
          begin
            Params.Size(ComboBoxImgVarSize.Items[ComboBoxImgVarSize.ItemIndex]);
            Params.N(Trunc(SpinBoxImgVarN.Value));
            if not EditImgVarUser.Text.IsEmpty then
              Params.User(EditImgVarUser.Text);
            Params.Image(EditImgVarImage.Text);
          end);
        try
          TThread.Synchronize(nil,
            procedure
            begin
              FillFlowLayout(FlowLayoutImgVarResult, Images);
            end);
        finally
          Images.Free;
        end;
      except
        on E: OpenAIException do
          ShowError('OpenAI Error: ' + E.Message);
        on E: Exception do
          ShowError('Error: ' + E.Message);
      end;
      TThread.Queue(nil,
        procedure
        begin
          LayoutImgVar.Enabled := True;
          AniIndicatorImgVar.Enabled := False;
          AniIndicatorImgVar.Visible := False;
        end);
    end);
end;

procedure TFormMain.FillFlowLayout(Layout: TFlowLayout; Images: TImageGenerations);
begin
  Layout.BeginUpdate;
  try
    while Layout.ControlsCount > 0 do
      Layout.Controls[0].Free;
    for var Image in Images.Data do
    begin
      var ImgControl := TImage.Create(Layout);
      ImgControl.Bitmap.LoadFromUrl(Image.Url, False);
      ImgControl.Height := 256;
      ImgControl.Width := 256;
      ImgControl.Parent := Layout;
    end;
  finally
    Layout.EndUpdate;
  end;
  Layout.RecalcSize;
end;

procedure TFormMain.ButtonModelListClick(Sender: TObject);
begin
  OpenTab(TabItemModels, LabelModelList);
end;

procedure TFormMain.ShowError(const Text: string);
begin
  TThread.Queue(nil,
    procedure
    begin
      TDialogService.MessageDialog(Text, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], TMsgDlgBtn.mbOK, 0, nil);
    end);
end;

procedure TFormMain.ButtonModelListExecuteClick(Sender: TObject);
begin
  ButtonFileList.Enabled := False;
  AniIndicatorFileList.Enabled := True;
  AniIndicatorFileList.Visible := True;
  TTask.Run(
    procedure
    begin
      try
        var Files := OpenAI.&File.List;
        try
          TThread.Synchronize(nil,
            procedure
            begin
              ListBoxFileList.Clear;
              ListBoxFileList.BeginUpdate;
              for var FileItem in Files.Data do
              begin
                var Item := TListBoxItem.Create(ListBoxFileList);
                Item.Text := FileItem.Id + ' ' + FileItem.FileName;
                Item.Height := 30;
                Item.TagString := FileItem.Id;
                ListBoxFileList.AddObject(Item);
              end;
              ListBoxFileList.EndUpdate;
            end);
        finally
          Files.Free;
        end;
      except
        on E: OpenAIException do
          ShowError('OpenAI Error: ' + E.Message);
        on E: Exception do
          ShowError('Error: ' + E.Message);
      end;
      TThread.Queue(nil,
        procedure
        begin
          ButtonFileList.Enabled := True;
          AniIndicatorFileList.Enabled := False;
          AniIndicatorFileList.Visible := False;
        end);
    end);
end;

procedure TFormMain.ButtonModelRetreiveClick(Sender: TObject);
begin
  OpenTab(TabItemModels, LabelRetrieveModel);
end;

procedure TFormMain.ButtonModelRetreiveExecuteClick(Sender: TObject);
begin
  ButtonModelRetreiveExecute.Enabled := False;
  AniIndicatorModelRetreive.Enabled := True;
  AniIndicatorModelRetreive.Visible := True;
  TTask.Run(
    procedure
    begin
      try
        var Model := OpenAI.Model.Retrieve(EditModelId.Text);
        try
          TThread.Synchronize(nil,
            procedure
            begin
              MemoModel.Lines.Clear;
              var JObj := TJson.ObjectToJsonObject(Model);
              MemoModel.Lines.Add(JObj.Format);
              JObj.Free;
            end);
        finally
          Model.Free;
        end;
      except
        on E: OpenAIException do
          ShowError('OpenAI Error: ' + E.Message);
        on E: Exception do
          ShowError('Error: ' + E.Message);
      end;
      TThread.Queue(nil,
        procedure
        begin
          ButtonModelRetreiveExecute.Enabled := True;
          AniIndicatorModelRetreive.Enabled := False;
          AniIndicatorModelRetreive.Visible := False;
        end);
    end);
end;

procedure TFormMain.ButtonModerationCreateClick(Sender: TObject);
begin
  OpenTab(TabItemModerations, LabelModerCreate);
end;

procedure TFormMain.ButtonModerSendClick(Sender: TObject);
begin
  LayoutModerSend.Enabled := False;
  AniIndicatorModerCreate.Enabled := True;
  AniIndicatorModerCreate.Visible := True;
  TTask.Run(
    procedure
    begin
      try
        var Moderations := OpenAI.Moderation.Create(
          procedure(Params: TModerationsParams)
          begin
            if not ComboEditModerModel.Text.IsEmpty then
              Params.Model(ComboEditModerModel.Text);
            Params.Input(MemoModerInput.Text);
          end);
        try
          TThread.Synchronize(nil,
            procedure
            begin
              for var Item in Moderations.Results do
              begin
                FrameScoreH.Value := Item.CategoryScores.Hate;
                FrameScoreHT.Value := Item.CategoryScores.HateOrThreatening;
                FrameScoreSH.Value := Item.CategoryScores.SelfHarm;
                FrameScoreS.Value := Item.CategoryScores.Sexual;
                FrameScoreSM.Value := Item.CategoryScores.SexualOrMinors;
                FrameScoreV.Value := Item.CategoryScores.Violence;
                FrameScoreVG.Value := Item.CategoryScores.ViolenceOrGraphic;
              end;
            end);
        finally
          Moderations.Free;
        end;
      except
        on E: OpenAIException do
          ShowError('OpenAI Error: ' + E.Message);
        on E: Exception do
          ShowError('Error: ' + E.Message);
      end;
      TThread.Queue(nil,
        procedure
        begin
          LayoutModerSend.Enabled := True;
          AniIndicatorModerCreate.Enabled := False;
          AniIndicatorModerCreate.Visible := False;
        end);
    end);
end;

procedure TFormMain.ButtonOpenAIClick(Sender: TObject);
begin
  OpenTab(TabItemHome, VertScrollBoxHome);
end;

procedure TFormMain.CheckBoxModelsChange(Sender: TObject);
var
  CheckBox: TCheckBox absolute Sender;
begin
  case CheckBox.IsChecked of
    False:
      TAnimator.AnimateFloat(CheckBox.ParentControl, 'Height', CheckBox.Height);
    True:
      begin
        TAnimator.AnimateFloat(CheckBox.ParentControl, 'Height', 50 + (CheckBox.ParentControl.ControlsCount - 1) * 40);
        if CheckBox = CheckBoxModels then
          OpenTab(TabItemModels, VertScrollBoxModels);
        if CheckBox = CheckBoxCompletions then
          OpenTab(TabItemCompletions, VertScrollBoxCompletions);
        if CheckBox = CheckBoxEdits then
          OpenTab(TabItemEdits, VertScrollBoxEdits);
        if CheckBox = CheckBoxModerations then
          OpenTab(TabItemModerations, VertScrollBoxModerations);
        if CheckBox = CheckBoxEmbeddings then
          OpenTab(TabItemEmbeddings, VertScrollBoxEmbeddings);
        if CheckBox = CheckBoxEngines then
          OpenTab(TabItemEngines, VertScrollBoxEngines);
        if CheckBox = CheckBoxImages then
          OpenTab(TabItemImages, VertScrollBoxImages);
        if CheckBox = CheckBoxFiles then
          OpenTab(TabItemFiles, VertScrollBoxFiles);
        if CheckBox = CheckBoxFTs then
          OpenTab(TabItemFinetunes, VertScrollBoxFTs);
      end;
  end;
end;

procedure TFormMain.EditButtonFilesUploadClick(Sender: TObject);
begin
  if OpenDialogAll.Execute then
    EditFilesUploadFile.Text := OpenDialogAll.FileName;
end;

procedure TFormMain.EditButtonImgEditImageClick(Sender: TObject);
begin
  if OpenDialogPNG.Execute then
    EditImgEditImage.Text := OpenDialogPNG.FileName;
end;

procedure TFormMain.EditButtonImgEditMaskClick(Sender: TObject);
begin
  if OpenDialogPNG.Execute then
    EditImgEditMask.Text := OpenDialogPNG.FileName;
end;

procedure TFormMain.EditButtonImgVarClick(Sender: TObject);
begin
  if OpenDialogPNG.Execute then
    EditImgVarImage.Text := OpenDialogPNG.FileName;
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  CheckBoxModels.IsChecked := False;
  CheckBoxModels.DisableDisappear := True;
  CheckBoxImages.IsChecked := False;
  CheckBoxImages.DisableDisappear := True;
  CheckBoxCompletions.IsChecked := False;
  CheckBoxCompletions.DisableDisappear := True;
  CheckBoxEmbeddings.IsChecked := False;
  CheckBoxEmbeddings.DisableDisappear := True;
  CheckBoxEdits.IsChecked := False;
  CheckBoxEdits.DisableDisappear := True;
  CheckBoxModerations.IsChecked := False;
  CheckBoxModerations.DisableDisappear := True;
  CheckBoxEngines.IsChecked := False;
  CheckBoxEngines.DisableDisappear := True;
  CheckBoxFiles.IsChecked := False;
  CheckBoxFiles.DisableDisappear := True;
  CheckBoxFTs.IsChecked := False;
  CheckBoxFTs.DisableDisappear := True;

  LayoutExModels.Height := CheckBoxModels.Height;
  LayoutExImages.Height := CheckBoxImages.Height;
  LayoutExCompletions.Height := CheckBoxCompletions.Height;
  LayoutExEmbeddings.Height := CheckBoxEmbeddings.Height;
  LayoutExEdits.Height := CheckBoxEdits.Height;
  LayoutExModerations.Height := CheckBoxModerations.Height;
  LayoutExEngines.Height := CheckBoxEngines.Height;
  LayoutExFiles.Height := CheckBoxFiles.Height;
  LayoutExFT.Height := CheckBoxFTs.Height;

  VertScrollBoxMenu.AniCalculations.Animation := True;
  VertScrollBoxModels.AniCalculations.Animation := True;
  VertScrollBoxCompletions.AniCalculations.Animation := True;
  VertScrollBoxEdits.AniCalculations.Animation := True;
  VertScrollBoxModerations.AniCalculations.Animation := True;
  VertScrollBoxEmbeddings.AniCalculations.Animation := True;
  VertScrollBoxEngines.AniCalculations.Animation := True;
  VertScrollBoxImages.AniCalculations.Animation := True;
  VertScrollBoxFiles.AniCalculations.Animation := True;
  VertScrollBoxFTs.AniCalculations.Animation := True;
  VertScrollBoxHome.AniCalculations.Animation := True;

  VertScrollBoxImgCreateResult.AniCalculations.Animation := True;
  VertScrollBoxImgEditResult.AniCalculations.Animation := True;
  VertScrollBoxImgVarResult.AniCalculations.Animation := True;
  TabControlMain.TabPosition := TTabPosition.None;

  OpenTab(TabItemHome, VertScrollBoxHome);
  //
  EditToken.Text := API_TOKEN;
  OpenAI := TOpenAI.Create(Self, API_TOKEN);
end;

end.

