package node.net;

import node.net.HaxeInit;
//~ import node.Node;

@:native('node.net.Socket.SocketEvent')
enum SocketEvent{
  Connect;
  Data;
  End;
  Timeout;
  Drain;
  Error;
  Close;
}
// Emits: connect,data,end,timeout,drain,error,close
extern class Socket extends node.EventEmitter<SocketEvent> {
  static function __init__():Void{
    untyped __js__("node.net.Socket.SocketEvent = {Connect:'connect', Data:'data', End:'end', Timeout:'timeout', Drain: 'drain', Error:'error', Close:'close'}");
  }
  var remoteAddress:String;
  var remotePort:Int;
  var bufferSize:Int;
  var bytesRead:Int;
  var bytesWritten:Int;

  public function new();

  //~ @:overload(function(path:String,?cb:Void->Void):Void {})
  //~ @:overload(function(options:NodeConnectionOpt,connectionListener:Void->Void):Void {})
  function connect(port:Int,?host:String,?cb:Void->Void):Void;
  function setEncoding(enc:String):Void;
  function setSecure():Void;
  @:overload(function(data:Dynamic,?enc:String,?fileDesc:Int,?cb:Void->Void):Bool {})
  function write(data:Dynamic,?enc:String,?cb:Void->Void):Bool;
  function end(?data:Dynamic,?enc:String):Void;
  function destroy():Void;
  function pause():Void;
  function resume():Void;
  function setTimeout(timeout:Int,?cb:Void->Void):Void;
  function setNoDelay(?noDelay:Bool):Void;
  function setKeepAlive(enable:Bool,?delay:Int):Void;
  function address():{address:String,port:Int};
}
