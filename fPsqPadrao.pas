unit fPsqPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, Grids, DBGrids, ExtCtrls, StdCtrls, dmMySQL, uGeral;

type
  TovF_PsqPadrao = class(TForm)
    Panel1: TPanel;
    ovDBG_Pesquisa: TDBGrid;
    oCDS_Pesquisa: TClientDataSet;
    oDS_Pesquisa: TDataSource;
    ovB_Atualizar: TButton;
    ovB_Confirmar: TButton;
    ovB_Voltar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure ovDBG_PesquisaDblClick(Sender: TObject);
    procedure ovB_AtualizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    vsSELECT, vsWHERE, vsORDERBY, vsFILTER : String;
    function fConsulta(arrVal : array of string):boolean; virtual; abstract;
  end;

var
  ovF_PsqPadrao: TovF_PsqPadrao;


implementation

{$R *.dfm}

//******************************************************************************
procedure TovF_PsqPadrao.FormCreate(Sender: TObject);
begin
  oCDS_Pesquisa.CreateDataSet;
  vsSELECT  := '';
  vsWHERE   := '';
  vsORDERBY := '';
  vsFILTER  := '';
end;

//******************************************************************************
procedure TovF_PsqPadrao.ovDBG_PesquisaDblClick(Sender: TObject);
begin
  if oCDS_Pesquisa.IsEmpty then
    Exit;
  if oCDS_Pesquisa.RecNo < 0 then
    Exit;
  ovB_Confirmar.Click;
end;

//******************************************************************************
procedure TovF_PsqPadrao.ovB_AtualizarClick(Sender: TObject);
begin
  vsSQL := vsSELECT;
  if vsWHERE <> '' then
    vsSQL := vsSQL + ' WHERE ' + vsWHERE;
  vsSQL := vsSQL + ' ' + vsORDERBY;
  if vsSELECT <> '' then
    ExecSQL(vsSQL, oCDS_Pesquisa);
  oCDS_Pesquisa.First;
end;

//******************************************************************************
end.
