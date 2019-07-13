<template>
  <div class="page-head">
    <h4>{{leftTitle}}</h4>
    
  </div>
</template>

<script>
  
  export default {
    data(){
      return {}
    },
    props:{
      leftTitle:{default:""},
    }
 }
</script>

<style scoped>
/* 1. 最外层父元素 */
  .page-head{
    display:flex;  /* 弹性布局 */
    position:fixed; /* 固定定位 */
    z-index:999; /* 始终在最上层 */
    width:100%; /* 宽度是父元素100% */
    justify-content: center; /* 两端对齐 */
    background:#ededed; 
    padding:0 7px;
    box-sizing:border-box;
    height:40px;
    line-height:40px;
    color:#333;
    font-size:18px;
  }
  .page-head h4{
    margin:0;
  }


</style>
