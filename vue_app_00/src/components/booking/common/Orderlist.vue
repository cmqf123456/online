<template>
    <div>
        <!--顶部标题栏-->
        <titlebar leftTitle="订单查询"></titlebar>
        <div class="c2">
            <div v-show="uname.length>0" class="d1">
                <span>欢迎：{{uname}}</span> 
                <span @click="toHome">返回首页</span>
            </div>
            <div class="d2" v-if="num==1" @click="toLogin">请先登录</div>
            <div class="d3" v-else-if="num==2">暂无数据</div>
            <div class="d4" v-else="num==3">
                <div id="content" v-for="(item,i) of list" :key="i">
                    <h4>购票种类:{{item.book}}</h4>
                    <p>购票日期：{{item.bdate}}</p>
                    <p class="c1">
                        主展厅 1
                    <span>￥{{(item.bprice).toFixed(2)}}</span>
                    </p>
                    <div class="btns">
                        <span id="btn">{{item.bstatus > 0 ? "订单已支付" : "订单待付款"}}</span>
                        <button @click="openConfirm(item.bstatus)" >{{item.bstatus > 0 ? "申请退款" : "立即支付"}}</button>
                    </div>
                </div>
            </div>
        </div>
        
    </div>
</template>

<script>
import TitleBar from "./TitleBar.vue";
export default {
    data(){
        return{
            list:[],
            num:0,
            uname:""
        }  
    },
    components:{
        "titlebar":TitleBar,
    },
    created(){
        // 根据num的值来判定显示哪一个内容
        // 如果没有用户登录，强制登录
        if(sessionStorage.getItem("uid")==null){
            this.num=1;
            // console.log(sessionStorage.getItem("uid"));
            // console.log(this.num);
            // console.log(this.num==1);
        }else{
            var url="info";
            this.axios.get(url,{param:{}}).then(result=>{
                // console.log(result.data);
                // 如果没有查到数据，显示暂无数据
                // 如果查到数据，显示列表
                this.num= result.data.length==0 ? 2 : 3;
                // console.log(this.num);
                var list=result.data;
                this.list=list;
            })
            this.uname=sessionStorage.getItem("uname");
        }
    },
    methods:{
        toLogin(){
             // 将当前的路由地址保存在sessionStorage中，登录后可跳回此页面
            sessionStorage.setItem("jumpRouter","/Orderlist");
            
            this.$router.push("/Login");
        },
        toHome(){
            this.$router.push("/Home");
        },
        // 修改订单状态
    openConfirm(key){
        
        if(key==1){
             this.$messagebox.prompt("请输入退款理由").then(action=>{
                 var btn=document.getElementById("btn");
                 btn.innerHTML="订单已退款"
                
             })
             .catch(err=>{
             console.log(err);
             });
           }else if(key==0){
             this.$messagebox.prompt("请输入付款密码").then(action=>{
                 var btn=document.getElementById("btn");
                  btn[key].innerHTML="订单已付款"
                  console.log(btn)
             })
             .catch(err=>{
             console.log(err);
             });
        }
    }
    
}   
}
</script>

<style scoped>
    .d1{
        height:40px;
        background:#fff;
        line-height:40px;
        font-size:20px;
    }
    div{
        background:#f2f2f2;
    }
    .c2{
        padding-top:40px;
    }
    .d1{
        display:flex;
        justify-content:space-between;
        background:#f2f2f2;
    }
    .d1>span{
        background:#f2f2f2;
        color:#333;
    }
    .d1>span:nth-child(2){
        color:#26a2ff;
    }
    .d2{
        text-align:center;
        color:red;
        margin-top:40px;
    }
    .d3{
        text-align:center;
        padding:10px;
    }
    .d4{
        padding-bottom:30px;
    }
    
    
    #content{
        margin:15px;
        margin-top:15px;
        padding-top:1px;
        background:#fff;
        border:1px solid #fff;
        border-radius:5px;
    }
    p{
        margin:8px 0 8px 15px;
        background:#fff;
    }
    h4{
        margin:8px 0 8px 15px;
        background:#fff;
    }
    .btns{
        display:flex;
        justify-content:space-between;
        background:#fff;
    }
    button{
        margin:5px 20px 14px 15px;
        font-size:16px;
        color:#E48E06;
        border:1px solid #E48E06;
        border-radius:3px;
        background:#fff;
    }
    #b3{
        color:#3BA8E0;
        border:1px solid #3BA8E0;
    }
    span{
      margin:5px 20px 14px 15px;
        background:#fff;
        font-size:16px;
        color:#E48E06;
    }
    #s1{
        font-size:16px;
        color:#E48E06;
        margin:9px 0px 0px 15px
    }
    .c1{
        font-size:16px;
        display:flex;
        justify-content:space-between;
        margin-bottom:-10px;
    }
    .c1>span{
        font-size:26px;
    }
</style>