package node.mongodb;
import node.mongodb.HaxeInit;
import AsyncTypedefs;

extern class Cursor<T>{
  function toArray(cb:CB1<Array<T>>):Void;
  function nextObject(cb:CB1<T>):Void;
  function each(cb:CB1<T>):Void;
  inline function iter(fun:T->Void, end:CB):Void iterate(fun, end);
  inline function iterate(fun:T->Void, end:CB):Void{
    each(function(err, doc){
      if(err != null) return end(err);
      if(doc == null) return end(null);
      fun(doc);
    });
  };
}
