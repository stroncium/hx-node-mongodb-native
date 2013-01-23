package node.mongodb;
import node.mongodb.HaxeInit;

private typedef D = Dynamic;

extern class Collection<T>{
  function new(db:Db, name:String):Void;
  public function find(query:D):Cursor<T>;
  public function insert(docs:D, options:D, cb:D->Void):Void;
  public function update(query:D, upd:D, cb:D->Void):Void;
}
