<template>
  <div class="container">
    <!--顶部标题栏-->
    <titlebar leftTitle="用户注册"></titlebar>
    <div class="content">
      用户注册
    </div>
  </div>
</template>

<script>
  // 引入其他组件
  import TitleBar from "./TitleBar.vue";
  export default {
    data(){
      return {}
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