unit fra_Dependentes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Mask, ToolEdit, CurrEdit, ExtCtrls;

type
  TovFra_Dependentes = class(TFrame)
    ovCE_Codigo: TRxCalcEdit;
    ovP_Descricao: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
