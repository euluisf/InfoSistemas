unit Cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinsDefaultPainters, cxGroupBox, cxMaskEdit, cxTextEdit,
  cxLabel, Vcl.ExtCtrls, Vcl.Menus, Vcl.StdCtrls, cxButtons, System.JSON, xmldom, XMLIntf, msxmldom, XMLDoc;

type
 RegEndereco = record
    ACEP: Integer;
    ALogradouro: string;
    ANumero: SmallInt;
    ABairro: string;
    ACidade: string;
    AEstado: string;
    APais: string;
  end;

  RegCadastro = record
    ANome: string;
    AIdentidade: string;
    ACPF: string;
    ATelefone: string;
    AEmail: string;

    AEndereco: RegEndereco;
  end;

  TFrCadastro = class(TForm)
    PBackground: TPanel;
    LNome: TcxLabel;
    LIdentidade: TcxLabel;
    LCPF: TcxLabel;
    LTelefone: TcxLabel;
    LEmail: TcxLabel;
    EdNome: TcxTextEdit;
    EdIdentidade: TcxTextEdit;
    EdEmail: TcxTextEdit;
    EdCPF: TcxMaskEdit;
    EdTelefone: TcxMaskEdit;
    cxGroupBox1: TcxGroupBox;
    EdCep: TcxMaskEdit;
    LCEP: TcxLabel;
    LCidade: TcxLabel;
    LBairro: TcxLabel;
    LNumero: TcxLabel;
    LLogradouro: TcxLabel;
    EdLogradouro: TcxTextEdit;
    EdNumero: TcxTextEdit;
    EdBairro: TcxTextEdit;
    LPais: TcxLabel;
    LEstado: TcxLabel;
    EdCidade: TcxTextEdit;
    EdEstado: TcxTextEdit;
    EdPais: TcxTextEdit;
    PBottom: TPanel;
    BtSalvar: TcxButton;
    BtBuscar: TcxButton;
    BtFechar: TcxButton;
    BtLimpar: TcxButton;
    cxLabel1: TcxLabel;
    XMLDocument1: TXMLDocument;
    procedure BtLimparClick(Sender: TObject);
    procedure BtFecharClick(Sender: TObject);
    procedure BtSalvarClick(Sender: TObject);
    procedure BtBuscarClick(Sender: TObject);
  private
    { Private declarations }
    function ValidarDados: Boolean;
    function ValidarEmail(_Email:string):Boolean;
    function GetCepApi(_Cep:string): boolean;
    function GerarXML: string;
    procedure CarregarValores;
    function MontarCorpoEmail: string;
  public
    { Public declarations }
    ACadastro: RegCadastro;
  end;

var
  FrCadastro: TFrCadastro;


implementation
uses Rotinas, StrUtils;
{$R *.dfm}

procedure TFrCadastro.BtBuscarClick(Sender: TObject);
begin
  if GetCepApi(EdCep.text) then
    if EdNumero.CanFocus then EdNumero.SetFocus; //Foca no número
end;

procedure TFrCadastro.BtFecharClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrCadastro.BtLimparClick(Sender: TObject);
begin
  If not MessageDlg('Deseja limpar todos os campos?',mtConfirmation,[mbyes,mbno],0)= mryes then
    Exit;
  EdNome.Clear;
  EdIdentidade.Clear;
  EdEmail.Clear;
  EdCPF.Clear;
  EdTelefone.Clear;
  EdCep.Clear;
  EdLogradouro.Clear;
  EdNumero.Clear;
  EdBairro.Clear;
  EdCidade.Clear;
  EdEstado.Clear;
  EdPais.Clear;
end;

procedure TFrCadastro.BtSalvarClick(Sender: TObject);
var
  Email : TEmail;
begin
 { if not ValidarDados then
    Exit; }

  CarregarValores;
  If not MessageDlg('Deseja gerar o xml e enviar por email as informações? ',mtConfirmation,[mbyes,mbno],0)= mryes then
    Exit;
  //perguntar se quer gerar XML
  Email := TEmail.Create;
  if Email.EnviarEmail(ACadastro.AEmail, MontarCorpoEmail, GerarXML) then
    ShowMessage('Email enviado com sucesso para: ' + ACadastro.AEmail)
  else
    ShowMessage('O email não foi enviado!');
end;

