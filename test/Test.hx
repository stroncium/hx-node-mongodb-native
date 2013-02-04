import node.mongodb.Db;
//~ import node.mongodb.Server;
//~ import node.mongodb.Collection;
import node.Fs;

class Test implements async.Build{

  @async static function goAsync(){
    async(list = node.Fs.readdir('.'));
    trace(list);
    async(text = node.Fs.readFile('text', 'utf8'));
    trace(text);



    //~ var server = new Server("127.0.0.1", 27017, {});
    //~ var db = new Db('test', server, {w: 1});
    //~ var testCollection;
    //~ async(db.open());
    //~ async(!testCollection = db.collection('test'));
    //~ async(docs = testCollection.find({}).toArray());
    //~ trace(docs);
    //~ db.close();
  }
  public static function main(){
    //~ var srv = node.Http.createServer(function(err){
      //~ trace('got server');
    //~ });
    //~ trace(node.Fs.SymlinkType.Custom('qwe'));
    goAsync(afterAsync);
  }

  static function afterAsync(error){
    if(error == null){
      trace('success');
    }
    else{
      trace('error: '+error);
    }
  }
}
