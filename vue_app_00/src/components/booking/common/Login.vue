<template>
  <div class="container">
    <!--顶部标题栏-->
    <titlebar leftTitle="用户登录"></titlebar>
    <!--登录界面-->
    <div class="content">
      <!--用户名-->
      <mt-field placeholder="请输入用户名" class="myinput" v-model="uname"></mt-field>
      <!--密码-->
      <mt-field placeholder="请输入密码"class="myinput"
      type="password" v-model="upwd"></mt-field>
      <!--登录按钮-->
      <mt-button size="large" type="primary" @click="login">登录</mt-button>
      <div class="reg"><span>没有账号？</span><span @click="toReg">请注册</span></div>
    </div>
  </div>
</template>

<script>
  // 引入相关子组件
  import TitleBar from "./TitleBar.vue";
  export default {
    data(){
      return {
        uname:'',
        upwd:''
      }
    },//data结束
    methods:{
      login(){
        // 获取用户名和密码
        var uname=this.uname;
        var upwd=this.upwd;
        // 验证用户名
        var reg=/^\w{3,9}$/i;
        if(!reg.test(uname)){
          this.$toast("用户名格式不正确");
          return;
        }
        // 验证密码
        if(!reg.test(upwd)){
          this.$toast("密码格式不正确");
          return;
        }
        // 发送请求
        this.axios.get("login",{
          params:{
            uname,
            upwd
          }
        }).then(result=>{
          // console.log(result.data);
          if(result.data.code==1){
            // console.log(uname);
            sessionStorage.setItem("uname",uname);
            // console.log(sessionStorage)
            this.$router.push('/Booking');
          }else{
            
            this.$messagebox("",result.data.msg);
            
          }
          
        })
      },
      toReg(){
        this.$router.push("/Reg");
      },
    },
    components:{
      "titlebar":TitleBar
    },
  }
</script>

<style scoped>
.container{
    background-color:#f2f2f2;
    color:#333;
    font-size:12px;
}
.content{
  padding:40px 20px;
}
.reg{
  margin-top:20px;
}
.reg span:last-child{
  color:red;
}
</style>