procedure TFrCadastro.CarregarValores;
begin
  ACadastro.ANome                 := EdNome.Text;
  ACadastro.AIdentidade           := EdIdentidade.Text;
  ACadastro.ACPF                  := EdCPF.Text;
  ACadastro.ATelefone             := EdTelefone.Text;
  ACadastro.AEmail                := EdEmail.Text;
  ACadastro.AEndereco.ACEP        := StrToInt(EdCep.Text);
  ACadastro.AEndereco.ALogradouro := EdLogradouro.Text;
  ACadastro.AEndereco.ANumero     := StrToInt(EdNumero.Text);
  ACadastro.AEndereco.ABairro     := EdBairro.Text;
  ACadastro.AEndereco.ACidade     := EdCidade.Text;
  ACadastro.AEndereco.AEstado     := EdEstado.Text;
  ACadastro.AEndereco.APais       := EdPais.Text;
end;

function TFrCadastro.GetCepApi(_Cep:string): boolean;
const
  LISTA_UF: array of string = ['AC','AL','AP','AM','BA','CE','DF','ES','GO','MA','MT','MS','MG','PA','PB','PR','PE','PI','RJ','RN','RS','RO','RR','SC','SP','SE','TO'];
var
  ViaCEP: TCep;
  CEP: TBuscarCEP;
begin
  Result := False;
  ViaCEP := TCep.Create;
  CEP := ViaCEP.Get(_Cep);

  if not Assigned(CEP) then
    Exit;

  try
    EdLogradouro.Text := CEP.Logradouro;
    EdBairro.Text     := CEP.Bairro;
    EdCidade.Text     := CEP.Localidade;
    EdEstado.Text     := CEP.UF;

   if MatchStr(EdEstado.Text,LISTA_UF) then //Adaptação para sugerir o país BRASIL visto que a API não retorna o mesmo
    EdPais.Text := 'Brasil';

    if EdLogradouro.Text <> EmptyStr then
      result := True;
  finally
    CEP.Free;
  end;
end;


function TFrCadastro.MontarCorpoEmail: string;
begin
  Result:= 'Nome: ' + ACadastro.ANome + sLineBreak+
           'Identidade: ' + ACadastro.AIdentidade + sLineBreak +
           'CPF: '+ ACadastro.ACPF + sLineBreak +
           'Telefone: '+ ACadastro.ATelefone + sLineBreak +
           'Email: '+ ACadastro.AIdentidade + sLineBreak +
           'ENDEREÇO' + sLineBreak +
           'CEP: ' +  IntToStr(ACadastro.AEndereco.ACEP) + sLineBreak +
           'Logradouro: ' +  ACadastro.AEndereco.ALogradouro + sLineBreak +
           'Numero: ' +  IntToStr(ACadastro.AEndereco.ANumero) + sLineBreak +
           'Bairro: ' +  ACadastro.AEndereco.ABairro + sLineBreak +
           'Cidade: ' +  ACadastro.AEndereco.ACidade + sLineBreak +
           'Estado: ' +  ACadastro.AEndereco.AEstado + sLineBreak +
           'País: ' +  ACadastro.AEndereco.APais + sLineBreak;
end;

function TFrCadastro.ValidarDados: Boolean;
const
  MSG = 'Corrija o(s) seguinte(s) erro(s) para continuar: ';
var
  msgErro : string;
begin
{
  Validação de dados bem simples de forma a reunir todos os erros e
  apresentar uma única vez.
}
  msgErro := EmptyStr;
  Result := True;

  if EdNome.Text = EmptyStr then
  msgErro := msgErro + sLineBreak + 'Nome inválido.';

  if EdIdentidade.Text = EmptyStr then
  msgErro := msgErro + sLineBreak + 'Identidade inválida.';

  if EdCPF.Text = EmptyStr then
  msgErro := msgErro + sLineBreak + 'CPF inválido.';

  if EdTelefone.Text = EmptyStr then
  msgErro := msgErro + sLineBreak + 'Telefone inválido.';

  if (EdEmail.Text = EmptyStr) or (not ValidarEmail(EdEmail.Text)) then
  msgErro := msgErro + sLineBreak + 'Email inválido.';

  if EdCep.Text = EmptyStr then
  msgErro := msgErro + sLineBreak + 'CEP inválido.';

  if EdLogradouro.Text = EmptyStr then
  msgErro := msgErro + sLineBreak + 'Logradouro inválido.';

  if EdNumero.Text = EmptyStr then
  msgErro := msgErro + sLineBreak + 'Número inválido.';

  if EdBairro.Text = EmptyStr then
  msgErro := msgErro + sLineBreak + 'Bairro inválido.';

  if EdCidade.Text = EmptyStr then
  msgErro := msgErro + sLineBreak + 'Cidade inválida.';

  if EdEstado.Text = EmptyStr then
  msgErro := msgErro + sLineBreak + 'Estado inválido.';

  if EdPais.Text = EmptyStr then
  msgErro := msgErro + sLineBreak + 'País inválido.';

  if msgErro <> EmptyStr then
  begin
    ShowMessage(MSG + sLineBreak + msgErro);
    Result := False;
  end;

