<template>
  <div>
    <form action="">
      <div class="login">
        <div class="login-head">
          <h3>登录乌托家</h3>
          <p>发现灵感，搜集所爱，美好家居就从这里开始。现在就登录乌托家搭建您心仪的家吧！</p>
          <p>通过邮箱或手机号登录</p>
        </div>
        <ul class="my-ul">
          <li>
            <input type="text" class="login-email" placeholder="输入用户名" v-model="uname">
          </li>
          <li>
            <input type="password" class="login-upwd" placeholder="输入密码" v-model="upwd">
          </li>
          <li>
            <table class="upwd-table">
              <tr>
                <td><input type="radio" value=""><span class="upwd-a">下次自动登录</span> </td>
                <td align="right"><a href="#" class="upwd-a"><span>忘记密码</span></a></td>
              </tr>
            </table>
          </li>
          <li>
            <a href="#"> 
              <input type="submit" class="login-btn" value="登录" @click="login">
            </a>
          </li>
          <li align="center">
            <span class="my-ulFont1">还不是会员？</span>
            <router-link :to="{path:'/register'}" class="upwd-a"><span>立即注册</span>
            </router-link>
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
      upwd:"",
    }
  },
  methods:{
    login(){
      var uname=this.uname;
      var upwd=this.upwd;
      var reg=/^[0-9a-z_]{3,12}$/i;
      if(uname==""){
        alert("用户名不能为空");
        return;
      }else if(!reg.test(uname)){
        alert("用户名格式不正确");
        return;
      }if(upwd==""){
        alert("密码不能为空");
        return;
      }else if(!reg.test(upwd)){
        alert("密码格式不正确");
        return;
      }
      var url="login";
      var obj={uname,upwd};
      this.axios.get(url,{params:obj}).then(result=>{
        console.log(result);
        if(result.data.code>0){
          this.$router.push("/")
        }else{
          alert("用户名或密码错误")
        }
      })
    }
  }
}
</script>
<style scoped>
.login{
  width: 420px;
  height: 480px;
  margin: 0 auto;
}
.login-head h3{
  color: #333;
  text-align: center
}
.login-head p{
  font-size: 10px
}
ul{
  padding: 0px;
  position: absolute;
  height: 100%;width: 100%;
}
li{
  list-style-type: none;
}
.login-email,.login-upwd{
  width: 416px;
  height:46px;
  text-indent: 15px;
  font-size: 14px
}
.login-upwd{
  margin-top: 15px;
  margin-bottom: 20px;
}
.upwd-table{
  width: 420px
}

.login-btn{
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
.upwd-a{
  text-decoration: none;
  color: #111111;
  font-size: 8px
}
.my-ul{
  width: 420px ;
}
.my-ulFont1{
  font-size: 8px;
  color: #999999;
}
</style>
