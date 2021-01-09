<template>
  <div class="container">
    <p><Icon type="ios-checkmark-outline"></Icon></p>
    <router-link to="/login"><Button type="success" size="large" long class="btn-success">注册成功</Button></router-link>
  </div>
</template>

<script>
export default {
  name: 'SignUpDone'
};
</script>

<style scoped>
.container {
  width: 100%;
  text-align: center;
}
.container p {
  font-size: 90px;
  color: #2d8cf0;
  text-align: center;
}
.btn-success {
  margin-top: 30px;
}
</style>
