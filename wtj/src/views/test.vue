<template>
  <div id="product">
    <Header></Header>
    <div class="banner_all_box">
      <!-- 导航栏部分 -->
      <div class="productdetails_nav">
        <a href="#">首页</a>
        <i>&gt;</i>
        <a href="#">商品</a>
        <i>&gt;</i>
        <a href="#" title="帕拉多米简约现代麻布面料混色休闲椅">帕拉多米简约现代麻布面料混色休闲椅</a>
      </div>
    </div>
    <div class="detail">
      <div class="top">
        <span>商品描述</span>
      </div>
      <!-- 商品故事 -->
      <div class="stroy">
        <h2 class="h2">商品故事</h2>
        <div class="span1">圆润外观,胖胖的身材,给你更多安全感,让身体沉浸在沙发的舒适怀抱中</div>
        <span class="bor"></span>
      </div>
      <!-- 商品参数 -->
      <div class="specs">
        <h2 class="h2">商品参数</h2>
        <div class="span1">
          <div class="name"><span class="specss">商品名称： </span></div>
          <div class="title"><span class="specsss">商品故事： </span></div>
          <div class="spec"><span class="specss">商品规格： </span></div>
          <div class="color"><span class="specsss">商品颜色： </span></div>
          <div class="type_style"><span class="specss">商品风格： </span></div>
          <div class="style_id"><span class="specsss">商品系列： </span></div>
        </div>
        <div class="cart">
          <div class="price">商品价格： </div>
          <a href="" class="cartBtn">加入购物车</a>
        </div>
        <span class="bor"></span>
      </div>
      <!-- 规格图片 -->
      <div class="proImg clear">
        <h2 class="h2">规格图片</h2>
        <div class="img">
          <img src="../assets/img/3.png">
        </div>
      </div>
    </div>
    <Footer></Footer>
  </div>

</template>
<script>
import Header from "@/components/Header.vue"
import Footer from "@/components/Footer.vue"
export default {
  name:"productList",
  components: {
    Header,
    Footer
  },
  data(){
    return{}
  }
}
</script>
<style scoped>
#product{
  margin:0 auto;
}
.clear:after{
  content: "";
  display: block;
  clear: both;
}
.productdetails_nav {
	height: 52px;
	width: 400px;
	line-height: 52px;
	margin-left:50px;
}
/*  导航栏中的a标签样式*/

.productdetails_nav a {
    padding: 5px;
    display: inline-block;
    color: #999999;
    position: relative;
    height: 12px;
    line-height: 12px;
    margin-top: 20px;
    text-decoration: none;
    font-size: 12px;
    font-family: Microsoft Yahei;
}
.top{
  width: 100%;
  border-bottom:1px solid #eee;
  padding:30px;
}
.top>span{
  color:#666;
}
.stroy,.specs{
  margin:0 auto;
  width: 90%;
  position: relative;
}
.h2{
  color:#333;
  font-size: 30px;
  padding:10px 0;
  text-align: left;
}
.span1{
  color:#666;
  font-size: 14px;
  text-align: left;
  margin-bottom:40px;
}
.bor{
  display: block;
  width:50px;
  height:2px;
  background:#999;
}
.specss{
  background:#eee;
}
.specsss{background:#fff}

.name,.spec,.type_style{
  padding:5px 0;
}

.cart{
  border:1px solid #ccc;
  width:300px;
  height:120px;
  position: absolute;
  top:80px;
  right:10%;
}
.price{
  text-align: center;
  padding:20px 0;
}
.cartBtn{
  display: block;
  width: 100px;
  height: 35px;
  border-radius: 5px;
  background:#666;
  color:#fff;
  text-decoration: none;
  text-align: center;
  line-height: 35px;
  margin: 0 auto;
}
.proImg{
  width: 90%;
  margin:0 auto;
}
.img{
  margin-left:50px;
  float: left;
}
.img>img{
  width:620px;
}
</style>
