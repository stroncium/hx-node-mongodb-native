package node.mongodb;

extern class Server implements Node.ModuleSub<'mongodb', '', 'Server'>{
  function new(address:String, port:Int, options:Dynamic):Void;
}
