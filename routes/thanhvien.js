var express = require('express');
var router = express.Router();
var db=require('../models/database'); 
const nodemailer = require("nodemailer");
const bcrypt = require("bcrypt"); 
var salt = bcrypt.genSaltSync(10);

router.get('/dangky', function(req, res, next) {
     res.render("dangky.ejs");
});

router.post('/luu', function(req, res, next) {
    let u = req.body.username;
    let p = req.body.password;
    let em = req.body.email;  
    let ho = req.body.ho;
    let ten = req.body.ten;
    let so = req.body.sothich;
    let ti = req.body.tinh;
    var pass_mahoa = bcrypt.hashSync(p, salt);
    let user_info ={username: u, password:pass_mahoa, email:em, ho:ho, ten:ten, sothich:so, tinh:ti};  
    let sql = 'INSERT INTO user SET ?';
    db.query(sql, user_info);
    res.redirect("/");
})

router.get('/dangnhap', function(req, res, next) {
    res.render("dangnhap.ejs");
});

router.get('/download', function(req, res, next) {
    if (req.session.daDangNhap) {
        if(req.session.rule == 1){
            res.render("testsendmail",{un:req.session.Username});
        } else {
            res.render("download.ejs",{un:req.session.Username});
        }  
    }
    else { 
        req.session.back="/thanhvien/download";
        res.redirect("/thanhvien/dangnhap");
    }
});

router.post('/dangnhap_', async function(req, res, next) {
    let u = req.body.username;
    let p = req.body.password;
    let sql = 'SELECT * FROM user WHERE Username = ?';
    db.query(sql, [u] , (err, rows) => {   
        if (rows.length<=0) { res.redirect("/thanhvien/dangnhap"); return;}
        let user = rows[0];        
        let pass_fromdb = user.Password;        
        const bcrypt = require("bcrypt");        
        var kq = bcrypt.compareSync(p, pass_fromdb);
        if (kq){ 
            console.log('Hi! ' + user.Username);  
            //var sess = req.session;  //initialize session variable
            req.session.daDangNhap = true;
            req.session.username = user.Username;  
            req.session.rule = user.rule;                   
            res.redirect("/thanhvien/download");
        }   
        else {
            res.redirect("/thanhvien/dangnhap");
        }
    });   
});

router.get('/thoat', function(req, res, next) {
    req.session.destroy();
    res.redirect("/thanhvien/dangnhap");
});

router.get('/doimk', function(req, res, next) {
    res.render("doimk.ejs");
});

router.post('/domk', function(req, res, next) {
    let pass = req.body.pass;
    let mail = req.body.email;
    if (pass.Empty){
        console.log('Nhập pass mới');
    } else {
        var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/; 
        if (filter.test(mail)) { 
            let sql = `SELECT * FROM user WHERE email = "${mail}"`;        
            //console.log(sql);
            db.query(sql, [mail], (err, d) => {
                if (d.length > 0){
                    var transporter = nodemailer.createTransport({  
                        service: 'gmail',  
                        auth: { 
                          user: 'quanhlnnps13831@fpt.edu.vn',
                          pass: 'lenguyennhuquanh140901' 
                        }
                        });  
                        var mailOptions = { 
                          from: 'quanhlnnps13831@fpt.edu.vn',  
                          to: mail,  
                          subject: '(FPoly) Xác nhận đổi mật khẩu', 
                          //text: 'Nội dung thư, không có code html' 
                          html: 'Đăng nhập lại để đổi mật khẩu của bạn http://localhost:3000/thanhvien/dangnhap',                        
                        };
                        transporter.sendMail(mailOptions, function(error, info){  
                        if (error) console.log(error); 
                        else console.log('Đã gửi mail: ' + info.response); 
                        });
                        let pass_mahoa = bcrypt.hashSync(pass, salt);
                        let uppro = `UPDATE user SET Password = '${pass_mahoa}' WHERE email = '${mail}'`;
                        db.query(uppro, function(err, d) {
                                if (err) throw err;        
                                data = d;
                                console.log('Thành công');
                             });
                        res.redirect("/thanhvien/xacnhan");
                } else {
                    res.redirect("/thanhvien/doimk");
                }    
            });      
        } else {
            console.log('Nhập email hợp lệ');
        }
    }
});

router.get('/xacnhan', function(req, res, next) {
    res.render("xacnhan.ejs");
});

router.get('/quenmk', function(req, res, next) {
    res.render("quenmk.ejs");
});

router.post('/quemk', function(req, res, next) {
    let mail = req.body.email;
    if (mail.Empty){
        console.log('Nhập mail');
    } else {
        var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/; 
        if (filter.test(mail)) { 
            let sql = `SELECT * FROM user WHERE email = "${mail}"`;        
            //console.log(sql);
            db.query(sql, [mail], (err, d) => {
                if (d.length > 0){
                    var randomstring = Math.random().toString(36).slice(-8);
                    var transporter = nodemailer.createTransport({  
                        service: 'gmail',  
                        auth: { 
                          user: 'quanhlnnps13831@fpt.edu.vn',
                          pass: 'lenguyennhuquanh140901' 
                        }
                        });  
                        var mailOptions = { 
                          from: 'quanhlnnps13831@fpt.edu.vn',  
                          to: mail,  
                          subject: '(FPoly) Yêu cầu cấp lại mật khẩu', 
                          //text: 'Nội dung thư, không có code html' 
                          html: 'Password mới của bạn là ' + randomstring + ' .Đừng quên password nữa nhé',                        
                        };
                        transporter.sendMail(mailOptions, function(error, info){  
                        if (error) console.log(error); 
                        else console.log('Đã gửi mail: ' + info.response); 
                        });
                    let pass_mahoa = bcrypt.hashSync(randomstring, salt);
                    let uppro = `UPDATE user SET Password = '${pass_mahoa}' WHERE email = '${mail}'`;
                    db.query(uppro, function(err, d) {
                                if (err) throw err;        
                                data = d;
                                console.log('Thành công');
                             });
                             res.redirect("/thanhvien/dangnhap");
                } else {
                    res.redirect("/thanhvien/quenmk");
                }    
            });      
        } else {
            console.log('Nhập email hợp lệ');
        }
    }
});
module.exports = router;