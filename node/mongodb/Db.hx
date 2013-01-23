package node.mongodb;
import node.mongodb.HaxeInit;

extern class Db{
  function new(name:String, server:Server, options:Dynamic):Void;
  function open(cb:Dynamic->Void):Void;
  function collection<T>(name:String, cb:Dynamic->Collection<T>->Void):Void;
  function close():Void;
}
