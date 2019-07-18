//1:引入第三方模块
const express = require("express");
const mysql = require("mysql");
const cors = require("cors");
const session = require("express-session");
//2:配置第三方模块
 //2.1:配置连接池
 var pool = mysql.createPool({
   host:"127.0.0.1",
   user:"root",
   password:"",
   port:3306,
   database:"books",
   connectionLimit:15
 })
 //2.2:跨域
 var server = express();
 server.use(cors({
   origin:["http://127.0.0.1:8080",
   "http://localhost:8080"],
   credentials:true
 }))
 //2.3:session
 server.use(session({
   secret:"128位字符串",
   resave:true,
   saveUninitialized:true
 }))
 //2.9:指定静态目录
 server.use(express.static("public"))

 //4.监听端口3000
 server.listen(3000);


// 接口
// 1. 注册接口


// 2. 登录接口
server.get("/login",(req,res)=>{
  var uname=req.query.uname;
  var upwd=req.query.upwd;
  console.log(uname,upwd);
  // console.log(uname,upwd);
  var sql="SELECT * FROM user WHERE uname=? AND upwd = ?";
  pool.query(sql,[uname,upwd],(err,result)=>{
    if(err) throw err;
    if(result.length==0){
      res.send({code:-1,msg:"用户名或密码错误"});
    }else{
      // 获取当前用户登录的id
      req.session.uid=result[0].id;
      res.send({code:1,msg:"登录成功"});
    }
  });
})

// 3. 获取票种信息
server.get("/tics",(req,res)=>{
  var sql="SELECT * FROM tickets";
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    console.log(result);
    res.send(result);
  });
})


// 4. 获取登录用户的订单信息 接口info
server.get("/info",(req,res)=>{
  var id=req.query.uid;
  // var p="18906142799";
  var sql="SELECT * FROM book_info WHERE b_id=?";
  pool.query(sql,id,(err,result)=>{
    if(err) throw err;
    // var gdate=result[0].udate;
    // res.send(gdate);
    console.log(result);
    res.send(result);
  });
})

