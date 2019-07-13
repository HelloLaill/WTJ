//使用express构建web服务器 --11:25
const express = require('express');
const mysql = require('mysql');
const bodyParser = require('body-parser');
const session=require("express-session");
//npm i -save cors
const cors=require("cors");
var pool = mysql.createPool({
  host: '127.0.0.1',
  user: 'root',
  password: '',
  database: 'wtj',
  connectionLimit: 15 
});
//跨域
var server = express();
server.use(cors({
  origin:["http://127.0.0.1:8080",
  "http://localhost:8080"],
  credentials:true
}))
server.use(session({
  secret:"128位字符串",  //自定义字符串用于加密数据使用
  resave:true,          //每次请求更新数据
  saveUninitialized:true//保存初始化数据
}))
//使用body-parser中间件
server.use(bodyParser.urlencoded({extended:false}));
//托管静态资源到public目录下
server.use(express.static('public'));
server.listen(3000)

//以下是功能

//查询指定用户购物车列表
server.get("/cart",(req,res)=>{
  //1:参数(无参数)
  //console.log(req.session.uid);
  var uid=1;
  var output={
    product:{}
  }
  if(!uid){
    res.send({code:-1,msg:"请登录"});
    return;
  }
  //2:sql
  var sql="select wtj_product.pname,wtj_product.spec,wtj_product.price,wtj_user.uid,wtj_product.pid,wtj_cart.count,wtj_product_img.sm from wtj_user,wtj_cart,wtj_product,wtj_product_img where wtj_user.uid=wtj_cart.user_id and wtj_product.pid=wtj_cart.product_id and wtj_product.pid=wtj_product_img.product_id and wtj_user.uid=? group by wtj_product.pid having count>1";
  pool.query(sql,2,(err,result)=>{
    if(err)throw err;
    res.send({code:1,data:result})
    output.product=result[0];
    console.log(output.product);
  })
})

//删除购物车中商品
server.get("/delItem",(req,res)=>{
  //1:参数购物车id
  var id = req.query.id;
  //2:sql 删除指定数据
  var sql = "DELETE FROM wtj_cart WHERE cid = ?";
  //3:json
  pool.query(sql,[id],(err,result)=>{
    if(err)throw err;
    console.log(result);
    if(result.affectedRows>0){
      res.send({code:1,msg:"删除成功"});
    }else{
      res.send({code:-1,msg:"删除失败"});
    }
  })
});

//删除购物车所有选中的商品
server.get("/delAll",(req,res)=>{
  //1:参数 1,2,3
  var ids = req.query.ids;
  //2:sql
  var sql = `DELETE FROM wtj_cart WHERE cid IN (${ids})`;
  //3:json
  pool.query(sql,(err,result)=>{
    if(err)throw err;
    if(result.affectedRows>0){
      res.send({code:1,msg:"删除成功"});
    }else{
      res.send({code:-1,msg:"删除失败"});
    }
  })
});


//商品分页显示
server.get("/productList",(req,res)=>{
  var pno=req.query.pno;
  var ps=req.query.pageSize;
  if(!pno){pno=1}
  if(!ps){ps=8}
  var obj={code:1,msg:"查询成功"};
  var sql="select wtj_product.pid,wtj_product.pname,wtj_product.ptitle,wtj_product.spec,wtj_product.price,wtj_product_img.lg from wtj_product,wtj_product_img where wtj_product.pid=wtj_product_img.product_id group by wtj_product.pid limit ?,?"
  var off=(pno-1)*ps;
  ps=parseInt(ps);
  pool.query(sql,[off,ps],(err,result)=>{
    if(err) throw err;
    obj.data=result;
    var sql ="select count(*) as c from wtj_product";
    pool.query(sql,(err,result)=>{
      if(err)throw err;
      var pc=Math.ceil(result[0].c/ps);
      obj.pc=pc;
      res.send(obj);
      console.log(obj);
    })
  })
})