package node;

private typedef Listener = Dynamic;

/*
   emits: newListener
 */
@:native('EventListener')
extern class EventEmitter<T>{
  public function addListener(event:T,fn:Listener):Void;
  public function on(event:T, fn:Listener):Void;
  public function once(event:T,fn:Listener):Void;
  public function removeListener(event:T,listener:Listener):Void;
  public function removeAllListeners(event:T):Void;
  public function listeners(event:T):Array<Listener>;
  public function setMaxListeners(m:Int):Void;
  public function emit(event:T,?arg1:Dynamic,?arg2:Dynamic,?arg3:Dynamic):Void;

  public inline function rawAddListener(event:String,fn:Listener):Void addListener(untyped event, fn)
  public inline function rawOn(event:String, fn:Listener):Void on(untyped event, fn)
  public inline function rawOnce(event:String,fn:Listener):Void once(untyped event, fn)
  public inline function rawRemoveListener(event:String,fn:Listener):Void removeListener(untyped event, fn)
  public inline function rawRemoveAllListeners(event:String):Void removeAllListeners(untyped event)
  public inline function rawListeners(event:String):Array<Listener> return listeners(untyped event)
  public inline function rawEmit(event:String,?arg1:Dynamic,?arg2:Dynamic,?arg3:Dynamic):Void emit(untyped event, arg1, arg2, arg3)
}
