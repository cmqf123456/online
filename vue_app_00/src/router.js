//router.js 引入路由
import Vue from 'vue'
import Router from 'vue-router'
//自定义组件
import HelloContainer from "./components/HelloWorld.vue"
import Home from "./components/booking/Home.vue"
import Orderlist from "./components/booking/common/Orderlist.vue"
// import Intro from "./components/booking/common/Intro.vue"
// 引入booking面板相关组件
import Booking from "./components/booking/common/Booking.vue"
import BookCart from "./components/booking/common/BookCart.vue"
import BookTics from "./components/booking/common/BookTics.vue"
import Login from "./components/booking/common/Login.vue"
import Reg from "./components/booking/common/Reg.vue"
import Bottom from "./components/booking/common/Bottom.vue"



Vue.use(Router)
export default new Router({
  routes: [
    {path:'/HelloContainer',component:HelloContainer},
    {path:'/Home',component:Home},
    {path:'/Orderlist',component:Orderlist},
    // {path:'/Intro',component:Intro},
    {path:'/Booking',component:Booking},
    {path:'/BookCart',component:BookCart},
    {path:'/BookTics',component:BookTics},
    {path:'/Login',component:Login},
    {path:'/Reg',component:Reg},
    {path:'/Bottom',component:Bottom},
  ]
})
