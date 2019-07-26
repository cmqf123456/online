<template>
  <div class="container">
    <!--顶部标题栏-->
    <titlebar leftTitle="用户注册"></titlebar>
    <div class="content">
    <!--用户名-->
      <mt-field label="用户名" placeholder="请输入用户名" v-model="uname"></mt-field>
      <!--密码-->
      <mt-field label="登录密码" placeholder="请输入登录密码" v-model="pwd"></mt-field>
      <!--确认密码-->
      <mt-field label="确认密码" placeholder="请确认密码" v-model="upwd"></mt-field>
      <!--手机号-->
      <mt-field label="手机号" placeholder="请输入手机号码" v-model="uphone"></mt-field>
      <mt-button type="primary" size="large" @click="submit">提交</mt-button>
    </div>
  </div>
</template>

<script>
  // 引入其他组件
  import TitleBar from "./TitleBar.vue";
  export default {
    data(){
      return {
        uname:"",
        pwd:"",
        upwd:"",
        uphone:""
      }
    },
    methods:{
      submit(){
       var uname=this.uname;   //3-8位
       var pwd=this.pwd;         //3-8位
       var upwd=this.upwd;
        var uphone=this.uphone;
       var reg=/^\w{3,8}$/i;
       var reg1=/^\d{3,8}$/;
        var reg2=/^((\+86|0086)\s+)?1[3-8]\d{9}$/;
       if(!reg.test(uname)){
         this.$toast("用户名格式不正确");
         return;
       }

       if(!reg1.test(pwd)){
         this.$toast("登录密码格式不正确");
         return;
       }
       if(!reg1.test(upwd)){
         this.$toast("确认密码格式不正确");
         return;
       }
       if(this.pwd!=this.upwd){
         this.$toast("两次输入密码不一致");
         return;
       }
        if(!reg2.test(uphone)){
          this.$toast("手机号格式不正确");
          return;
        }
//axios请求
    this.axios.get("reg",{
      params:{
        uname,
        upwd,
        uphone
      },
    }).then(result=>{
      if(result.data.code==1){
        // console.log(result.data);
        // sessionStorage.setItem("uname",uname);
        // sessionStorage.setItem("upwd",upwd);
        // sessionStorage.setItem("uphone",uphone);
        // console.log(sessionStorage);
        this.$router.push('/Login');
      }else{
        this.$messagebox("",result.data.msg);
      }




    })
      }
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
</style>