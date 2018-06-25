import Vue from 'vue';
import Router from 'vue-router';
import Index from '@/components/Index';
import Login from '@/components/Login';
import SignUp from '@/components/SignUp';
import CheckPhone from '@/components/signUp/CheckPhone';
import InputInfo from '@/components/signUp/InputInfo';
import SignUpDone from '@/components/signUp/SignUpDone';
import GoodsList from '@/components/GoodsList';
import GoodsDetail from '@/components/GoodsDetail';
import ShoppingCart from '@/components/ShoppingCart';
import Order from '@/components/Order';
import Pay from '@/components/Pay';
import PayDone from '@/components/PayDone';
import Freeback from '@/components/Freeback';
import Home from '@/components/Home';
import MyAddress from '@/components/home/MyAddress';
import AddAddress from '@/components/home/AddAddress';
import MyOrder from '@/components/home/MyOrder';
import MyShoppingCart from '@/components/home/MyShoppingCart';
import Merchant from '@/components/Merchant';

Vue.use(Router);

export default new Router({
  routes: [
    {
      path: '/', // 首页
      name: 'Index',
      component: Index
    },
    {
      path: '/Login', // 登陆
      name: 'Login',
      component: Login
    },
    {
      path: '/SignUp', // 注册
      name: 'SignUp',
      component: SignUp,
      children: [
        {
          path: '/',
          name: 'index',
          component: CheckPhone
        },
        {
          path: 'checkPhone',
          name: 'CheckPhone',
          component: CheckPhone
        },
        {
          path: 'inputInfo',
          name: 'InputInfo',
          component: InputInfo
        },
        {
          path: 'signUpDone',
          name: 'SignUpDone',
          component: SignUpDone
        }
      ]
    },
    {
      path: '/goodsList', // 商品列表
      name: 'GoodsList',
      component: GoodsList
    },
    {
      path: '/goodsDetail', // 商品详情
      name: 'GoodsDetail',
      component: GoodsDetail
    },
    {
      path: '/shoppingCart', // 商品详情
      name: 'ShoppingCart',
      component: ShoppingCart
    },
    {
      path: '/order', // 订单页面
      name: 'Order',
      component: Order
    },
    {
      path: '/pay', // 支付页面
      name: 'Pay',
      component: Pay
    },
    {
      path: '/payDone', // 支付成功页面
      name: 'PayDone',
      component: PayDone
    },
    {
      path: '/freeback', // 反馈页面
      name: 'Freeback',
      component: Freeback
    },
    {
      path: '/home', // 主页
      name: 'Home',
      component: Home,
      children: [
        {
          path: '/',
          name: 'index',
          component: MyOrder
        },
        {
          path: 'myAddress',
          name: 'MyAddress',
          component: MyAddress
        },
        {
          path: 'addAddress',
          name: 'AddAddress',
          component: AddAddress
        },
        {
          path: 'myOrder',
          name: 'MyOrder',
          component: MyOrder
        },
        {
          path: 'myShoppingCart',
          name: 'MyShoppingCart',
          component: MyShoppingCart
        }
      ]
    },
    {
      path: '/merchant',
      name: 'Merchant',
      component: Merchant
    }
  ]
});
