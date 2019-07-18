<template>
  <div id="productList">
    <Header></Header>
    <div class="listContent clear">
      <div class="product" v-for="(item,i) of list" :key="i">
        <router-link class="img_show" :to="{name:'Product',params:{id:item.pid}}">
          <img :src="'http://127.0.0.1:3000/'+item.lg">
        </router-link>
        <div class="font">
          <div class="title">{{item.pname}}</div>
          <div class="story">{{item.ptitle}}</div>
          <div class="price">价格：￥{{item.price.toFixed(2)}}</div>
          <div class="spec">规格：{{item.spec}}</div>
        </div>
        
      </div>

    </div>
    <div class="loadmore">
      <a href="javascript:;" class="more" @click="loadMore">加载更多</a>
      <a href="#" class="totop"></a>
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
    return{
      list:[],
      pno:0,
      ps:8
    }
  },
  methods:{
   loadMore(){
     var url="productList";
      this.pno++;
      var obj={pno:this.pno,pageSize:this.ps};
      this.axios.get(url,{params:obj}).then(result=>{
        //数据覆盖
        //this.list=result.data.data;
        //数据追加
        //concat连接两个或多个数组 
        var rows=this.list.concat(result.data.data);
        this.list=rows;
        console.log(rows);
        console.log(result.data.data);
      })
    }
  },
  created(){
    this.loadMore();
  }
}
</script>
<style scoped>
.clear:after{
  content: "";
  display: block;
  clear: both;
}
.listContent{
  width:80%;
  margin:0 auto;
  box-sizing: border-box;
}
.product{
  width:24%;
  margin-right:1%;
  float: left;
  box-sizing: border-box;
}
.img_show{
  display: block;
  height:276px;
  line-height: 276px;
  overflow: hidden;
}
.img_show>img{
  width:100%;
  display: inline-block; 
  vertical-align: middle;
}
.font{
  background-color: #f5f5f5;
  padding:5px;
  text-align: left;
}
.title{
  font-size: 16px;
  font-weight: 600;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}
.story,.price,.spec{
  font-size: 14px;
  padding-left:10px;
  color: #333;
 
}
.story{
  height: 38px;
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp:2;
  overflow: hidden;
}
.price{
  border-top:1px dotted #ccc;
  border-bottom:1px dotted #ccc;
  width:120px;
  box-sizing:content-box;
  padding:0;
  margin-left:10px;
}
.spec{
  font-size: 10px;
   white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}
.more{
  text-decoration: none;
  color:#fff;
  background-color: #ccc;
  display: block;
  width: 120px;
  height: 35px;
  line-height: 35px;
  border-radius: 5px;
  margin: 40px auto 0;
}
.totop{
  display: block;
  position: fixed;
  bottom:50px;
  right:50px;
  background:#ccc url(../assets/img/totop.png) no-repeat center center;
  border-radius: 50%;
  width: 40px;
  height:40px;
}

</style>
