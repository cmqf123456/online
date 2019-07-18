<template>
  <div class="container">
    <!--顶部标题栏-->
    <titlebar leftTitle="在线购票"></titlebar>
    <!--防止顶部溢出
    <div style="height:40px;"></div>-->
    
    <div class="content">
      <!--购票栏-->
      <div class="book">
        <h3>请选择购票日期</h3>
        <div class="bDate">
          <ul>
            <li>周一</li>
            <li>周二</li>
            <li>周三</li>
            <li>周四</li>
            <li>周五</li>
            <li>周六</li>
            <li>周日</li>
          </ul>
          <div class="dlis">
            <ul>
              <li @click="getTic(0)"></li>
              <li @click="getTic(1)"></li>
              <li @click="getTic(2)"></li>
              <li @click="getTic(3)"></li>
              <li @click="getTic(4)"></li>
              <li @click="getTic(5)"></li>
              <li @click="getTic(6)"></li>
            </ul>
            <ul v-show="day1>1">
              <li @click="getTic(7)"></li>
              <li @click="getTic(8)"></li>
              <li @click="getTic(9)"></li>
              <li @click="getTic(10)"></li>
              <li @click="getTic(11)"></li>
              <li @click="getTic(12)"></li>
              <li @click="getTic(13)"></li>
            </ul>
          </div>
        </div>
        <div class="bMsg" :class="showDivClass">
          <span class="okBook" :class="showClass1" v-text="tics"></span>
          <span class="notBook" :class="showClass2">闭馆</span>
          <span class="noBook" :class="showClass3">当日下午3点之后不可购票</span>
        </div>
        <mt-button @click="next" size="large" type="primary" style="margin-top:20px;" :disabled="btnAbl">下一步</mt-button>
      </div>
      <!--文字说明栏-->
      <div class="bIntro">
        <h5>购票须知</h5>
        <div>
          <p>1. 参观票预售期为7天，数量有限，售完为止。</P>
          <p>2. 微信购票实行实名制，观众须凭第二代身份证信息购票。</P>
          <p>3. 每张身份证每天限购一张参观票或一张亲子参观票(包含：1名成人参观票+1名学生参观票)，参观票仅限预约参观日当天有效。</p>
          <p>4. 凭网上购票成功的提示短信过科技馆</p>
        </div>
        <h5>退票说明</h5>
        <div>
          <p>1. 预约门票在未使用的情况下，可于预约参观日当日24点前在网上平台申请退款，一大一小亲子参观票(包含：1名成人参观票+1名学生参观票)退款时不支持拆分退款。</P>
          <p>2. 如未能退票成功或超过退票期限等特殊情况，请凭本人有效证件至场馆大门口的游客服务中心现场申请退票。申请退票成功后，票款将在10个工作日内原路返回至付款的账户。</P>
          
        </div>
      </div>
    </div>
    <!--底部箭头栏-->
    <div></div>
  </div>
</template>

