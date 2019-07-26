<template>
    <div>
        <!--顶部标题栏-->
        <titlebar leftTitle="科技馆"></titlebar>
        <img src="../../../assets/1.jpg" class="imgstyle">
        <div id="ss">
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;科技馆由位于北京西路510号的上海自然博物馆，
           位于临港新城的上海天文馆和位于龙吴路1102号的标本楼组成。<br>
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;科技馆总建筑面积10.06万平方米，分为11个风格各异的主题展区，
           4个高科技特种影院，3个古今中外科学家及其足迹的艺术长廊，
           2个主题特展和若干个临时展厅，
           它们共同为四方游客生动地演绎着“自然、人、科技”的永恒话题。
           
           <p><span>开馆时间:</span>8:30~19:30</p>
           <p><span>场馆地址:</span>北京西路510号</p>
           <p><span>联系电话:</span>0519-88888888</p>
            
          </div>
   </div>  
</template>
<script>
import TitleBar from "./TitleBar.vue";
export default {
    props:{
        imgurl:{default:""},
    },
    data() {
        return {
        }
    },
    methods: {
    },
    components:{
        "titlebar":TitleBar,
    }
}
</script>
<style scoped>
    .imgstyle{
        width:100%;
        height:260px;
        
    }
    #ss{
        margin:20px 10px;
        color:#333;
        font-size:14px;
    }
    #ss>p{
        background:#ddd;
        border-radius:5px;
        font-weight:600;
    }
    #ss>p>span{
        display:inline-block;
        width:80px;
        height:25px;
        background:#26a2ff;
        border-radius:5px;
        border-top-right-radius:0;
        border-bottom-right-radius:0;
        color:#fff;
        text-align:center;
        line-height:25px;
        margin-right:10px;
    }
</style>