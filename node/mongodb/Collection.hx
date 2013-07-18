package node.mongodb;
import node.mongodb.HaxeInit;
using node.mongodb.Mixins;

private typedef Error = Dynamic;
private typedef CB = Error->Void;
private typedef CB1<T> = Error->T->Void;


extern class Collection<T>{
  var db:Db;
  function new(db:Db, name:String):Void;
  public function find(query:Dynamic, ?fields:Array<String>, ?options:Dynamic):Cursor<T>;
  private function insert(doc:Dynamic, ?options:{safe:Bool}, ?cb:CB1<Dynamic>):Void;

  public inline function insertNow(doc:T):Void this.insert(doc);
  public inline function insertSafe(doc:T, cb:CB1<T>):Void{
    untyped this.insert(doc, {safe:true}, function(err, res){
      if(err != null) cb(err, null);
      else cb(null, res[0]);
    });
  }

  public inline function get(query:Dynamic, fields:Array<String>, cb:CB1<T>):Void{
    this.find(query, fields).nextObject(cb);
  };

  public function remove(query:Dynamic, ?justOne:Bool):Void;
  public function update(query:Dynamic, upd:Dynamic, ?options:Dynamic, ?cb:CB1<Int>):Void;
  public function aggregate(queries:Array<Dynamic>, opts:Dynamic, cb:CB1<Dynamic>):Void;
  public function findAndModify(query:Dynamic, sort:Dynamic, update:Dynamic, options:Dynamic, cb:CB1<T>):Void;

  public inline function modifyAndFind(query:Dynamic, sort:Dynamic, update:Dynamic, cb:CB1<T>):Void{
    findAndModify(query, sort, update, {'new':true}, cb);
  }


  public inline function aggr():AggregateRequest<T> return new AggregateRequest(this);
  // @:extern public inline function search(data:Dynamic, cb){
  //   this.db.command('text'
  // }

  public inline function upsert(query:Dynamic, upd:Dynamic, ?cb:CB1<Int>):Void{
    this.update(query, upd, {safe: cb != null, upsert:true}, cb);
  }

  public inline function updateOne(query:Dynamic, upd:Dynamic, ?cb:CB1<Int>):Void{
    this.update(query, upd, {safe: cb != null, multi:false}, cb);
  }

  public inline function updateAll(query:Dynamic, upd:Dynamic, ?cb:CB1<Int>):Void{
    this.update(query, upd, {safe: cb != null, multi:true}, cb);
  }

}
