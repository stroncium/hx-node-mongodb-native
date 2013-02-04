package node.mongodb;
import node.mongodb.HaxeInit;

private typedef Error = Dynamic;
private typedef D = Dynamic;
private typedef CB = Error->Void;
private typedef CB1<T> = Error->T->Void;

extern class Collection<T>{
  function new(db:Db, name:String):Void;
  public function find(query:D, ?fields:Array<String>, ?options:Dynamic):Cursor<T>;
  public function insert(docs:D, options:D, cb:CB):Void;
  public function update(query:D, upd:D, cb:CB):Void;
  public function aggregate(queries:Array<Dynamic>, cb:CB1<Dynamic>):Void;
}
