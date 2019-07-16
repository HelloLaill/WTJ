<template>
  <div id="content">
    <div class="per-name">
      <a href="javascript:;">个人资料</a>
    </div>
    <div class="per-main">
      <form action method="get">
        <ul>
          <li class="main-input">
            <label for="email">注册邮箱</label><br>
            <input type="text" placeholder="请输入邮箱" v-model="email" name="email">
          </li>
          <li class="main-input">
            <label for="nickName">昵称</label><br>
            <input type="text" v-model="nickName" name="uname">
          </li>
          <li>
            <label for="sex">性别</label><br>
            男<input type="radio" checked v-model="sex" name="sex" value="1">
            女<input type="radio" v-model="sex" name="sex" value="0">
            保密<input type="radio" v-model="sex" name="sex" value="2">
          </li>
          <li class="main-input">
            <label for="address">收货地址</label><br>
            <input type="text" v-model="address" placeholder="请输入您的收货地址" name="address">
          </li>
          <li>
            <label for="intr">自我介绍</label><br>
            <textarea name="intr" id="intro" cols="75" rows="10" placeholder="写点东西介绍你自己..."></textarea>
          </li>
        </ul>
        <button class="btn" @click="save">保存</button>
      </form>
    </div>
  </div>

</template>
<script>
export default {
  data(){
    return {
      email:"",
      nickName:"",
      sex:1,
      address:"",
    }
  },
  methods:{
    save(){
      
    }
  }
}
</script>
<style scoped>
#content{
  text-align: left;
}
div.per-name{
  width: 100%;
  height: 44px;
  text-align: center;
  margin-top: 46px;
  border-bottom: 2px solid #111111;
}
div.per-main{
  width: 542px;
  height: 739px;
  position: relative;
  left: 35%;
}
div.per-name::after{
  clear: both;
  content: "";
  display: block;
  height: 0;
}
div.per-name>a{
  text-decoration: none;
  color:#333;
  font-size: 14px;
}
div.per-main ul{
  margin-top: 50px;
  padding-left: 0;
}
div.per-main li{
  list-style: none;
}
div.per-main label{
  display: inline-block;
  font-size:12px;
  padding: 10px 0;
}
div.per-main li.main-input input{
  width: 100%;
  height: 35px;
  text-indent: 10px;
}
.btn{
  background-color: #111;
  color:#fff;
  padding: 10px 40px;
  border: 0;
  margin-top: 50px  ;
}
</style>
