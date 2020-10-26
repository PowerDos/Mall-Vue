<template>
  <div id="app">
    <Header></Header>
    <router-view/>
    <el-dialog
      title="提示"
      :visible.sync="dialogVisible"
      width="30%">
      <span>{{message}}</span>
      <span slot="footer" class="dialog-footer">
    <el-button @click="dialogVisible = false">取 消</el-button>
    <el-button type="primary" @click="dialogVisible = false">确 定</el-button>
  </span>
    </el-dialog>
    <!-- 部分路由不应该包含这个Footer -->
    <Footer v-if="excludeRoutes.indexOf($route.name) == -1"></Footer>
  </div>
</template>

<script>
  import Header from '@/components/header/Header';
  import Footer from '@/components/footer/Footer';
  import store from '@/vuex/store';
  import {mapActions} from 'vuex';

  export default {
    name: 'App',
    data() {
      return {
        excludeRoutes: ['HomeIndex', 'MyAddress', 'AddAddress', 'MyOrder', 'MyShoppingCart'],
        message: '',
        dialogVisible: false,
        fullscreenLoading: false
      };
    },
    components: {
      Header,
      Footer
    },
    mounted() {
      window.addEventListener('unload', this.saveState);
      setInterval(this.checkLoginStatue, 60000);// 60000
    },
    methods: {
      ...mapActions(['checkToken']),
      saveState() {
        sessionStorage.setItem('state', JSON.stringify(store.state));
      },
      checkLoginStatue() {
        let loginToken = this.$cookies.get('token');
        if (loginToken != null && loginToken.length > 0) {
          this.checkToken(loginToken).then(result => {
            if (result.code === 500) {
              this.message = result.data;
              this.dialogVisible = true;
              this.$cookies.remove('token');
              this.$cookies.remove('loginType');
              this.$cookies.remove('mobile');
            }
          });
        }
      }
    },
    store
  };
</script>
