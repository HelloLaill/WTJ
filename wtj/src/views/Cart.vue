<template>
  <div id="cart">
 
    <div class="cart_content">
      <h3>购物车</h3>
      <table>
        <thead class="cart_thead">
          <th><input type="checkbox" id="selAll" @change="selectAll" ><label for="selAll">全选</label></th>
          <th>图片</th>
          <th>名称</th>
          <th>规格</th>
          <th>单价</th>
          <th>数量</th>
          <th>小计</th>
          <th>操作</th>
        </thead>
        <tbody class="cart_tbody">
          <tr v-for="(item,i) in product" :key="i">
            <td><input type="checkbox" v-model="item.cb"></td>
            <td><img :src="'http://127.0.0.1:3000/'+item.sm " class="pro_img"></td>
            <td>{{item.pname}}</td>
            <td>{{item.spec}}</td>
            <td>￥{{item.price.toFixed(2)}}</td>
            <td>
              <button @click="item.count>1?item.count--:item.count=1" >-</button>
              <input type="text" v-model="item.count" class="count">
              <button @click="item.count++">+</button>
            </td>
            <td>￥{{(item.price*item.count).toFixed(2)}}</td>
            <td :data-id="item.id" @click="delItem"><img src="../assets/img/del.png" class="del"></td>
          </tr>
        </tbody>
      </table>
      <div class="checkPro">
          <div class="delAllPro">
            <span><a href="javascript:;" @click="delAll">删除所选商品</a></span>
          </div>
          <div class="pay">
            <span><a href="javascript:;" @click="payAll">付款</a></span>
          </div> 
      </div>
      
    </div>
  </div>

</template>

<script>
export default {
  data(){
    return{
      product:[],
    }
  },
  methods:{
    
    delAll(){
      //删除多个商品
      //1：创建变量保存空字符串
      var str="";
      //2:创建循环拼接字符串内容
      for(var item of this.product){
        if(item.cb){
          str+=item.id+","
        }
      }
      //把"1,6,"截取成"1,6"
      str=str.substring(0,str.length-1);
      console.log(str);
      //3:判断用户如果没选商品提示
      if(str.length==0){
        this.$toast("请选中商品");
        return;
      }
      //4:发送ajax请求
      var url="delAll";
      var obj={ids:str};
      this.axios.get(url,{params:obj}).then(
        result=>{
         //重新加载数据相当于刷新
          this.loadMore();
        })
      //5：重新加载数据
    },
    delItem(e){
      //1：获取当前商品的id
      var id=e.target.dataset.id;
      //2:显示一个交互的确认框
      confirm("是否删除当前商品")
      .then(action=>{
        var url="delItem";
        var obj={id};//{id:id}
        this.axios.get(url,{params:obj}).then(
          result=>{
            //重新加载数据相当于刷新
            this.loadMore();
          }
        )
      }).catch(err=>{
        return;
      })
      //3:如果用户选中"确定"
      //4:发生ajax删除数据
      //5:如果用户选中"取消"
    },
    selectAll(e){
      //全选按钮状态
      var cb=e.target.checked;
      //console.log(cb);
      //依据状态修改列表cb
      for(var item of this.product){
        item.cb=cb;
        
      }
    },
    loadMore(){
      var url="cart";
      this.axios.get(url).then(result=>{
        //this.list=result.data.data;
        //1:获取服务器数组
        var rows=result.data.data;
        if(rows.uid)
        console.log(rows)
        //2:创建循环为数组中每个对象添加cb属性
        //cb控制商品前复选框
        for(var item of rows){
          item.cb=false;
        }
        //3:将新数据保存
        this.product=rows;
      })
     }
  },
  created(){
    this.loadMore()
  }
}
</script>
<style>
.clear:after{
  content: "";
  display: block;
  clear: both;
}
.d-table::before{
  content: "";
  display: table;
}
#cart{
  margin: 60px auto 0;
}
div.cart_content{
  margin:100px auto;
  width:90%;
}
div.cart_content>h3{
  padding-bottom: 10px;
  border-bottom: 2px solid #888;
  width: 100%;
}
table{
  width:100%;
  border: 1px solid #000;
}
div.cart_thead,div.cart_tbody{
  width: 100%;
  display: flex;
  justify-content: space-between;
}

tr,td{
  text-align: center;
}
.pro_img{
  width:80px;
  height:80px;
}
.count{
  width:30px;
  text-align: center;
}
.del{
  width:20px;
  transition: all 0.2s;
}
.del:hover{
  transform: scale(1.2);
}
.checkPro{
  position: relative;
}
.delAllPro>span>a{
  position: absolute;
  top:20px;
  right:80px;
  color:#fff;
  background-color:#999;
  width:120px;
  height:40px;
  line-height: 40px;
  text-decoration: none;
  border-radius: 5px;
}
.pay>span{
  position:absolute;
  top:80px;
  right:80px;
}
</style>

