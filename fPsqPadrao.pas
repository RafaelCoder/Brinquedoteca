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
    procedure ovB_ConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ovF_PsqPadrao: TovF_PsqPadrao;
  vsSELECT : String;

implementation

{$R *.dfm}

//******************************************************************************
procedure TovF_PsqPadrao.FormCreate(Sender: TObject);
begin
  oCDS_Pesquisa.CreateDataSet;
  vsSELECT := '';
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
procedure TovF_PsqPadrao.ovB_ConfirmarClick(Sender: TObject);
begin
  if vsSELECT <> '' then
    ExecSQL(vsSELECT, oCDS_Pesquisa);
  oCDS_Pesquisa.First;
end;

end.
