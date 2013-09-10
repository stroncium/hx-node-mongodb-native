package node.mongodb;
import node.mongodb.HaxeInit;


extern class ObjectId{
  private static inline function __init__():Void{
    untyped __js__("node.mongodb.ObjectId = node.mongodb.BSONPure.ObjectID;");
    untyped __js__("node.mongodb.ObjectId.fromString = node.mongodb.ObjectId.fromHexString =  function fromString(v){ try{return new node.mongodb.ObjectId(v);} catch(e){return null;}};");
  }

  private function new(str:String):Void;
  public static function fromString(v:String):Null<ObjectId>;
  public static function fromHexString(v:String):Null<ObjectId>;
  public static inline function fromHex(v:String):Null<ObjectId> return fromHexString(v);
  public function equals(v:ObjectId):Bool;
  public function toString():String;
  public inline function toHex():String return this.toHexString();
  public function toHexString():String;
  public static inline function arrayFromStringArray(a:Array<String>, nullifyIfBad:Bool = false):Null<Array<ObjectId>>{
    var ret = [];
    for(str in a){
      var id = fromString(str);
      if(id == null){
        if(nullifyIfBad){
          ret = null;
          break;
        }
      }
      else ret.push(id);
    }
    return ret;
  }
}
