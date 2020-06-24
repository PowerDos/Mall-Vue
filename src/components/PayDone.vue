<template>
  <div>
    <div class="pay-done-box">
      <div :style="{visibility:queryVisibility}">支付完成，正在查询支付结果......</div>
      <img src="static/img/pay-success.png" :style="{visibility:payDoneVisibility}" ref="payDoneImg">
      <div :style="{visibility:payFailVisibility}">支付失败！</div>
    </div>
  </div>
</template>

<script>
import store from '@/vuex/store';
import {mapActions, mapState} from 'vuex';

export default {
  name: 'PayDone',
  data () {
    return {
      queryVisibility: 'visible',
      payDoneVisibility: 'hidden',
      payFailVisibility: 'hidden'
    };
  },
  computed: {
    ...mapState(['payToken'])
  },
  methods: {
    ...mapActions(['queryPayStatue']),
    getQueryParam () {
      let url = window.location.href;
      // 获取?之后的参数字符串
      let cs = url.split('?')[1];
      // 参数字符串分割为数组
      let csArr = cs.split('&');
      let params = {};
      // 遍历数组，拿到json对象
      for (let i = 0; i < csArr.length; i++) {
        params[csArr[i].split('=')[0]] = csArr[i].split('=')[1];
      }
      return params;
    }
  },
  mounted () {
    console.log(this.payToken);
    let payData = {};
    payData.params = this.getQueryParam();
    let that = this;
    payData.payToken = this.payToken;
    // 在这里查询支付状态
    this.queryPayStatue(payData).then(statue => {
      if (statue === 'success') {
        that.queryVisibility = 'hidden';
        that.payDoneVisibility = 'visible';
      } else if (statue === 'networkErr') {
        // 网络异常!
        console.log('网络异常！');
      } else if (statue === 'wait') {
        // 等待支付宝异步通知
        console.log('wait');
      } else {
        // 付款失败！
        that.queryVisibility = 'hidden';
        that.payFailVisibility = 'visible';
      }
    });
  },
  store
};
</script>

<style scoped>
.pay-done-box {
  height: 600px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}
</style>
