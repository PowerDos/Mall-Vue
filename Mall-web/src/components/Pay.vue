<template>
  <div>
    <div class="pay-container">
      <Alert show-icon>
        即将跳转到第三方平台完成支付
      </Alert>
      <div class="pay-box">
        <div class="pay-demo">
          <img src="static/img/pay/pay-demo.png">
        </div>
        <div class="pay-qr-scan">
          <img src="static/img/pay/pay-qrscan.png">
          <div class="pay-tips">
            <router-link to="/payDone"><p>正在转到第三方平台完成支付</p></router-link>
          </div>
        </div>
        <form ref="payForm" hidden action="/order/pay" method="post">
        </form>
      </div>
    </div>
  </div>
</template>

<script>

  import {mapState} from 'vuex';
  import store from '@/vuex/store';

  export default {
    name: 'Pay',
    data() {
      return {};
    },
    computed: {
      ...mapState(['payToken'])
    },
    mounted() {
      console.log(this.$refs.payForm);
    },
    watch: {
      payToken(val, oldVal) {
        if (val !== '') {
          // 在这里提交pay
          console.log('提交pay，参数' + val);
          let payTokenElem = document.createElement('textarea');
          payTokenElem.name = 'payToken';
          payTokenElem.value = val;
          this.$refs.payForm.appendChild(payTokenElem);
          this.$refs.payForm.submit();
        }
      }
    },
    store
  };
</script>

<style scoped>
  .pay-container {
    margin: 15px auto;
    width: 80%;
    min-width: 1000px;
  }

  .pay-box {
    height: 500px;
    display: flex;
    align-items: center;
    justify-content: space-between;
  }

  .pay-demo {
    width: 50%;
    height: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
  }

  .pay-demo img {
    height: 80%;
  }

  .pay-qr-scan {
    width: 50%;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
  }

  .pay-tips {
    width: 50%;
    text-align: center;
    font-size: 14px;
    line-height: 30px;
  }

  .pay-tips a {
    color: #999999;
  }
</style>
