package node;
//~ extern class ReadableStreamEvent<T>{
  //~ Data;
  //~ End;
  //~ Error;
  //~ Close;
  //~ Custom(v:T);
//~ }
interface ReadableStream{
  public function hasEventData():Void;
  public function hasEventEnd():Void;
  public function hasEventError():Void;
  public function hasEventClose():Void;
}
//~ stream.readable
//~ stream.setEncoding([encoding])
//~ stream.pause()
//~ stream.resume()
//~ stream.destroy()
//~ stream.pipe(destination, [options])
//~ Writable Stream
//~ Event: 'drain'
//~ Event: 'error'
//~ Event: 'close'
//~ Event: 'pipe'
//~ stream.writable
//~ stream.write(string, [encoding])
//~ stream.write(buffer)
//~ stream.end()
//~ stream.end(string, encoding)
//~ stream.end(buffer)
//~ stream.destroy()
//~ stream.destroySoon()
