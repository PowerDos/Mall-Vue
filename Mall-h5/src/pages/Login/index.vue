<template>
  <div class="w-full h-full flex flex-col">
    <mall-header title="登 录"></mall-header>
    <div class="flex-auto p-2">
      <div class="w-full" v-if="form.loginType === LoginType.PHONE">
        <van-field
          size="large"
          class="mt-4"
          v-model="form.phone"
          autosize
          placeholder="请输入手机号"
          clearable
          label-width="auto"
        >
          <template #label>
            <span class="text-black text-base">
              +{{ form.prefix }}<van-icon name="arrow-down" />
            </span>
          </template>
        </van-field>
        <van-field
          size="large"
          class="mt-4"
          v-model="form.msgCode"
          autosize
          placeholder="请输入收到的验证码"
          clearable
        >
          <template #extra>
            <div
              class="
                border border-gray-300 border-t-0 border-b-0 border-r-0
                pl-3
                text-gray-500
              "
              >获取验证码</div
            >
          </template>
        </van-field>
        <br />
      </div>
      <div class="w-full" v-if="form.loginType === LoginType.USERNAME">
        <van-field
          size="large"
          class="mt-4"
          v-model="form.username"
          autosize
          placeholder="用户名/邮箱/手机号"
          clearable
          label-width="auto"
        />
        <van-field
          size="large"
          class="mt-4"
          v-model="form.password"
          :type="form.showPassword ? 'text' : 'password'"
          autosize
          placeholder="请输入密码"
          clearable
          :right-icon="form.showPassword ? 'eye-o' : 'closed-eye'"
          @click-right-icon="form.showPassword = !form.showPassword"
        >
          <template #extra>
            <div
              class="
                border border-gray-300 border-t-0 border-b-0 border-r-0
                pl-3
                text-gray-500
              "
              >忘记密码</div
            >
          </template>
        </van-field>
        <br />
      </div>
      <div class="px-3 mx-2">
        <van-button
          color="linear-gradient(to right, #ff6034, #ee0a24)"
          round
          block
          size="large"
          :disabled="form.canLogin"
          >登录</van-button
        >
      </div>
      <div class="flex justify-between px-3 mt-4">
        <span
          class="text-gray-400 text-sm"
          @click="
            form.loginType === LoginType.PHONE
              ? (form.loginType = LoginType.USERNAME)
              : (form.loginType = LoginType.PHONE)
          "
          >{{
            form.loginType === LoginType.PHONE
              ? '账号密码登录'
              : '短信验证码登录'
          }}</span
        >
        <span class="text-gray-400 text-sm" @click="goToRegister"
          >手机快速注册</span
        >
      </div>
    </div>
  </div>
</template>

<script lang="ts">
  import { reactive } from 'vue'
  import { useRouter } from 'vue-router'
  export default {
    setup() {
      const router = useRouter()
      enum LoginType {
        PHONE = 'PHONE',
        USERNAME = 'USERNAME'
      }
      const form = reactive({
        phone: '',
        prefix: '86',
        msgCode: '',
        username: '',
        password: '',
        showPassword: false,
        canLogin: false,
        loginType: LoginType.PHONE
      })
      const goToRegister = () => {
        router.push('register')
      }
      return { form, LoginType, goToRegister }
    }
  }
</script>

<style lang="scss"></style>
