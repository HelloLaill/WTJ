const express=require("express")
const router=express.Router();
const pool=require("../pool")

router.get("/",(req,res)=>{
  var uid=req.query.uid;
  if(!uid){
    res.send({code:-1,msg:"请登录"});
    return;
  }
  var sql="select wtj_product.pname,wtj_product.spec,wtj_user.uid,wtj_product.price,wtj_cart.cid from wtj_user,wtj_cart,wtj_product where wtj_user.uid=wtj_cart.user_id and wtj_product.pid=wtj_cart.product_id;";
  pool.query(sql,[uid],(err,result)=>{
    if(err)throw err;
    res.send({code:1,data:result})
  })
})

module.exports=router;