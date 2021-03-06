unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  UTrieTree,UwordAction,
  Dialogs, StdCtrls, Menus, ExtCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    mFile: TMenuItem;
    MTask: TMenuItem;
    MNew: TMenuItem;
    MOpen: TMenuItem;
    MSave: TMenuItem;
    MSaveAS: TMenuItem;
    Close: TMenuItem;
    MEditing: TMenuItem;
    MAddWord: TMenuItem;
    MDeleteWord: TMenuItem;
    MClearWord: TMenuItem;
    TreeView1: TTreeView;
    Splitter1: TSplitter;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    ViewTree: TMenuItem;
    Memo: TMemo;
    procedure MNewClick(Sender: TObject);
    procedure MOpenClick(Sender: TObject);
    procedure CloseClick(Sender: TObject);
    procedure MSaveClick(Sender: TObject);
    procedure MAddWordClick(Sender: TObject);
    procedure ViewTreeClick(Sender: TObject);
    procedure MDeleteWordClick(Sender: TObject);
    procedure MClearWordClick(Sender: TObject);
    procedure MSaveASClick(Sender: TObject);
    procedure MTaskClick(Sender: TObject);
  private
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  f: textfile;
  FileName:string;
  WordAction:TWordAction;
  Tree:Ttree;
implementation
{$R *.dfm}


procedure TForm1.MNewClick(Sender: TObject);
begin
  if SaveDialog1.Execute then
  begin
    assignFile(f,SaveDialog1.FileName);
    FileName:=SaveDialog1.FileName;
    rewrite(f)
  end;
  Tree:=Ttree.Create;
end;

procedure TForm1.MOpenClick(Sender: TObject);
begin

Tree:=Tree.Create;

  if OpenDialog1.Execute then
  begin
    //if FileExists(OpenDialog1.FileName)
    //begin
      assignFile(f,OpenDialog1.FileName);
      FileName:=Opendialog1.FileName;
      reset(f)
    //end;
  end;
end;

procedure TForm1.CloseClick(Sender: TObject);
begin
  Tree.ClearTree();
  CloseFile(f);
end;

procedure TForm1.MSaveClick(Sender: TObject);
begin
  CloseFile(f);
  Tree.saveToFile(FileName);
  assignFile(f,FileName);
  reset(f)
end;

procedure TForm1.MAddWordClick(Sender: TObject);
begin
  WordAction:=TWordAction.Create(self);
  WordAction.SetTree(@Tree);
  WordAction.action:=true;
  WordAction.Show;
end;

procedure TForm1.ViewTreeClick(Sender: TObject);
  var
  str:TstringList;
begin
  str:=TstringList.Create;
  Tree.TreeToTstringList(str);
  Tree.TreeViewForm(TreeView1, str);
end;


procedure TForm1.MDeleteWordClick(Sender: TObject);
begin
  WordAction:=TWordAction.Create(self);
  WordAction.SetTree(@Tree);
  WordAction.action:=false;
  WordAction.Show;
end;

procedure TForm1.MClearWordClick(Sender: TObject);
begin
  Tree.ClearTree();
  Tree:=Tree.Create;
end;

procedure TForm1.MSaveASClick(Sender: TObject);
begin
  CloseFile(f);
  if SaveDialog1.Execute then
  begin
    FileName:=SaveDialog1.FileName;
    Tree.saveToFile(FileName);
    assignFile(f,SaveDialog1.FileName);
    reset(f)
  end;

end;

procedure TForm1.MTaskClick(Sender: TObject);
var
  str:TstringList;
begin
  str:=TstringList.Create;
  Tree.TreeToTstringList(str);
  Tree.TaskTree(Memo,str);
end;


end.







