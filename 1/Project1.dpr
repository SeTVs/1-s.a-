program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  UTrieTreeNode in 'UTrieTreeNode.pas',
  UTrieTree in 'UTrieTree.pas',
  UWordAction in 'UWordAction.pas' {WordAction};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TWordAction, WordAction);
  Application.Run;
end.
