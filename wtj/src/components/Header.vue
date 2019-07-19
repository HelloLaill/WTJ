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
            <router-link :to="{path:'/login'}" class="islogin" >
                <span>
                    <img :src="'http://127.0.0.1:3000/'+img_src" class="img_tx"/>
                    <div class="no">{{islogin}}</div>
                </span>
            </router-link>
        </div>
    </div>

  </div>

</template>
<script>
 
export default {
  name:"Header",
  data(){
      return{
          islogin:"",
          img_src:""
      }
  },
  created(){
    this.loadMore();
  },
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
        },
        loadMore(){
        var url="login";
        var uid=this.$route.params.uid;
        this.axios.get(url).then(result=>{
            console.log(result.data)
            if(uid>=1){
                this.islogin="退出"
                this.img_src="image/touxiang.png"
            }else{
                this.islogin="登录"
                this.img_src="image/login-no.png"
            }
        })
      }
	}
}
</script>
<style scoped>
#header{
    margin-bottom:30px;
    width: 100%;

}
.img_tx{
    width:25px;
    border-radius: 50%;
    border:1px solid #ddd;
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
  width: 25px;
}
.tou-div-right .a1 span{
    font-size:14px;

}

.islogin{
    position: relative;
}
.islogin:hover .no{
    display: block;
}
.no{
    display: none;
    color:#999;
    border:1px solid #eee;
    text-decoration: none;
    font-size: 12px;
    width:100px;
    height:30px;
    line-height: 30px;
    text-align: center;
    position: absolute;
    top:15px;;
    left:-30px;
    z-index: 999;
    background:#fff;
}
</style>
