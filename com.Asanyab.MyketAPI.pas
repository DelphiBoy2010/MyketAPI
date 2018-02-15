unit com.Asanyab.MyketAPI;
//{$Define UseLogger}

interface
const
  MyketPackageName = 'ir.mservices.market';

type

  TMyketAPI = class(TObject)
  private
  {$IFDEF UseLogger}
    FCategory: string;
  {$ENDIF}
    FPackageName: string;
  public
    constructor Create(aPackageName: string);
    destructor Destroy; override;

    procedure VoteApp;
    procedure GoDeveloperPage;
    procedure GoToLoginPage;
    procedure GotoAppWebPage;
    procedure GotoAppPage;

    property PackageName: string read FPackageName;
  end;

var
  MyketAPI: TMyketAPI = nil;

implementation

{ TMyketAPI }

uses System.SysUtils
  {$IFDEF UseLogger},LoggerManager{$ENDIF}
  {$IFDEF Android}
  , Androidapi.JNI.GraphicsContentViewText
  ,Androidapi.JNI.Net, Androidapi.Helpers
  , Android.Tools{$ENDIF};

constructor TMyketAPI.Create(aPackageName: string);
begin
  {$IFDEF UseLogger}
  FCategory := ClassName;
  Logger.AddCategory(FCategory);
  {$ENDIF}
  FPackageName := aPackageName;
end;

destructor TMyketAPI.Destroy;
begin
  inherited;
end;

procedure TMyketAPI.GoDeveloperPage;
const
  MethodName = 'GoDeveloperPage';
{$IFDEF Android}
var
  Intent: JIntent;
  Command: string;
{$ENDIF}
begin
{$IFDEF Android}
  try
    Command := 'myket://developer/' + PackageName;
    Intent := TJIntent.JavaClass.init(TJIntent.JavaClass.ACTION_VIEW,
      TJnet_Uri.JavaClass.parse(StringToJString(Command)));
    Intent.setPackage(StringToJString(MyketPackageName));
    SharedActivity.startActivity(Intent);
  except
    on E: Exception do
    begin
      {$IFDEF UseLogger}
      Logger.DoLog(ltError, ClassName + '.' + MethodName, FCategory, [E.Message]);
      {$ENDIF}
      raise Exception.Create(E.Message);
    end;
  end;
{$ENDIF}
end;

procedure TMyketAPI.GotoAppPage;
const
  MethodName = 'GotoAppPage';
{$IFDEF Android}
var
  Intent: JIntent;
  Command: string;
{$ENDIF}
begin
{$IFDEF Android}
  try
    Command := 'myket://details?id=' + PackageName;
    Intent := TJIntent.JavaClass.init(TJIntent.JavaClass.ACTION_VIEW,
      TJnet_Uri.JavaClass.parse(StringToJString(Command)));
    Intent.setPackage(StringToJString(MyketPackageName));
    SharedActivity.startActivity(Intent);
  except
    on E: Exception do
    begin
      {$IFDEF UseLogger}
      Logger.DoLog(ltError, ClassName + '.' + MethodName, FCategory, [E.Message]);
      {$ENDIF}
      raise Exception.Create(E.Message);
    end;
  end;
{$ENDIF}

end;

procedure TMyketAPI.GotoAppWebPage;
begin
  {$IFDEF Android}
  AndroidTools.OpenURL('http://myket.ir/app/' + PackageName);
  {$ENDIF}
end;

procedure TMyketAPI.GoToLoginPage;
const
  MethodName = 'GoToLoginPage';
{$IFDEF Android}
var
  Intent: JIntent;
  Command: string;
{$ENDIF}
begin
{$IFDEF Android}
//  try
//    Command := 'bazaar://login';
//    Intent := TJIntent.JavaClass.init(TJIntent.JavaClass.ACTION_VIEW,
//      TJnet_Uri.JavaClass.parse(StringToJString(Command)));
//    Intent.setPackage(StringToJString(MyketPackageName));
//    SharedActivity.startActivity(Intent);
//  except
//    on E: Exception do
//    begin
//      {$IFDEF UseLogger}
//      Logger.DoLog(ltError, ClassName + '.' + MethodName, FCategory, [E.Message]);
//      {$ENDIF}
//      raise Exception.Create(E.Message);
//    end;
//  end;
{$ENDIF}
end;

procedure TMyketAPI.VoteApp;
const
  MethodName = 'VoteApp';
{$IFDEF Android}
var
  Intent: JIntent;
  Command: string;
{$ENDIF}
begin
{$IFDEF Android}
  try
    Command := 'myket://comment?id=' + PackageName;
    Intent := TJIntent.JavaClass.init(TJIntent.JavaClass.ACTION_VIEW,
      TJnet_Uri.JavaClass.parse(StringToJString(Command)));
    Intent.setPackage(StringToJString(MyketPackageName));
    SharedActivity.startActivity(Intent);
  except
    on E: Exception do
    begin
      {$IFDEF UseLogger}
      Logger.DoLog(ltError, ClassName + '.' + MethodName, FCategory, [E.Message]);
      {$ENDIF}
      raise Exception.Create(E.Message);
    end;
  end;
{$ENDIF}
end;

end.
