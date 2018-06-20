<template>
  <div>
    <div class="pay-done-box">
      <p class="pay-done-icon"><Icon type="ios-checkmark-outline"></Icon></p>
      <p class="pay-done-info">支付成功</p>
    </div>
    <Footer></Footer>
  </div>
</template>

<script>
import Footer from '@/components/footer/Footer';
export default {
  name: 'PayDone',
  components: {
    Footer
  }
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
.pay-done-info {
  font-size: 16px;
}
.pay-done-icon {
  font-size: 120px;
}
</style>
