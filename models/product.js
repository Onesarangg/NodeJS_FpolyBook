var db=require('./database'); 
var data=[]; 
exports.list = function() { 
    let sql = `SELECT *  FROM product`;
    db.query(sql, function(err, d) { data = d; });
    return data;
}
exports.new = function() { 
    let sql = `SELECT * FROM product WHERE dateUpdate ORDER BY dateUpdate DESC`;
    db.query(sql, function(err, d) { data = d; });
    return data;
}
exports.view = function() { 
    let sql = `SELECT * FROM product WHERE view ORDER BY view DESC`;
    db.query(sql, function(err, d) { data = d; });
    return data;
}
exports.viewId = function(id) { 
    let sql = `SELECT * FROM product WHERE idCat = ? ORDER BY idCat`;
    db.query(sql, id, function(err, d) { data = d; });
    return data;
}
exports.viewName = function(name) { 
    let sql = `SELECT * FROM product WHERE namePro = ${name} LIKE %${name}%`;
    db.query(sql, name, function(err, d) { data = d; });
    return data;
}
exports.hot = function() { 
    let sql = `SELECT * FROM product WHERE soLuongDaBan ORDER BY soLuongDaBan DESC`;
    db.query(sql, function(err, d) { data = d; });
    return data;
}
exports.create = function(data) { 
    let sql = 'INSERT INTO product SET ?';
    db.query(sql, data, (err, d) => { if (err) throw err; data = d;});
    return data;
} 
exports.update = function(id, data) {
    let sql = 'UPDATE product  SET ? WHERE idProduct = ?';
    db.query(sql, [data, id], (err, d) => {if (err) throw err; data = d; });
    return data;
} 
exports.read= function(id) {
    let sql = 'SELECT * FROM product WHERE idProduct = ?'    
    db.query(sql, id, (err, d) => {data = d[0]; });
    return data;
} 
exports.delete = function(id) {
    let sql = 'DELETE FROM product WHERE idPro = ?'
    db.query(sql, id , (err, d) => {
        if (err) throw err;
        data = d;
    });
return data;
}