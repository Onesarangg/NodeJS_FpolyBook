const { json } = require('express');
var express = require('express');
var router = express.Router();
var modelProduct = require('./../models/product'); 
var modelCatalog = require('./../models/catalog'); 
var db=require('./../models/database'); 

router.get('/',  (req, res, next) => {  
    let listCat = modelCatalog.list();
    res.render("list-product", {cat:listCat}); 
});

router.get('/spnew',  (req, res, next) => { 
    let listCat = modelCatalog.list();
    res.render("new-product", {cat:listCat});
});

router.get('/spview',  (req, res, next) => { 
    let listCat = modelCatalog.list();
    res.render("view-product", {cat:listCat});
});

router.get('/sphot',  (req, res, next) => { 
    let listCat = modelCatalog.list();
    res.render("hot-product", {cat:listCat});
});

router.get('/sploai/:id',  (req, res, next) => { 
    let listCat = modelCatalog.list();
    res.render("cat-product", {cat:listCat}).send(id);
});

router.get('/get/:id',  (req, res, next) => { 
    let id = req.params.id;
    let listCat = modelCatalog.list();
    res.render("detail", {cat:listCat}).send(id);
});

router.get('/tim',  (req, res, next) => { 
    let ten = req.query.search;
    console.log(ten);
    let listCat = modelCatalog.list();
    let sqlCat = `SELECT * FROM catalog`;
    let detailPro = `SELECT * FROM product WHERE namePro LIKE '%${ten}%'` ;
    db.query(detailPro, ten, function(err, detail){
        res.render("search-pro",{moi:detail});
    });       
});

router.get('/pro',  (req, res, next) => { 
    let listpro = modelProduct.list();
    res.json(listpro);
});

router.get('/search/product/search/:name',  (req, res, next) => { 
    let name = req.params.name;
    let viewName = modelProduct.viewName(name);
    res.json(viewName);
});

router.get('/new',  (req, res, next) => { 
    let moi = modelProduct.new();
    res.json(moi); 
});

router.get('/view',  (req, res, next) => { 
    let xem = modelProduct.view();
    res.json(xem); 
});

router.get('/hot',  (req, res, next) => { 
    let mua = modelProduct.hot();
    res.json(mua); 
});

router.get('/loai/product/sploai/:id',  (req, res, next) => { 
    let id = req.params.id;
    let viewId = modelProduct.viewId(id);
    res.json(viewId); 
});

router.post('/', (req, res, next) => {
    let data = req.body;
	modelProduct.create(data);
    res.json({thongbao:"Đã thêm  xong một user mới"});
});

router.get('/detail/product/get/:id', (req, res, next) => {
    let id = req.params.id;      
    var u =  modelProduct.read(id);
    res.json(u);
});

router.put('/:id', async (req, res, next)=> {
    let data = req.body; 
    let id = req.params.id;
    await modelProduct.update(id, data);	
    res.json({thongbao: 'Đã cập nhật user'});
});

router.delete('/:id', function(req, res) {
    let id = req.params.id;
    modelProduct.delete(id);
    res.json({thongbao: 'Đã xóa thành công'});
});

module.exports = router;