end;

function TFrCadastro.ValidarEmail(_Email: string): Boolean;
begin
  {
  Validador simples de Email retirado de: http://www.activedelphi.com.br/
  }
   Result := (Pos('@',_Email) >= 2) and (Pos('.',_Email) >= Pos('@',_Email)+2) and
             (Pos('.',_Email) < Length(_Email));
end;

function TFrCadastro.GerarXML: string;
Var
   NodeRaiz, NodeCadastro: IXMLNode;
   NodeNome, NodeIdentidade, NodeCPF, NodeTelefone, NodeEmail, NodeEndereco: IXMLNode;
   NodeCEP, NodeLogradouro, NodeNumero, NodeBairro, NodeCidade, NodeEstado, NodePais: IXMLNode;

begin
     Result := '';

     XMLDocument1.FileName := '';
     XMLDocument1.XML.Text := '';
     XMLDocument1.Active := False;
     XMLDocument1.Active := True;
     XMLDocument1.Version := '1.0';
     XMLDocument1.Encoding := 'UTF-8';

     // Criando o nó Raiz
     NodeRaiz := XMLDocument1.AddChild('INFOSISTEMAS');


     NodeCadastro := XMLDocument1.CreateNode('CADASTRO', ntElement);
     NodeRaiz.ChildNodes.Add(NodeCadastro);

     NodeNome := XMLDocument1.CreateNode('NOME', ntElement);
     NodeNome.Text := ACadastro.ANome;
     NodeCadastro.ChildNodes.Add(NodeNome);

     NodeIdentidade := XMLDocument1.CreateNode('IDENTIDADE', ntElement);
     NodeIdentidade.Text := ACadastro.AIdentidade;
     NodeCadastro.ChildNodes.Add(NodeIdentidade);

     NodeCPF := XMLDocument1.CreateNode('CPF', ntElement);
     NodeCPF.Text := ACadastro.ACPF;
     NodeCadastro.ChildNodes.Add(NodeCPF);

     NodeTelefone := XMLDocument1.CreateNode('TELEFONE', ntElement);
     NodeTelefone.Text := ACadastro.ATelefone;
     NodeCadastro.ChildNodes.Add(NodeTelefone);

     NodeEmail := XMLDocument1.CreateNode('EMAIL', ntElement);
     NodeEmail.Text := ACadastro.AEmail;
     NodeCadastro.ChildNodes.Add(NodeEmail);

     NodeEndereco := XMLDocument1.CreateNode('ENDERECO', ntElement);
     NodeCadastro.ChildNodes.Add(NodeEndereco);

     NodeCEP := XMLDocument1.CreateNode('CEP', ntElement);
     NodeCEP.Text := IntToStr(ACadastro.AEndereco.ACEP);
     NodeEndereco.ChildNodes.Add(NodeCEP);

     NodeLogradouro := XMLDocument1.CreateNode('LOGRADOURO', ntElement);
     NodeLogradouro.Text := ACadastro.AEndereco.ALogradouro;
     NodeEndereco.ChildNodes.Add(NodeLogradouro);

     NodeNumero := XMLDocument1.CreateNode('NUMERO', ntElement);
     NodeNumero.Text := IntToStr(ACadastro.AEndereco.ANumero);
     NodeEndereco.ChildNodes.Add(NodeNumero);

     NodeBairro := XMLDocument1.CreateNode('BAIRRO', ntElement);
     NodeBairro.Text := ACadastro.AEndereco.ABairro;
     NodeEndereco.ChildNodes.Add(NodeBairro);

     NodeCidade := XMLDocument1.CreateNode('CIDADE', ntElement);
     NodeCidade.Text := ACadastro.AEndereco.ACidade;
     NodeEndereco.ChildNodes.Add(NodeCidade);

     NodeEstado := XMLDocument1.CreateNode('ESTADO', ntElement);
     NodeEstado.Text := ACadastro.AEndereco.AEstado;
     NodeEndereco.ChildNodes.Add(NodeEstado);

     NodePais := XMLDocument1.CreateNode('PAIS', ntElement);
     NodePais.Text := ACadastro.AEndereco.APais;
     NodeEndereco.ChildNodes.Add(NodePais);

     XMLDocument1.SaveToFile('xmlCadastro.xml');
     XMLDocument1.Active := False;

     Result := 'xmlCadastro.xml';
end;

end.
