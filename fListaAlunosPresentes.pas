unit fListaAlunosPresentes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, RXDBCtrl, ExtCtrls, DB, DBClient;

type
  TovF_ListaAlunosPresentes = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    RxDBGrid1: TRxDBGrid;
    oCDS_Alunos: TClientDataSet;
    oDS_Alunos: TDataSource;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ovF_ListaAlunosPresentes: TovF_ListaAlunosPresentes;

implementation

{$R *.dfm}

//******************************************************************************
procedure TovF_ListaAlunosPresentes.FormCreate(Sender: TObject);
begin
  oCDS_Alunos.CreateDataSet;
end;

//******************************************************************************
end.
