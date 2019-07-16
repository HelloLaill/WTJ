const express=require("express");
const router=express.Router();
const pool=require("../pool");

router.get("/",(req,res)=>{
  var uname=req.query.uname;
  var phone=req.query.phone;
  var email=req.query.email;
  var upwd=req.query.upwd;
  var sql="INSERT INTO wtj_user (uname,phone,email,upwd) VALUES (?,?,?,?)";
  pool.query(sql,[uname,phone,email,upwd],(err,result)=>{
    if(err)throw err;
    console.log(result);
    if(result.length==0){
      res.send({code:-1,msg:"注册失败"});
    }else{
      req.session.uid = 
      result[0].id;
      res.send({code:1,msg:"注册成功"});
    }
  })
})