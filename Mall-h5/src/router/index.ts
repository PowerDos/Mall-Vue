import { createRouter, createWebHashHistory } from 'vue-router'

export default createRouter({
  // history: createWebHistory(),
  history: createWebHashHistory(),
  routes: [
    {
      path: '/',
      name: 'Index',
      redirect: '/home'
    },
    {
      path: '/home',
      name: 'Home',
      component: () => import('@/pages/Home/index.vue')
    },
    {
      path: '/category',
      name: 'Category',
      component: () => import('@/pages/Category/index.vue')
    },
    {
      path: '/find',
      name: 'Find',
      component: () => import('@/pages/Find/index.vue')
    },
    {
      path: '/chart',
      name: 'Chart',
      component: () => import('@/pages/Chart/index.vue')
    },
    {
      path: '/me',
      name: 'Me',
      component: () => import('@/pages/Me/index.vue')
    },
    {
      path: '/login',
      name: 'Login',
      component: () => import('@/pages/Login/index.vue')
    },
    {
      path: '/register',
      name: 'Register',
      component: () => import('@/pages/Register/index.vue')
    },
    {
      path: '/search',
      name: 'Search',
      component: () => import('@/pages/Search/index.vue')
    }
  ]
})
