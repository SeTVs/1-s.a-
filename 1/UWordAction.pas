unit UWordAction;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  UtrieTree,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TPtrTree=^Ttree;
  TWordAction = class(TForm)
    LWord: TLabeledEdit;
    BtOK: TBitBtn;
    BtCancel: TBitBtn;
    procedure SetTree(PtrTree_:TPtrTree);
    procedure BtCancelClick(Sender: TObject);
    procedure BtOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    action: boolean;// T add, F delete
  end;
var
  PtrTree:TPtrTree;
implementation

{$R *.dfm}
procedure TWordAction.SetTree(PtrTree_:TPtrTree);
begin
  PtrTree:= PtrTree_;
end;

procedure TWordAction.BtCancelClick(Sender: TObject);
begin
  self.hide;
end;

procedure TWordAction.BtOKClick(Sender: TObject);
begin
  if action then
    PtrTree^.add(LWord.Text)
  else
    PtrTree^.delete(LWord.Text);
  self.hide;
end;

end.
