const express=require("express");
const router=express.Router();
const pool=require("../pool");

router.get("/",(req,res)=>{
  var uname=req.query.uname;
  var upwd=req.query.upwd;
  var phone=req.query.phone;
  
})