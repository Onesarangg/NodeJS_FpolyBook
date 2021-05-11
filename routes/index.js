var express = require('express');
var router = express.Router();
const nodemailer = require("nodemailer");
const { render } = require('../app');
var modelCatalog = require('./../models/catalog'); 

/* GET home page. */
router.get('/',  (req, res, next) => { 
  let listCat = modelCatalog.list(); 
  res.render("home", {cat:listCat}); 
});

router.get('/testsendmail', function(req, res, next) {
  res.render('testsendmail.ejs'); 
});

router.post('/testsendmail_', function(req, res, next) {
  var transporter = nodemailer.createTransport({  
  service: 'gmail',  
  auth: { 
    user: 'quanhlnnps13831@fpt.edu.vn',
    pass: 'lenguyennhuquanh140901' 
  }
  });  
  var mailOptions = { 
    from: 'quanhlnnps13831@fpt.edu.vn',  
    to: req.body.emailnhan,  
    subject: req.body.tieude, 
    //text: 'Nội dung thư, không có code html' 
    html: req.body.noidung,
    attachments :
      {
        filename: req.body.hinh,
        path: req.body.hinh.name
      }
    
  };  
  transporter.sendMail(mailOptions, function(error, info){  
  if (error) console.log(error); 
  else console.log('Đã gửi mail: ' + info.response); 
  res.render('ok');
  });
});//

module.exports = router;
