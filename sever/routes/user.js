const express=require("express")
const router=express.Router();
const pool=require("../pool")

router.get("/",(req,res)=>{
  var nickName=req.session.uid;
})

module.exports=router;