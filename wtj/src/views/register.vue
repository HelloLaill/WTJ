<template>
<div>
  <form action="">
    <div id="reg">
      <div class="reg-head">
        <h3>现在就加入乌托家</h3>
        <p>发现灵感，搜集所爱，美好家居就从这里开始。现在就登录乌托家搭建您心仪的家吧！</p>
        <p>手机账户注册</p>
      </div>
      <ul class="my-ul">
        <li>
          <input type="text" class="reg-uname" placeholder="请输入您的用户名" v-model="uname">
        </li>
        <li>
          <input type="text" id="reg-phone" class="reg-phone" placeholder="请输入您的手机号" v-model="phone" @blur="phone">
        </li>
        <li>
          <input type="text" id="reg-email" class="reg-phone" placeholder="请输入您需要注册的邮箱" v-model="email" @blur="email">
        </li>
        <li>
          <input type="password" class="reg-upwd" placeholder="请输入您需要注册的密码" v-model="upwd" @blur="upwd">
        </li>
        <li>
          <a href="#"> <input type="submit" class="reg-btn" value="注册" @click="register"></a>
        </li>
        <li align="center">
          <span class="my-ulFont">我已有账号</span>
          <a href="" class="login-a"><span>立即登录</span></a>
        </li>
      </ul>
    </div>
  </form>
</div>
</template>
<script>
export default {
  data(){
    return {
      uname:"",
      phone:"",
      email:"",
      upwd:""
    }
  },
  methods:{
    register(){
      var uname=this.uname;
      var phone=this.phone;
      var email=this.email;
      var upwd=this.upwd;
      var reg=/^((\+86|0086)\s+)?1[3-8]\d{9}$/i;
      var reg1=/^\w+@[a-z0-9]+\.[a-z]{2,4}$/i;
      var reg2=/^[0-9a-z_]{3,12}$/i;
      if(uname==""){
        alert("用户名不能为空");
        return;
      }else if(!reg2.test(uname)){
        alert("用户名格式不正确");
        return;
      }
      if(phone==""){
        alert("手机号不能为空");
        return;
      }else if(!reg.test(phone)){
        alert("手机号格式不正确");
        return;
      }
      if(email==""){
        alert("邮箱不能为空");
        return;
      }else if(!reg1.test(email)){
        alert("邮箱格式不正确");
        return;
      }
      if(upwd==""){
        alert("密码不能为空");
        return;
      }else if(!reg2.test(upwd)){
        alert("密码格式不正确");
        return;
      }
      var url="register";
      var obj={uname,phone,email,upwd};
      this.axios.get(url,{params:obj}).then(result=>{
        console.log(result);
        if(result.data.code>0){
          alert("注册成功");
          this.$router.push("/login")
        }else{
          alert("注册失败");
        }
      })
    }
  }
}
</script>
<style scoped>
#reg{
  width: 420px;
  height: 480px;
  margin: 0 auto;
}
.reg .reg-head h3{
  text-align: center
}
.reg .reg-head p{
  font-size: 10px
}
li{
  list-style-type: none;
}
.reg-uname,.reg-phone,.reg-upwd{
  width: 416px;
  height:46px;
  text-indent: 15px;
  font-size: 14px;
}
.my-ul{
  padding: 0
}
#reg-email,#reg-phone{
  margin-top: 10px;
  margin-bottom: 10px;
}
#reg-phone{
  margin-bottom: 0;
}
.reg-btn{
  width: 420px;
  height: 46px;
  background-color: #111111;
  color: white;
  border-radius: 4px;
  font-size: 14px;
  border: none;
  margin-top:15px ;
  margin-bottom: 15px;
}
.login-a{
  text-decoration: none;
  color: #111111;
  font-size: 8px
}
.my-ul{
  width: 420px ;
}
.my-ulFont{
  font-size: 8px;
  color: #999999;
}
</style>
