<template>
  <div id="header">
    <div class="tou-left">
        <div class="tou-left-1"><a href=""><img src="../assets/img/logo.png"/></a>
        <ul class="t-ul">
            <li ><router-link :to="{path:'/'}">首页</router-link></li>
            <li @click="btn1"><router-link :to="{name:'productlist',params:{id:1}}"><img src="../assets/img/tb1.png" alt=""/>客厅</router-link></li>
            <li  @click="btn2"><router-link :to="{name:'productlist',params:{id:2}}"><img src="../assets/img/tb2.png" alt=""/>卧室</router-link></li>
            <li  @click="btn3"><router-link :to="{name:'productlist',params:{id:3}}"><img src="../assets/img/tb3.png" alt=""/>餐厅</router-link></li>
            <li  @click="btn4"><router-link :to="{name:'productlist',params:{id:4}}"><img src="../assets/img/tb4.png" alt=""/>书房</router-link></li>
            <li  @click="btn5"><router-link :to="{name:'productlist',params:{id:5}}"><img src="../assets/img/tb5.png" alt=""/>门厅</router-link></li>
        </ul>
        </div>
        <div class="tou-div-right">
            <router-link :to="{path:'/Cart'}" class="a1">
                <img src="../assets/img/cart.png" />
                <span>购物车</span>
            </router-link>
            <router-link :to="{path:'/'}">
                <span>
                    <img src="../assets/img/login-no.png" alt=""/>
                    <img src="../assets/img/arrow-3.png" alt=""/>
                </span>
            </router-link>
        </div>
    </div>

  </div>

</template>
<script>
 
export default {
  name:"Header",
  inject:['reload'],
	methods:{
		btn1(){
			this.reload()
		},
		btn2(){
			this.reload()
		},
		btn3(){
			this.reload()
		},
		btn4(){
			this.reload()
		},
		btn5(){
			this.reload()
		}
	}
}
</script>
<style scoped>
#header{
    margin-bottom:30px;
    width: 100%;

}

.t-ul{
    display:flex;
    list-style:none;
    margin:0;padding:0;
}
.t-ul li{
    line-height:40px;
    float: left;
    font-size:20px;
    margin-left:10px;

}
.t-ul li a{
    text-decoration:none;
    color:black;
    margin-left:40px;

}

.t-ul li a img{
    margin-right:10px;
}
.tou-div{
    margin-left:30px;
}

.tou-left{
    display:flex;
    justify-content:space-between;
    margin-top: 20px;
    margin-left: 37px;
}
.tou-left-1{
    display: flex;
    margin-left:100px;
}
.tou-div-right{
    margin-right:100px;
    margin-top:10px;
}

.a1{
  text-decoration: none;
  color:#999;
  width:100px;
  height:30px;
  line-height: 30px;
  text-align: center;
  display: inline-block;
}
.a1 img{
  width: 25px;;
}
.tou-div-right .a1 span{
    font-size:14px;

}
</style>
