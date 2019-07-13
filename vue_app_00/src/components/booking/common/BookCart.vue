<template>
  <div class="container">
    <titlebar leftTitle="在线购票"></titlebar>
    <!--防止顶部溢出
    <div style="height:40px;"></div>-->
    <div class="content">
      <!--头部-->
      <div class="cartTop">
        <p>订单结算</p>
        <p>返回修改</p>
      </div>
      <!--购票日期-->
      <div class="cartDate">购票日期：<span>2019/07/14</span></div>
      <!--购物车主体-->
      <div class="cart">
        <ul>
          <li>门票类型</li>
          <li>数量</li>
          <li>单价</li>
          <li>小计</li>
        </ul>
        <ul>
          <li>成人参观票</li>
          <li>1</li>
          <li>¥45.00</li>
          <li>¥45.00</li>
        </ul>
        <ul>
          <li>合计</li>
          <li>1</li>
          <li></li>
          <li>¥45.00</li>
        </ul>
        <p>手机号：<span>15006142709</span></p>
      </div>
      <!--提示信息-->
      <div class="cartMsg">
        <p>
          温馨提示：订单提交成功，请您务必在15分钟内完成支付，否则您的订单将自动取消！
        </p>
      </div>
      <!--结算按钮和信息-->
      <div class="cartBtm">
        <p>合计：¥<span>45.00</span></p>
        <p><span href="javascript:;">立即支付</span></p>
      </div>
    </div>
    <!--底部箭头栏-->
    <div></div>
  </div>
</template>

<script>
  import TitleBar from "./TitleBar.vue"
  export default {
    data(){
      return {}
    },//data结束
    components:{
      "titlebar":TitleBar
    },
  }
</script>

<style scoped>
  .container{
    background-color:#f2f2f2;
    color:#333;
    font-size:14px;
  }
  .container:before{
    content:"";
    display:table;
  }
  .content{
    padding:50px 0px;
  }
  /* 购物车头部样式 */
  .cartTop{
    display:flex;
    justify-content:space-between;
    background-color:#26a2ff;
    color:#fff;
    padding:0 20px;
  }
  .cartTop p{
    margin:0;
    height:40px;
    line-height:40px;
  }
  .cartTop p:first-child{
    font-size:16px;
  }
  .cartDate{
    padding:10px 20px;
    background-color:#fff;
    font-size:16px;
  }
  /* 购物车样式 */
  .cart{
    margin:5px 0;
    background-color:#fff;
    padding:0 20px;
  }
  .cart ul{
    display:flex;
    margin:0;
    padding:0;
    list-style-type:none;
    justify-content:space-between;
    border-bottom:1px solid #eee;
    height:40px;
    line-height:40px;
  }
  .cart ul:first-child{
    color:#aaa;
    border:none;
  }
  .cart ul li{
    width:50px;
    text-align:center;
  }
  .cart ul li:first-child{
    width:100px;
    text-align:left;
  }
  .cart ul li:last-child{
    text-align:right;
  }
  .cart::after{
    content:"";
    display:table;
  }
  .cart p{
    font-size:16px;
  }
  .cart p span{
    color:#aaa;
  }
  /* 提示信息样式 */
  .cartMsg p{
    padding:0 20px;
    font-size:12px;
  }
  /* 结算按钮和信息 */
  .cartBtm{
    position:fixed;
    bottom:0;
    width:100%;
    display:flex;
    text-align:center;
  }
  .cartBtm p{
    height:50px;
    line-height:50px;
    font-size:20px;
    margin:0;
  }
  .cartBtm p:first-child{
    width:50%;
    color:#e6a062;
  }
  .cartBtm p+p{
    background-color:#e6a062;
    width:50%;
    color:#fff;
  }
</style>