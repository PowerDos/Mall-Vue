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
    }
  ]
});
