//router.js 引入路由
import Vue from 'vue'
import Router from 'vue-router'
//自定义组件
import HelloContainer from "./components/HelloWorld.vue"
import Home from "./components/booking/Home.vue"
import Orderlist from "./components/booking/common/Orderlist.vue"
// 引入booking面板相关组件
import Booking from "./components/booking/common/Booking.vue"
import BookCart from "./components/booking/common/BookCart.vue"
import Login from "./components/booking/common/Login.vue"
import Reg from "./components/booking/common/Reg.vue"


Vue.use(Router)
export default new Router({
  routes: [
    {path:'/HelloContainer',component:HelloContainer},
    {path:'/Home',component:Home},
    {path:'/Orderlist',component:Orderlist},
    {path:'/Booking',component:Booking},
    {path:'/BookCart',component:BookCart},
    {path:'/Login',component:Login},
    {path:'/Reg',component:Reg},
  ]
})
