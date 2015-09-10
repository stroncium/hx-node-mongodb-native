package node.mongodb;

private typedef Error = Dynamic;
private typedef CB = Error->Void;
private typedef CB1<T> = Error->T->Void;

private typedef AggregationQuery = Dynamic;
private typedef AggregationOpts = {
  ?readPreference:Dynamic, //TODO
  ?cursor:Dynamic, //TODO
  ?explain:Bool,
  ?allowDiskUse:Bool,
  ?maxTimeMS:Int,
};

@:jsRequire('mongodb', 'Collection')
extern class Collection<T>{
  var db:Db;
  function new(db:Db, name:String):Void;
  public function find(query:Dynamic, ?fields:Array<String>, ?options:Dynamic):Cursor<T>;
  public inline function insertRaw(doc:Dynamic, ?options:{safe:Bool}, ?cb:CB1<Dynamic>):Void{
    (untyped this).insert(doc, options, cb);
  }

  public inline function insert(doc:T, ?cb:CB1<T>):Void{
    if(cb == null) insertRaw(doc);
    else insertRaw(doc, {safe:true}, function(err, res){
      if(err != null) cb(err, null);
      else cb(null, res[0]);
    });
  }

  public inline function insertMany(docs:Array<T>, ?cb:CB1<Array<T>>):Void{
    if(cb == null) insertRaw(docs);
    else insertRaw(docs, {safe:true}, cb);
  }

  public inline function get(query:Dynamic, fields:Array<String>, cb:CB1<T>):Void{
    this.find(query, fields == null ? [] : fields).limit(1).batchSize(1).nextObject(cb);
  };

  public inline function byId(id:Dynamic, fields:Array<String>, cb:CB1<T>):Void{
    get({_id:id}, fields, cb);
  }

  public inline function removeRaw(query:Dynamic, opts:{?single:Bool, ?w:Dynamic}, ?cb:CB1<Int>):Void{
    (untyped this).remove(query, opts, cb);
  }

  public inline function remove(query:Dynamic, ?cb:CB1<Int>):Void{
    removeRaw(query, cb == null ? {single:true} : {w:1, single:true}, cb);
  }
 
  // public inline function removeOne(query:Dynamic, ?cb:CB1<Int>):Void{
  //   removeRaw(query, cb == null ? {single:true} : {w:1, single:true}, cb);
  // }

  public inline function removeAll(query:Dynamic, ?cb:CB1<Int>):Void{
    removeRaw(query, cb == null ? {} : {w:1}, cb);
  }

  public function aggregate(queries:Array<AggregationQuery>, opts:AggregationOpts, cb:CB1<Dynamic>):Void;

  public inline function findAndModifyRaw(query:Dynamic, sort:Dynamic, update:Dynamic, options:Dynamic, cb:CB1<T>):Void{
    (untyped this).findAndModify(query, sort, update, options, cb);
  }

  public inline function findAndModify(query:Dynamic, sort:Dynamic, update:Dynamic, cb:CB1<T>):Void{
    findAndModifyRaw(query, sort, update, {'new':false}, cb);
  }

  public inline function modifyAndFind(query:Dynamic, sort:Dynamic, update:Dynamic, cb:CB1<T>):Void{
    findAndModifyRaw(query, sort, update, {'new':true}, cb);
  }

  public inline function upsertAndFind(query:Dynamic, sort:Dynamic, update:Dynamic, cb:CB1<T>):Void{
    findAndModifyRaw(query, sort, update, {'new':true, upsert:true}, cb);
  }

  public inline function findAndUpsert(query:Dynamic, sort:Dynamic, update:Dynamic, cb:CB1<T>):Void{
    findAndModifyRaw(query, sort, update, {'new':false, upsert:true}, cb);
  }

  public inline function findAndRemove(query:Dynamic, sort:Dynamic, cb:CB1<T>):Void{
    findAndModifyRaw(query, sort, {}, {'remove':true}, cb);
  }


  // public inline function aggr():AggregateRequest<T> return new AggregateRequest(this);
  // @:extern public inline function search(data:Dynamic, cb){
  //   this.db.command('text'
  // }

  public inline function updateRaw(q:Dynamic, u:Dynamic, o:Dynamic, cb:CB1<Dynamic>):Void (untyped this).update(q, u, o, cb);


  public inline function upsert(query:Dynamic, upd:Dynamic, ?cb:CB1<Int>):Void{
    updateRaw(query, upd, {safe: cb != null, upsert:true}, cb);
  }

  public inline function update(query:Dynamic, upd:Dynamic, ?cb:CB1<Int>):Void{
    updateRaw(query, upd, {safe: cb != null, multi:false}, cb);
  }

  // public inline function updateOne(query:Dynamic, upd:Dynamic, ?cb:CB1<Int>):Void{
  //   updateRaw(query, upd, {safe: cb != null, multi:false}, cb);
  // }

  public inline function updateAll(query:Dynamic, upd:Dynamic, ?cb:CB1<Int>):Void{
    updateRaw(query, upd, {safe: cb != null, multi:true}, cb);
  }

  public function count(q:Dynamic, cb:CB1<Int>):Void;

  public inline function exists(q:Dynamic, cb:CB1<Bool>):Void{
    count(q, function(err, num){
      if(err != null) cb(err, null);
      else cb(null, num > 0);
    });
  }

  public function ensureIndex(idx:Dynamic<Int>, cb:CB1<String>):Void;
  public function createIndex(idx:Dynamic<Int>, cb:CB1<String>):Void;
}
