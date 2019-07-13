<!--首页父组件-->
<template>
  <div class="container">
    <div class="page-wrap">
      <!--顶部标题栏-->
      <!--3. 使用子组件TitleBar
      <titlebar leftTitle="XX科技馆"></titlebar>-->
      
      <!--面板  1个父面板  4个子面板-->
      <mt-tab-container v-model="active">
        <mt-tab-container-item id="intro">
          场馆介绍
        </mt-tab-container-item>
        <mt-tab-container-item id="booking">
          <booking></booking>
        </mt-tab-container-item>
        <mt-tab-container-item id="mine">
          我的订票信息
        </mt-tab-container-item>
      </mt-tab-container>
      <!--底部导航条-->
      <mt-tabbar v-model="active" fixed>
        <!--底部按钮1-->
        <mt-tab-item id="intro">
          <img slot="icon" src="../../assets/ic_collect.png"></img> 
          简介
        </mt-tab-item>
        <!--底部按钮2-->
        <mt-tab-item id="booking">
          <img slot="icon" src="../../assets/ic_kabao.png"></img> 
          订票
        </mt-tab-item>
        <!--底部按钮3-->
        <mt-tab-item id="mine">
          <img slot="icon" src="../../assets/ic_game.png"></img> 
          我的
        </mt-tab-item>
      </mt-tabbar>
    </div>
  </div>
</template>

<script>
  // 引入子组件TitleBar
  import TitleBar from "./common/TitleBar.vue"
  // 引入子组件Booking
  import Booking from "./common/Booking.vue"
  export default {
    data(){
      return {
        active:"intro"
      }
    },
    methods:{
      
    },
    // 注册子组件TitleBar
    components:{
      "titlebar":TitleBar,
      "booking":Booking,
    }
  }
</script>

<style scoped>
.container{
  overflow:hidden;/*溢出隐藏*/
  background-color:#f2f2f2;
}
.page-wrap{
 overflow:auto;/*溢出显示轮动条*/
 /*底部导航条高度*/
 padding-bottom:60px;
} 
/*修改tabbar 默认文字颜色*/
.mint-tabbar>.mint-tab-item{
  color:#999999;
}
/*修改tabbar 选中文字颜色 40*/
.mint-tabbar>.mint-tab-item.is-selected{
  background-color:transparent;
  color:#45c018;
}
</style>