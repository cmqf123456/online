<template>
  <div class="container">
    <!--顶部标题栏-->
    <titlebar leftTitle="在线购票"></titlebar>
    <div class="content">
      <div class="top">您正在选购<span>{{gdate}}</span>的票券</div>
      <div v-show="cardMsg==1" class="cardMsg">请输入正确的身份证号</div>
      <div id="cards" class="tics">
        <!--循环票种列表-->
        <div class="tic" v-for="(elem,i) of ticList" :key="i">
          <div class="tic1">
            <span v-text="elem.tname"></span>
            <span v-text="`¥${elem.tprice.toFixed(2)}`"></span>
          </div>
          <div class="tic2">
            <div>网售票</div>
            <div class="btns">
              <span @click="sub(i)" v-show="tics[i].t>0"><img src="../../../assets/sub.png"></span>
              <span v-text="tics[i].t"></span>
              <span @click="add(i)" :data-idx="i"><img src="../../../assets/add.png"></span>
            </div>
          </div>
          <div class="tic3" v-for="(elem,i) of cards[i].c">
            身份证：<input @blur="cardOK" placeholder="请输入身份证号码" v-model="elem.num"></input>
          </div>
        </div>

      </div>
    </div>

    <!--结算按钮和信息-->
    <div class="cartBtm">
      <p>合计：<span>{{ticCount}}</span>张</p>
      <p><span @click="next">提交订单</span></p>
    </div>
    
  </div>
</template>

<script>
  // 引入相关子组件
  import TitleBar from "./TitleBar.vue";
  export default {
    data(){
      return {
        gdate:"",
        // 从数据库调出的票种信息
        ticList:[],
        // 每种票的购票小计
        prices:[
          {p:0},
          {p:0},
          {p:0},
          {p:0}
        ],
        // 购票数
        tics:[
          {t:0},
          {t:0},
          {t:0},
          {t:0}
        ],
        // 购票身份证数量
        cardNo:[0,0,0,0],
        // 购票身份证
        cards:[
          {c:[]},
          {c:[]},
          {c:[]},
          {c:[]},
        ],
        cardMsg:0
      }//return结束
    },//data结束
    // 计算属性
    computed: {
      // 总购票数
      ticCount(){
        var sum=0;
        for(var i=0; i<this.tics.length; i++){
          sum+=this.tics[i].t;
        }
        return sum;
      },
      // 总购票价格
      priceCount(){
        var sum=0;
        for(var i=0; i<this.prices.length; i++){
          sum+=this.prices[i].p;
        }
        return sum;
      }
    },
    components:{
      "titlebar":TitleBar
    },
    methods:{
      // 增加按钮单击事件
      add(i){
        // 票数增加
        this.tics[i].t++;
        // 身份证输入框增加
        this.cards[i].c[this.cardNo[i]]={id:0,num:""}
        // 身份证数量增加
        this.cardNo[i]++;
        // 计算每种票的价格小计
        this.prices[i].p=this.ticList[i].tprice*this.tics[i].t;
        console.log(this.priceCount);
      },
      sub(i){
        if(this.tics[i].t>0){
        // 票数减少
        this.tics[i].t--;
        // 身份证输入框减少 删除栈顶元素
        this.cards[i].c.pop();
        // 身份证数量减少
        this.cardNo[i]--;
        }
        
      },
      // 提交订单按钮
      next(){
        var cardDiv=document.getElementById("cards");
        var elems=cardDiv.getElementsByClassName("cardRed")
        console.log(elems);
        // 如果没有身份证框有cardRed样式，则执行提交订单操作
        if(elems.length==0){
          // 将购物车信息保存在sessionStorage中
        var cart=[];
        for(var i=0; i<this.ticList.length; i++){
          var info=[];
          // console.log(info);
          if(this.tics[i].t>0){
            for(var j=0; j<this.tics[i].t; j++){
              // 获得每个票种的单张票信息
              var info1={};
              // 票种
              info1.book=this.ticList[i].tname;
              // 身份证号
              info1.bcard=this.cards[i].c[j].num;
              // 价格
              info1.bprice=this.ticList[i].tprice;
              // 单张票的订单状态    0：未付款   1：已付款
              info1.bstatus=0;
              // 日期
              info1.bdate=this.gdate;
              // 当前登录的用户编号uid
              info1.b_id=sessionStorage.getItem("uid")
              // console.log(info);
              // 获得每个票种的所有票信息
              info.push(info1);
            }
            // 放入购物车数组
            cart.push(info);
          }
        }
        console.log(cart);
        // 将购物车数组转为JSON字符串str
        var str=JSON.stringify(cart);
        // 验证购物车是否为空
        if(str=="[]"){
          this.$toast("请选择门票");
        }else{
          // 将str放入sessionStorage中
          sessionStorage.setItem("cart",str);
          // console.log(sessionStorage.cart);
          // 跳转到结算界面
          this.$router.push("/BookCart");
        }
        }
        
      },
      // 输入框失去焦点事件
      // 验证输入的身份证是否正确
      cardOK(e){
        // 获得当前输入框的值
        var str=e.target.value;
        // 正则表达式
        var reg=/^\d{15}(\d\d[0-9Xx])?$/;
        if(!reg.exec(str)){
          // 不符合，则更改cardMsg值，控制提示信息框的显示
          // this.cardMsg=1;
          e.target.className="cardRed";
        }else{
          // 身份证改对后，把cardMsg值改回来
          // this.cardMsg=0;
          e.target.className="";
        }
        // 如果身份证框有样式cardRed，则cardMsg为1，否则为0
        // 保证只要有身份证不对，提示框显示
        var cardDiv=document.getElementById("cards");
        var elems=cardDiv.getElementsByClassName("cardRed");
        console.log(elems);
        if(elems.length>0){
          this.cardMsg=1
        }else{
          this.cardMsg=0;
        }

      }
      
    },
    created(){
      // 获得购票日期
      this.gdate=sessionStorage.getItem("gdate");
      // 获得票种列表
      this.axios.get("tics",{params:{}})
      .then(res=>{
        this.ticList=res.data;
        // console.log(this.ticList);
      });
    }
  }
