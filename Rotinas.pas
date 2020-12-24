unit Rotinas;

interface

uses REST.Json.Types, IdHTTP, IdSMTP, IdSSLOpenSSL, IdMessage, IdText, IdAttachmentFile,
  IdExplicitTLSClientServerBase, IdCoder, IdCoderMIME;

type
  //Classe responsável por buscar as informações da API
  TBuscarCEP = class
  private
    FLogradouro: string;
    FBairro: string;
    [JSONNameAttribute('uf')]
    FUF: string;
    [JSONNameAttribute('cep')]
    FCEP: string;
    FLocalidade: string;
    procedure SetBairro(const Value: string);
    procedure SetCEP(const Value: string);
    procedure SetLocalidade(const Value: string);
    procedure SetLogradouro(const Value: string);
    procedure SetUF(const Value: string);
  public
    property CEP: string read FCEP write SetCEP;
    property Logradouro: string read FLogradouro write SetLogradouro;
    property Bairro: string read FBairro write SetBairro;
    property Localidade: string read FLocalidade write SetLocalidade;
    property UF: string read FUF write SetUF;
  end;

   TCep = class
  private
    FIdHTTP: TIdHTTP;
    FIdSSLIOHandlerSocketOpenSSL: TIdSSLIOHandlerSocketOpenSSL;

  public
    constructor Create;
    destructor Destroy; override;
    function Get(const ACep: string): TBuscarCEP;
  end;

   TEmail = class
    const
      SENHA = 'c2VuaEA1ODQ0';
    public
     constructor Create;
     function EnviarEmail(_Destinatario: string; _Mensagem: string; _ArquivoTemp: string): Boolean;
   end;

implementation

uses System.Classes, REST.Json, System.SysUtils;

{ TBuscarCEP }

procedure TBuscarCEP.SetBairro(const Value: string);
begin
  FBairro := Value;
end;

procedure TBuscarCEP.SetCEP(const Value: string);
begin
  FCEP := Value;
end;

procedure TBuscarCEP.SetLocalidade(const Value: string);
begin
  FLocalidade := Value;
end;

procedure TBuscarCEP.SetLogradouro(const Value: string);
begin
  FLogradouro := Value;
end;

procedure TBuscarCEP.SetUF(const Value: string);
begin
  FUF := Value;
end;

{ TCep }
constructor TCep.Create;
begin
  FIdHTTP := TIdHTTP.Create;
  FIdSSLIOHandlerSocketOpenSSL := TIdSSLIOHandlerSocketOpenSSL.Create;
  FIdHTTP.IOHandler := FIdSSLIOHandlerSocketOpenSSL;
  FIdSSLIOHandlerSocketOpenSSL.SSLOptions.SSLVersions := [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2];
end;

function TCep.Get(const ACep: string): TBuscarCEP;
const
  URL = 'https://viacep.com.br/ws/%s/json';
  INVALID_CEP = '{'#$A'  "erro": true'#$A'}';
var
  ResponseContent: TStringStream;
begin
  Result := nil;
  ResponseContent := TStringStream.Create;
  try
    FIdHTTP.Get(Format(URL, [ACep.Trim]), ResponseContent);
    if (FIdHTTP.ResponseCode = 200) and (not (ResponseContent.DataString).Equals(INVALID_CEP)) then
      Result := TJson.JsonToObject<TBuscarCEP>(UTF8ToString(PAnsiChar(AnsiString(ResponseContent.DataString))));
      {
      Consome a API ViaCep.com e retorna um json.
      Em seguida o resultado é convertido para um objeto de forma a simpliifcar a manipulação.
      }
  finally
    ResponseContent.Free;
  end;
end;

destructor TCep.Destroy;
begin
  FIdSSLIOHandlerSocketOpenSSL.Free;
  FIdHTTP.Free;
  inherited;
end;

{ TEmail }
constructor TEmail.Create;
begin

end;

function TEmail.EnviarEmail(_Destinatario: string; _Mensagem: string; _ArquivoTemp: string): Boolean;
var
  // variáveis e objetos necessários para o envio
  IdSSLIOHandlerSocket: TIdSSLIOHandlerSocketOpenSSL;
  IdSMTP: TIdSMTP;
  IdMessage: TIdMessage;
  IdText: TIdText;
  sAnexo: string;
begin
  Result := False;

  {
   Envio de email retirado de http://www.andrecelestino.com/delphi-xe-envio-de-e-mail-com-componentes-indy/
  }
  // instanciação dos objetos
  IdSSLIOHandlerSocket := TIdSSLIOHandlerSocketOpenSSL.Create;
  IdSMTP := TIdSMTP.Create;
  IdMessage := TIdMessage.Create;

  try
    // Configuração do protocolo SSL (TIdSSLIOHandlerSocketOpenSSL)
    IdSSLIOHandlerSocket.SSLOptions.Method := sslvSSLv23;
    IdSSLIOHandlerSocket.SSLOptions.Mode := sslmClient;

    // Configuração do servidor SMTP (TIdSMTP)
    IdSMTP.IOHandler := IdSSLIOHandlerSocket;
    IdSMTP.UseTLS := utUseImplicitTLS;
    IdSMTP.AuthType := satDefault;
    IdSMTP.Port := 465;
    IdSMTP.Host := 'smtp.gmail.com';
    IdSMTP.Username := 'luisfelnogueira@gmail.com';

    IdSMTP.Password := TIdDecoderMIME.DecodeString(SENHA);

    // Configuração da mensagem (TIdMessage)
    IdMessage.From.Name := 'Luís Felipe Nogueira';
    IdMessage.Recipients.Add.Text := _Destinatario;
    IdMessage.Subject := 'InfoSistemas Teste Desenvolvedor Delphi';
    IdMessage.Encoding := meMIME;

    // Configuração do corpo do email (TIdText)
    IdText := TIdText.Create(IdMessage.MessageParts);
    IdText.Body.Add(_Mensagem);
    IdText.ContentType := 'text/plain; charset=iso-8859-1';

    // Anexo da mensagem (TIdAttachmentFile)
    sAnexo := _ArquivoTemp;
    if FileExists(sAnexo) then
      TIdAttachmentFile.Create(IdMessage.MessageParts, sAnexo);


    // Conexão e autenticação
    try
      IdSMTP.Connect;
      IdSMTP.Authenticate;
    except
      on E:Exception do
      begin
        Result := False;
        Exit;
      end;
    end;

    // Envio da mensagem
    try
      IdSMTP.Send(IdMessage);
      DeleteFile(sAnexo);//Exclui XML temporário
      Result := True;
    except
      On E:Exception do
      begin
        Result := False;
      end;
    end;
  finally
    // desconecta do servidor
    IdSMTP.Disconnect;
    // liberação da DLL
    UnLoadOpenSSLLibrary;
    // liberação dos objetos da memória
    FreeAndNil(IdMessage);
    FreeAndNil(IdSSLIOHandlerSocket);
    FreeAndNil(IdSMTP);
  end;
end;

end.
