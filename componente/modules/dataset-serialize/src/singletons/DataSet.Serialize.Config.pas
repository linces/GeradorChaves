unit DataSet.Serialize.Config;

{$IF DEFINED(FPC)}
{$MODE DELPHI}{$H+}
{$ENDIF}

interface

type
  TDataSetSerializeConfigExport = class
  private
    FExportNullValues: Boolean;
    FExportNullAsEmptyString: Boolean;
    FExportOnlyFieldsVisible: Boolean;
    FExportEmptyDataSet: Boolean;
    FFormatCurrency: string;
    FFormatDate: string;
    FExportChildDataSetAsJsonObject: Boolean;
  public
    constructor Create;
    property FormatDate: string read FFormatDate write FFormatDate;
    property FormatCurrency: string read FFormatCurrency write FFormatCurrency;
    property ExportOnlyFieldsVisible: Boolean read FExportOnlyFieldsVisible write FExportOnlyFieldsVisible;
    property ExportNullValues: Boolean read FExportNullValues write FExportNullValues;
    property ExportNullAsEmptyString: Boolean read FExportNullAsEmptyString write FExportNullAsEmptyString;
    property ExportEmptyDataSet: Boolean read FExportEmptyDataSet write FExportEmptyDataSet;
    property ExportChildDataSetAsJsonObject: Boolean read FExportChildDataSetAsJsonObject write FExportChildDataSetAsJsonObject;
  end;

  TDataSetSerializeConfigImport = class
  private
    FImportOnlyFieldsVisible: Boolean;
  public
    constructor Create;
    property ImportOnlyFieldsVisible: Boolean read FImportOnlyFieldsVisible write FImportOnlyFieldsVisible;
  end;

  TDataSetSerializeConfig = class
  private
    FLowerCamelCase: Boolean;
    FDataSetPrefix: TArray<string>;
    FDateInputIsUTC: Boolean;
    FExport: TDataSetSerializeConfigExport;
    FImport: TDataSetSerializeConfigImport;
    class var FInstance: TDataSetSerializeConfig;
  protected
    class function GetDefaultInstance: TDataSetSerializeConfig;
  public
    constructor Create;
    destructor Destroy; override;
    property DataSetPrefix: TArray<string> read FDataSetPrefix write FDataSetPrefix;
    property LowerCamelCase: Boolean read FLowerCamelCase write FLowerCamelCase;
    property DateInputIsUTC: Boolean read FDateInputIsUTC write FDateInputIsUTC;
    property &Export: TDataSetSerializeConfigExport read FExport write FExport;
    property Import: TDataSetSerializeConfigImport read FImport write FImport;
    class function GetInstance: TDataSetSerializeConfig;
    class destructor UnInitialize;
  end;

implementation

uses
{$IF DEFINED(FPC)}
  SysUtils;
{$ELSE}
  System.SysUtils;
{$ENDIF}

constructor TDataSetSerializeConfig.Create;
begin
  if not Assigned(FExport) then
    FExport := TDataSetSerializeConfigExport.Create;
  if not Assigned(FImport) then
    FImport := TDataSetSerializeConfigImport.Create;
end;

destructor TDataSetSerializeConfig.Destroy;
begin
  if Assigned(FExport) then
    FreeAndNil(FExport);
  if Assigned(FImport) then
    FreeAndNil(FImport);
  inherited;
end;

class function TDataSetSerializeConfig.GetDefaultInstance: TDataSetSerializeConfig;
begin
  if not Assigned(FInstance) then
  begin
    FInstance := TDataSetSerializeConfig.Create;
    FInstance.LowerCamelCase := True;
    FInstance.DataSetPrefix := ['mt', 'qry'];
    FInstance.DateInputIsUTC := True;
  end;
  Result := FInstance;
end;

class function TDataSetSerializeConfig.GetInstance: TDataSetSerializeConfig;
begin
  Result := TDataSetSerializeConfig.GetDefaultInstance;
end;

class destructor TDataSetSerializeConfig.UnInitialize;
begin
  if Assigned(FInstance) then
    FreeAndNil(FInstance);
end;

constructor TDataSetSerializeConfigExport.Create;
begin
  FExportNullValues := True;
  FExportNullAsEmptyString:= False;
  FExportOnlyFieldsVisible := True;
  ExportEmptyDataSet := False;
  FFormatCurrency := EmptyStr;
  FFormatDate := 'YYYY-MM-DD';
  FExportChildDataSetAsJsonObject := False;
end;

constructor TDataSetSerializeConfigImport.Create;
begin
  FImportOnlyFieldsVisible := True;
end;

end.
