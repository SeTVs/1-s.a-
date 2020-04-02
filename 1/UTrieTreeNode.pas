unit UTrieTreeNode;

interface
  uses SysUtils,classes;
  const
    LowCh= 'a';
    HighCh= 'z';
  type
    tIndex= LowCh..HighCh;//a..z

    tNode = class
    private
      fPoint:boolean;
      Fnext:array [Tindex] of tNode;
    protected

    public
      constructor create;
      destructor destroy;override;
      procedure add(var wrd:string);
      function isEmpty():boolean;
      function delete(wrd:string; var IsLastWord:Boolean):boolean;
      procedure view(var str:TstringList; wrd:string);
      procedure clear();
   end;
implementation
  //конструктор
  constructor tNode.create;
  var i:tIndex ;
  begin
  inherited create;
  Fpoint:=false;//?
  for i:=lowCh to highCh do
    fNext[i]:=nil;
  end;
  //~
  destructor tNode.destroy;
  var i:tIndex ;
  begin
    for i:=lowCh to highCh do
    FreeAndNil(fNext[i]);
  inherited;
  end;
  //
  function tNode.isEmpty;
  var c:char ;
  begin
  result:=true;
  for c:=lowCh to highCh do
    if fNext[c]<>nil then
      result:=false;
  end;
  //добавление
  procedure tNode.add(var wrd:string);
  var f:char;
  begin
    if wrd='' then
      FPoint:=true
    else
    begin
      f:=wrd[1];
      system.delete(wrd,1,1);
        if FNext[f]=nil then
        FNext[f]:=TNode.Create;
      FNext[f].add(wrd)
    end;
  end;
  //удаление
  function tNode.delete(wrd:string; var IsLastWord:Boolean):boolean;
  var f:char;
  begin
    if wrd='' then
    begin
      if self.IsEmpty() then
      IsLastWord:=true;
      FPoint:=false;
      result:=true;
    end
    else
    begin
      f:=wrd[1];
      system.delete(wrd,1,1);

      if (FNext[f]<>nil) and FNext[f].delete(wrd,IsLastWord)
      then
        if FNext[f].Fpoint then
        result:=false
      else
        if IslastWord then
        FreeAndNil(fnext[f]);
     end;
   end;

  procedure tNode.view(var str:TstringList; wrd:string);
      var c:char;
      pWrd:string;
      begin
        if self.Fpoint then
          begin
            str.add(wrd);
          end;

      for c:=LowCh to HighCh do
        if Fnext[c]<>nil then
        begin
          pwrd:=wrd+c;
          Fnext[c].view(str,pwrd);
        end;
      end;

  procedure tNode.Clear();
  var c:char;
  begin
  while FPoint and self.isEmpty do
    for c:=lowCh to highCh do
      if fnext[c]<>nil then
      fnext[c].Clear();
  FreeAndNil(self);
  end;

end.
 