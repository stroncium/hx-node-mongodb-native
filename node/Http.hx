package node;
import node.HaxeInit;
import node.EventEmitter;

private typedef RequestOptions = {
  ?host:String,
  ?hostname:String,
  ?port:Int,
  ?localAddress:Dynamic, //TODO
  ?socketPath:Dynamic,//TODO
  ?method:String,
  ?path:String,
  ?headers:Dynamic,
  ?auth:String,
  ?agent:Dynamic, //TODO
};

extern class Http{
  static function __init__():Void{
    untyped __js__("node.Http = require('http')");
    untyped __js__("node.Http.ServerEvent = {Request: 'request', Connection: 'connection', Close: 'close', CheckContinue: 'checkContinue', Connect: 'connect', Upgrade: 'upgrade', ClientError: 'clientError'};");
    untyped __js__("node.Http.ServerRequestEvent = {Data: 'data', End: 'end', Close: 'close'};");
    untyped __js__("node.Http.ClientResponseEvent = {Data: 'data', End: 'end', Close: 'close'};");
    untyped __js__("node.Http.ClientRequestEvent = {Response: 'response', Socket: 'socket', Connect: 'connect', Upgrade: 'upgrade', Continue: 'continue'};");
    untyped __js__("node.Http.ServerResponseEvent = { Close: 'close' };");
  }

  public static var STATUS_CODES:Array<String>;
  public static var globalAgent:Agent;
  public static function createServer(listener:Dynamic->Void):Server;
  @:override(function(options:String, cb:ClientResponse->Void):ClientRequest{})
  public static function request(options:RequestOptions, cb:ClientResponse->Void):ClientRequest;
  @:override(function(options:String, cb:ClientResponse->Void):Void{})
  public static function get(options:RequestOptions, cb:ClientResponse->Void):Void;



}
@:native('node.Http.ServerEvent')
enum ServerEvent{
  Request;
  Connection;
  Close;
  CheckContinue;
  Connect;
  Upgrade;
  ClientError;
}
extern class Server extends EventEmitter<ServerEvent>{
  @:override(function(port:Int, ?hostname:String, ?backlog:Int, ?cb:Void->Void):Void{})
  @:override(function(path:String, ?cb:Void->Void):Void{})
  public function listen(handle:Dynamic, ?cb:Void->Void):Void; //TODO
  public function close(?cb:Void->Void):Void;
  public var maxHeadersCount:Int;
}

@:native('node.Http.ServerRequestEvent')
enum ServerRequestEvent{
  Data;
  End;
  Close;
}
extern class ServerRequest extends EventEmitter<ServerRequestEvent>{
  public var method(default,null):String;
  public var url(default, null):String;
  public var headers:Dynamic;
  public var trailers(default, null):Dynamic; //TODO
  public var httpVersion(default, null):String;
  public function setEncoding(?encoding:String  = 'utf8'):Void; //TODO
  public function pause():Void;
  public function resume():Void;
  public var connection:node.net.Socket;

}

@:native('node.Http.ServerResponseEvent')
enum ServerResponseEvent{
  Close;
}
extern class ServerResponse extends EventEmitter<ServerResponseEvent>{
  public var statusCode:Int;
  public var sendDate:Bool;
  public function writeContinue():Void;
  @:override(function (statusCode:Int, reasonPhrase:String, ?headers:Dynamic):Void{})
  public function writeHead(statusCode:Int, ?headers:Dynamic):Void;
  public function setHeader(name:String, value:String):Void;
  public function getHeader(name:String):String;
  public function removeHeader(name:String):Void;
  @:override(function write(chunk:Buffer, ?encoding:String = 'utf8'):Void{})
  public function write(chunk:String):Void;
  public function addTrailers(headers:Dynamic):Void;
  @:override(function(data:Buffer, ?encoding:String = 'utf8'):Void{})
  @:override(function(data:String):Void{})
  public function end():Void;
}

extern class Agent{
  public var maxSockets:Int;
  public var sockets:Array<node.net.Socket>;
  public var requests:Array<ClientRequest>;
}

@:native('node.Http.ClientRequestEvent')
enum ClientRequestEvent{
  Response;
  Socket;
  Connect;
  Upgrade;
  Continue;
}

extern class ClientRequest extends EventEmitter<ClientRequestEvent>{
  @:override(function write(chunk:Buffer, ?encoding:String = 'utf8'):Void{})
  public function write(chunk:String):Void;

  @:override(function(data:Buffer, ?encoding:String = 'utf8'):Void{})
  @:override(function(data:String):Void{})
  public function end():Void;

  public function abort():Void;
  public function setTimeout(timeout:Int, cb:Void->Void):Void;
  public function setNoDelay(?noDelay:Bool = true):Void;
  public function setSocketKeepAlive(?enable:Bool = false ?initialDelay:Int = 0):Void;
}

@:native('node.Http.ClientResponseEvent')
enum ClientResponseEvent{
  data;
  end;
  close;
}
extern class ClientResponse extends EventEmitter<ClientResponseEvent>{
  public var statusCode:Int;
  public var httpVersion:String;
  public var headers:Dynamic;
  public var trailers:Dynamic;
  public function setEncoding(?encoding:String = 'utf8'):Void;
  public function pause():Void;
  public function resume():Void;
}
