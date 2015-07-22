package node.mongodb;

extern class Cursor<T> implements Node.ModuleSub<'mongodb', '', 'Cursor'>{
  function toArray(cb:Dynamic->Array<T>->Void):Void;
  function nextObject(cb:Dynamic->T->Void):Void;
  // function next(cb:CB<T>):Void;
  function each(cb:Dynamic->T->Void):Void;
  inline function iter(fun:T->Void, end:Dynamic->Void):Void iterate(fun, end);
  inline function iterate(fun:T->Void, end:Dynamic->Void):Void{
    each(function(err, doc){
      if(err != null) return end(err);
      if(doc == null) return end(null);
      fun(doc);
    });
  };

  function batchSize(size:Int):Cursor<T>;
  function limit(limit:Int):Cursor<T>;
  function skip(limit:Int):Cursor<T>;
  function sort(sort:Dynamic<Int>):Cursor<T>;
  function count(cb:Dynamic->Int->Void):Void;
}
