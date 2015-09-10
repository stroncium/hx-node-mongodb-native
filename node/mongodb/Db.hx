package node.mongodb;

@:jsRequire('mongodb', 'Db')
extern class Db{
  function new(name:String, server:Server, options:Dynamic):Void;
  function open(cb:Dynamic->Void):Void;
  function collection<T>(name:String, ?cb:Dynamic->Collection<T>->Void):Collection<T>;
  function close():Void;

  function ensureIndex(clx:String, keys:Dynamic, opts:Dynamic, cb:Dynamic->String->Void):Void;
}
