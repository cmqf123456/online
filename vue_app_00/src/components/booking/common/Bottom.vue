<template>
    <div class="anio">
        <img class="left"  @click="pre" src="../../../assets/left.png"></img>
        <img class="right" @click="next" src="../../../assets/right.png"></img>
    </div>
</template>
<script>
export default {
    data() {
        return {
            
        }
    },
    props:{
      left:{default:""},
      right:{default:""}
    },
    methods:{
        pre(){
            this.$router.push(this.left);
        },
        next(){
           this.$router.push(this.right);  
        }
    }
}
</script>
<style scoped>
    .anio{
        width:100%;
        height:40px;
        background:#eeeeee;
        position:fixed;
        top:630px;
    }
    .anio img{
        width:30px;
        height:30px;
        margin:auto 0;
        margin-top:5px;
        margin-left:100px;
    }
</style>