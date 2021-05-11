var db=require('./database'); 
var data=[]; 
exports.list = function() { 
    let sql = `SELECT *  FROM catalog`;
    db.query(sql, function(err, d) { data = d; });
    return data;
}