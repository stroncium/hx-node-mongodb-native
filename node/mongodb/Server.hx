package node.mongodb;

@:jsRequire('mongodb', 'Server')
extern class Server{
  function new(address:String, port:Int, options:Dynamic):Void;
}
