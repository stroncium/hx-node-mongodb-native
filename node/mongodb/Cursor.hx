package node.mongodb;
import node.mongodb.HaxeInit;

extern class Cursor<T>{
  function toArray(cb:Dynamic->Array<T>->Void):Void;
  function nextObject(cb:Dynamic->T->Void):Void;
}
