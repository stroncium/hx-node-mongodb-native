var async = async || {}
async.Build = function() { }
var Test = function() { }
Test.__interfaces__ = [async.Build];
Test.goAsync = function(cb) {
	var server = new node.mongodb.Server("127.0.0.1",27017,{ });
	var db = new node.mongodb.Db("test",server,{ w : 1});
	var testCollection;
	db.open(function(__e) {
		if(__e == null) db.collection("test",function(__e1,__0) {
			if(__e1 == null) {
				testCollection = __0;
				testCollection.find({ }).toArray(function(__e2,docs) {
					if(__e2 == null) {
						console.log(docs);
						db.close();
						cb(null);
					} else cb(__e2);
				});
			} else cb(__e1);
		}); else cb(__e);
	});
}
Test.main = function() {
	Test.goAsync(Test.afterAsync);
}
Test.afterAsync = function(error) {
	if(error == null) console.log("success"); else console.log("error: " + error);
}
var node = node || {}
node.HaxeInit = function() { }
if(!node.mongodb) node.mongodb = {}
node.mongodb.HaxeInit = function() { }
var node = {}
node.mongodb = require('mongodb');
Test.main();
