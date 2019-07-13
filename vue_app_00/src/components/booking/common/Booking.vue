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
          <ul>
            <li class="noBook">07/08</li>
            <li>07/09</li>
            <li class="active">07/10</li>
            <li>07/11</li>
            <li>07/12</li>
            <li>07/13</li>
            <li>07/14</li>
          </ul>
          <ul>
            <li class="noBook">07/15</li>
            <li>07/16</li>
            <li>07/17</li>
            <li>07/18</li>
            <li>07/19</li>
            <li>07/20</li>
            <li>07/21</li>
          </ul>
        </div>
        <div class="bMsg"><span class="okBook">剩余986张</span></div>
        <div class="bMsg"><span class="noBook">闭馆</span></div>
        <mt-button size="large" type="primary">下一步</mt-button>
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

      }
    },//data结束
    components:{
      "titlebar":TitleBar,
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
  .bDate ul:first-child li{
    background-color:#26a2ff;
    color:#fff;
    font-size:16px;
  }
  .bDate ul li.active{
    border:1px solid #26a2ff;
  }
  .bDate ul li.noBook{
    color:#aaa;
  }
  .book div.bMsg{
    background-color:#fff;
    margin:5px 0;
    padding:10px 20px;
    font-size:16px;
  }
  .book div.bMsg .noBook{
    color:#f00;
  }
  .book div.bMsg .okBook{
    
  }
  /* 文字说明栏 */
  .bIntro{
    padding:0 10px;
  }
  .bIntro p{
    color:#666;
  }
</style>