<script>
  // 引入相关子组件
  import TitleBar from "./TitleBar.vue";
  export default {
    data(){
      return {
        // 剩余票数
        tics:"可选购",
        // 购票日期
        gdate:"",
        // 当天的星期
        day1:0,
        // 增减样式
        showClass1:{
          showMsg:false,
        },
        showClass2:{
          showMsg:false,
        },
        showClass3:{
          showMsg:false,
        },
        showDivClass:{
          showDiv:false,
        },
        // 按钮样式
        btnAbl:true
      }
    },//data结束
    computed: {
      // 获取li列表，保存在计算属性lis中
      lis(){
        var uls=document.querySelector(".dlis");
        // console.log(uls);
        var lis=uls.querySelectorAll("ul li");
        return lis;
      }
    },
    components:{
      "titlebar":TitleBar,
    },
    methods:{
      getTic(i){
        // 初始化按钮可用\信息框的可见\选中框
        
        this.showDivClass.showDiv=false;
        this.btnAbl=true;
        for(var k=0;k<14; k++){
          this.lis[k].className="";
        }
        
        var d1=new Date();
        console.log(d1);
        // 获取当天小时
        var hour1=d1.getHours();
        // console.log(hour1);
        // 获取当天的星期
        var day1=d1.getDay();
        if(day1==0){
          day1=7;
        }
        
        console.log(day1);
        // 在当前日期+后6天内，能买票
        if(i>=day1-1&i<=day1+5){
          // 获取选定的购票日期 bdate:2019/07/13
          d1=d1.getFullYear();
          var d2=d1+"/"+this.lis[i].innerHTML;
          // 保存购票日期到sessionStorage对象中
          sessionStorage.setItem("gdate",d2);
          console.log(sessionStorage);
          this.gdate=d2;
          console.log(d2,typeof(d2));
          // 点中显示信息div样式
          this.showDivClass.showDiv=true;
          // 根据i判断是否是周一 如果i%7==0为周一 ，则显示闭馆
          if(i%7==0){
            this.showClass2.showMsg=true;
            this.showClass1.showMsg=false;
            this.showClass3.showMsg=false;
          }else if(i==day1-1&hour1>=13){
            this.showClass3.showMsg=true;
            this.showClass1.showMsg=false;
            this.showClass2.showMsg=false;
          }
          else{
            this.showClass2.showMsg=false;
            this.showClass3.showMsg=false;
            // 发送axios请求获取选中当天已购买的票数
            // this.axios.get("booking",{
            //   params:{
            //     d2,
            //   }
            // }).then(result=>{
            //   console.log(11);
            //   console.log(result);
            // })
            this.showClass1.showMsg=true;
            
          }
          // 修改选中日期的样式
          for(var j=0;j<14; j++){
            this.lis[j].className="";
            // 如果是周一
            // if(j==0||j==7){
            //   this.lis[j].className="noBook";
            // }
          }
          this.lis[i].className="active";
          this.btnAbl=false;
          // 如果是周一
          if(i==0||i==7){
            this.btnAbl=true;
          }else if(i==day1-1&hour1>=15){
            this.btnAbl=true;
          }
        }

      },
      next(){
        this.$router.push('/BookCart')
      }
    },
    mounted(){
      // 自动填写当天往后7天的时间
      var d1=new Date();
      var mon=d1.getMonth()+1;  //获得月份
      if(mon<10){
        mon="0"+mon;
      }
      var d=d1.getDate();       //获得天数
      if(d<10){
        d="0"+d;
      }
      var day1=d1.getDay();     //获得星期
      // console.log(day1);
      if(day1==0){
        day1=7;
      }
      this.day1=day1;
      var t=d1.getHours();      //获得小时
      // console.log(mon,d,t,day1);
      for(var i=day1-1; i<=(day1+5); i++){
        // console.log(i);
        this.lis[i].innerHTML=mon+"/"+d;
        d++;
      }
    },
    created(){
      sessionStorage.removeItem("gdate");
      if(!sessionStorage.getItem("uname")){
        this.$messagebox("请先登录")
          .then(action=>{
            this.$router.push("/Login");
          })
          .catch(err=>{console.log(err)}
        );
      }
      console.log(sessionStorage);
    }
  }
</script>

<style scoped>
  .container{
    background-color:#f2f2f2;
    color:#333;
    font-size:12px;
  }
  /* 解决外边距溢出 */
  .container:before{
    content:"";
    display:table;
  }
  .content{
    padding:40px 20px;
  }
  
  /* 购票栏 */
  .book h3{
    margin-bottom:10px;
  }
  .bDate ul{
    margin:0;
    padding:0;
    display:flex;
    text-align:center;
    list-style-type:none;
    justify-content:space-between;
  }
  .bDate ul li{
    background-color:#fff;
    margin:1px;
    width:50px;
    height:50px;
    box-sizing:border-box;
    line-height:50px;
    font-size:13px;
  }
  .bDate>ul li{
    background-color:#26a2ff;
    color:#fff;
    font-size:16px;
  }
  .bDate .dlis ul li{
    background-color:#fff;
  }
  .active{
    border:1px solid #26a2ff;
  }
  /*
  .noBook{
    color:#aaa;
  }
  */
  .bMsg{
    background-color:#fff;
    margin:5px 0;
    padding:10px 20px;
    font-size:16px;
    display:none;
  }
  .showDiv{
    display:block;
  }
  .notBook{
    color:#f00;
    background:url("../../../assets/close-circle.png") no-repeat 0 2px;
    background-size:20px 20px;
    padding-left:24px;
    display:none;
  }
  .okBook{
    background:url("../../../assets/check-circle.png") no-repeat 0 2px;
    background-size:20px 20px;
    padding-left:24px;
    display:none;
  }
  .noBook{
    color:#f00;
    background:url("../../../assets/close-circle.png") no-repeat 0 2px;
    background-size:20px 20px;
    padding-left:24px;
    display:none;
  }
  .showMsg{
    display:block;
  }
  /* 文字说明栏 */
  .bIntro{
    padding:0 10px;
  }
  .bIntro p{
    color:#666;
  }
</style>