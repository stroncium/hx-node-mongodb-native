package node.mongodb;
private typedef CB1<T> = Dynamic->T->Void;
@:native('node.mongodb_AggregateRequest')
class AggregateRequest<T>{
  var clx:Collection<T>;
  var queries:Array<Dynamic>;
  public function new(clx){
    this.clx = clx;
    this.queries = [];
  }

  @:extern public inline function match(q:Dynamic, ?cb) return query({'$match':q}, cb);
  @:extern public inline function project(q:Dynamic, ?cb) return query({'$project':q}, cb);
  @:extern public inline function limit(num:Int, ?cb) return query({'$limit':num}, cb);
  @:extern public inline function skip(num:Int, ?cb) return query({'$skip':num}, cb);
  @:extern public inline function unwind(path:String, ?cb) return query({'$unwind': '$$'+path}, cb);
  @:extern public inline function group(q:Dynamic, ?cb) return query({'$group':q}, cb);
  @:extern public inline function sort(q:Dynamic, ?cb) return query({'$sort':q}, cb);

  @:extern public inline function query(q:Dynamic, ?cb){
    queries.push(q);
    if(cb != null) exec(cb);
    return this;
  }

  @:extern public inline function exec(cb:CB1<Array<Dynamic>>){
    clx.aggregate(queries, {}, cb);
  }

}