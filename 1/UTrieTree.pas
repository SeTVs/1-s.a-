unit UTrieTree;

interface
  uses SysUtils,UTrieTreeNode,Classes,StdCtrls, ComCtrls;
  Type
    TTree= class
      private
        Froot:Tnode;
      public
        constructor create;
        destructor destroy; override;
        procedure add(wrd:string);
        procedure delete(wrd:string);
        function viewTree():string;
        procedure TreeToTstringList(var str:TstringList);
        procedure saveToFile( FileName: string);
        procedure TreeViewForm(TreeView: TTreeView; str:TstringList);
        procedure ClearTree();
        procedure TaskTree( Memo:tMemo; str:TstringList);

    end;
    implementation
      //+
      constructor TTree.create;
      begin
        inherited create;
        Froot:=TNode.create;
      end;
      //-
      destructor TTree.destroy;
      begin
        Froot.Destroy;
        inherited
      end;
      //добавление
      procedure TTree.add(wrd:string);
      begin
        Froot.add(wrd);
      end;
      //выписывание дерево в string
      function TTree.viewTree():string;
      var str:TstringList;
      wrd:string;
      i:integer;
      begin
        str:=TStringList.Create;
        Froot.view(str,wrd);
          for i:=1 to length(wrd) do
            result:=result+str[i];
        str.clear;
      end;
      //delete слова
      procedure TTree.delete(wrd:string);
      var
        b:boolean;
      begin
        b:=false;
        Froot.delete(wrd,b);
      end;
      //сохранение в text
      procedure TTree.saveToFile( FileName: string);
      var str:TstringList;
      wrd:string;
      begin
        str:=TstringList.Create;
        Froot.view(str,wrd);
        str.SaveToFile(FileName);
      end;

      procedure TTree.TreeToTstringList(var str:TstringList);
      var
        wrd:string;
      begin
        Froot.view(str,wrd);
      end;

      procedure TTree.TreeViewForm(TreeView: TTreeView; str:TstringList);
      var Node: TTreeNode;
          Wrd: string;
          i,j:integer;
      begin
        TreeView.items.clear;
        for i:=0 to str.Count-1 do
          begin
            Node := nil;
            wrd:=str[i];
            for j:=1 to length(wrd) do
              Node :=TreeView.Items.AddChild(Node,wrd[j]);
        end;
      end;

      procedure Ttree.ClearTree();
      begin
        Froot.clear()
      end;

      procedure TTree.TaskTree( Memo:tMemo; str:TstringList);
      var
          Wrd: string;
          i,count:integer;
      begin
        count:=0;
        Memo.Lines.clear;
        Memo.Lines.add('Слова:');
        for i:=0 to str.Count-1 do
          begin
            wrd:=str[i];
            if Pos('a',wrd)<>0 then
            begin
              Memo.Lines.add(wrd);
              inc(count);
            end;
        end;
        Memo.Lines.add('Кол-во = '+intTostr(count));
      end;


end.
