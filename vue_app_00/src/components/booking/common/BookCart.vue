<template>
  <div class="container">
    <titlebar leftTitle="在线购票"></titlebar>
    <!--防止顶部溢出
    <div style="height:40px;"></div>-->
    <div class="content">
      <!--头部-->
      <div class="cartTop">
        <p>订单结算</p>
      </div>
      <!--购票日期-->
      <div class="cartDate">购票日期：<span>{{gdate}}</span></div>
      <!--购物车主体-->
      <div class="cart">
        <ul>
          <li>门票类型</li>
          <li>数量</li>
          <li>单价</li>
          <li>小计</li>
        </ul>
        <ul v-for="(elem,i) of cart" :key="i">
          <!--获取票种-->
          <li>{{elem[0].book}}</li>
          <!--获取每个票种对应的张数-->
          <li>{{elem.length}}</li>
          <!--获取每个票种对应的单价-->
          <li>¥{{elem[0].bprice.toFixed(2)}}</li>
          <!--通过获取每个票种对应的小计-->
          <li>¥{{(elem.length*elem[0].bprice).toFixed(2)}}</li>
        </ul>
        <ul>
          <li>合计</li>
          <li>{{totalTics}}</li>
          <li></li>
          <li>¥{{total.toFixed(2)}}</li>
        </ul>
        <!-- <p>手机号：<span>{{phone}}</span></p> -->
      </div>
      <!--提示信息
      <div class="cartMsg">
        <p>
          温馨提示：订单提交成功，请您务必在15分钟内完成支付，否则您的订单将自动取消！
        </p>
      </div>-->
      <!--结算按钮和信息-->
      <div class="cartBtm">
        <!--计算属性算出总和total-->
        <p>合计：¥<span>{{total.toFixed(2)}}</span></p>
        <p><span @click="next">立即支付</span></p>
      </div>
    </div>
    <!--底部箭头栏-->
    <bottombar left="/BookTics"></bottombar>
  </div>
</template>

<script>
  import TitleBar from "./TitleBar.vue";
  import Bottom from "./Bottom.vue";

  export default {
    data(){
      return {
        gdate:"",
        // 购物车
        cart:[],
      }
    },//data结束
    components:{
      "titlebar":TitleBar,
      "bottombar":Bottom,
    },
    created(){
      // 页面运行到订单第三个页面
      sessionStorage.setItem("pageNo3",3);
      this.gdate=sessionStorage.getItem("gdate");
      // 获取购物车字符串
      var str=sessionStorage.getItem("cart");
      // 将字符串转为数组
      var cart=JSON.parse(str);
      // console.log(cart);
      // 将购物车数组放入data数据中
      this.cart=cart;
      console.log(this.cart);
      for(var elem of cart){

      }
    },
    methods:{
      next(){
        // 调出确认框
        this.$messagebox.confirm("确认支付？")
        .then(active=>{
          // 1. 点击确认后
          for(var elem of this.cart){
            // 修改状态码
            var obj=elem[0];
            obj.bstatus=1;
            // console.log(obj);
            // 再插入数据库
            this.axios.get("cart",{params:obj})
            .then(result=>{
              console.log(result);
              this.$toast("成功支付 ¥"+this.total.toFixed(2));
              this.$router.push("/Orderlist");
            });
          }
        }).catch(err=>{
          // 2. 点击取消后
          if(err=="cancel"){
            // console.log(333);
            // 插入数据库
            for(var elem of this.cart){
              var obj=elem[0];
              this.axios.get("cart",{params:obj})
              .then(result=>{
                console.log(result);
                this.$toast("订单待支付");
                this.$router.push("/Orderlist");
              });
            }
            
          }
        })
      },
      jumpLeft(){
        console.log(22);
        // sessionStorage.getItem("jumpLeft","/BookTics");
      }
    },
    // 计算属性
    computed: {
      // 计算总价格
      total(){
        var sum=0;
        for(var elem of this.cart){
          sum+=elem.length*elem[0].bprice;
        }
        return sum;
      },
      // 计算总票数
      totalTics(){
        var sum=0;
        for(var elem of this.cart){
          sum+=elem.length;
        }
        return sum;
      },
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
  .cart>ul:first-child{
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
    bottom:37px;
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
    background:#fff;
  }
  .cartBtm p+p{
    background-color:#e6a062;
    width:50%;
    color:#fff;
  }
</style>