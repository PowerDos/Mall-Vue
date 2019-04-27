<template>
  <div>
    <div class="pay-done-box">
      <img src="static/img/pay-success.png">
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
</style>
