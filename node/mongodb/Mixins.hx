package node.mongodb;
import AsyncTypedefs;
@:access(node.mongodb.Collection)
@:publicFields
@:native('node._mongodb.Mixins')
class Mixins{
  @:extern static inline function findOne<T>(c:node.mongodb.Collection<T>, query:Dynamic, fields:Array<String>, cb:CB1<Dynamic>):Void{
    c.find(query, fields, {limit:1}).nextObject(cb);
  };
  @:extern static inline function getIncCounter<T>(c:node.mongodb.Collection<T>, query:Dynamic, name:String, cb:CB1<Int>):Void{
    var inc = {};
    Reflect.setField(inc, name, 1);
    c.findAndModify(query, {}, {'$inc':inc}, {'new':true}, function(err, res){
      if(err == null){
        if(res == null){
          cb("Counter document doesn't exist.", -1);
        }
        else{
          cb(null, Reflect.field(res, name));
        }
      }
      else cb(err, -1);
    });
  }
  @:extern static inline function getCounterInc<T>(c:node.mongodb.Collection<T>, query:Dynamic, name:String, cb:CB1<Int>):Void{
    var inc = {};
    Reflect.setField(inc, name, 1);
    c.findAndModify(query, {}, {'$inc':inc}, {'new':false}, function(err, res){
      if(err == null){
        if(res == null){
          cb("Counter document doesn't exist.", -1);
        }
        else{
          cb(null, Reflect.field(res, name));
        }
      }
      else cb(err, -1);
    });
  }

  @:extern static inline function upsertNow<T>(c:node.mongodb.Collection<T>, query:Dynamic, upd:Dynamic){
    c.update(query, upd, {upsert:true});
  }

  @:extern static inline function upsertSafe<T>(c:node.mongodb.Collection<T>, query:Dynamic, upd:Dynamic){
    c.update(query, upd, {upsert:true, safe:true});
  }
  
  @:extern static inline function updateNow<T>(c:node.mongodb.Collection<T>, query:Dynamic, upd:Dynamic){
    c.update(query, upd);
  }

  @:extern static inline function updateMultiNow<T>(c:node.mongodb.Collection<T>, query:Dynamic, upd:Dynamic){
    c.update(query, upd, {multi:true});
  }
  
  @:extern static inline function updateSafe<T>(c:node.mongodb.Collection<T>, query:Dynamic, upd:Dynamic, cb:CB1<Int>){
    c.update(query, upd, {safe:true}, cb);
  }

  @:extern static inline function updateMultiSafe<T>(c:node.mongodb.Collection<T>, query:Dynamic, upd:Dynamic, cb:CB1<Int>){
    c.update(query, upd, {multi:true, safe:true}, cb);
  }
  
}