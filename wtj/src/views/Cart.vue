<template>
  <div id="cart">
 
    <div class="cart_content  d-table">
      <p>购物车</p>
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
            <td><img :src="'http://127.0.0.1:3000/'+item.img " class="pro_img"></td>
            <td>{{item.pname}}</td>
            <td>{{item.spec}}</td>
            <td>￥{{item.price.toFixed(2)}}</td>
            <td>
              <button >-</button>
              <span>{{item.count}}</span>
              <button >+</button>
            </td>
            <td>￥{{(item.price*item.count).toFixed(2)}}</td>
            <td :data-id="item.id" @click="delItem"><img src="image/del.png" class="del"></td>
          </tr>
        </tbody>
      </table>
      <div class="checkPro">
          <div class="leftConent">
            <span><a href="#" @click="delAll">删除所选商品</a></span>
          </div>
          <div class="rightConent">
            <span>件商品总计：</span>
          </div>
          
        </div>
    </div>
  </div>

</template>
<script>
export default {
  data(){
    return{
      product:[]
    }
  },
  methods:{
    delAll(){
      //删除多个商品
      //1：创建变量保存空字符串
      var str="";
      //2:创建循环拼接字符串内容
      for(var item of this.list){
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
      this.$messagebox.confirm(`是否删除指定数据${id}`)
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
      for(var item of this.list){
        item.cb=cb;
      }
    },
    loadMore(){
      this.$store.commit("clear");
      var url="cart";
      this.axios.get(url).then(result=>{
        //this.list=result.data.data;
        //1:获取服务器数组
        var rows=result.data.data;
        console.log(rows)
        //2:创建循环为数组中每个对象添加cb属性
        //cb控制商品前复选框
        for(var item of rows){
          item.cb=false;
          this.$store.commit("increment");
        }
        //3:将新数据保存
        this.list=rows;
      })
     }
  },
  created(){
    this.loadMore()
  }
}
</script>
<style>

</style>

