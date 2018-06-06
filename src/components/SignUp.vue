<template>
  <div class="container">
    <Steps :current="index">
        <Step title="验证手机号"></Step>
        <Step title="填写账号信息"></Step>
        <Step title="注册成功"></Step>
    </Steps>
    <div class="sign-up-box">
      <transition mode="out-in">
        <router-view></router-view>
      </transition>
    </div>
  </div>
</template>

<script>
export default {
  name: 'SignUp',
  data () {
    return {
      index: 0
    }
  }
}
</script>

<style scoped>
.container {
  margin: 60px auto;
  padding-left: 50px;
  width: 500px;
  height: 380px;
  background-color: #eee;
}
.sign-up-box {
  margin: 30px 38px;
  width: 330px;
  background-color: #ccc;
}
</style>