</script>

<style scoped>
  .container{
    background-color:#f2f2f2;
    color:#333;
    font-size:12px;
  }
  .content{
    padding:40px 0px;
  }
  .top{
    height:40px;
    text-align:center;
    line-height:40px;
    background-color:#26a2ff;
    color:#fff;
    font-size:14px;
  }
  /* 身份证错误信息提示框 */
  .cardMsg{
    padding:10px;
    text-align:center;
    color:red;
  }
  /* 身份证错误标红 */
  .cardRed{
    color:red;
  }
  /* 票种列表样式 */
  .tic{
    padding:0px 20px;
    padding-top:5px;
    margin-bottom:5px;
    color:#000;
    font-size:16px;
    background-color:#fff;
  }
  .tic1{
    display:flex;
    justify-content:space-between;
  }
  .tic1 span:last-child{
    color:#e6a062;
    padding-right:4px;
  }
  .tic2{
    margin-top:10px;
    padding-bottom:5px;
    display:flex;
    justify-content:space-between;
    border-bottom:1px solid #f2f2f2;
  }
  .tic2 div:first-child{
    font-size:13px;
    color:#26a2ff;
    border:1px solid #26a2ff;
    width:60px;
    height:20px;
    text-align:center;
    line-height:20px;
    border-radius:3px;
  }
  .tic2 div.btns{
    display:flex;
  }
  .tic2 div.btns span:nth-child(2){
    display:inline-block;
    width:30px;
    color:#888;
    text-align:center;
    font-size:14px;
  }
  .tic2 div.btns span img{
    width:20px;
  }
  .tic3{
    padding:5px 0;
    font-size:14px;
    border-bottom:1px solid #f2f2f2;
  }
  .tic3 input{
    border:none;
    width:250px;
    padding-left:5px;
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