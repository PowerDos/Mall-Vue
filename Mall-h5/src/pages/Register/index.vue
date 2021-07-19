<template>
  <div class="w-full h-full flex flex-col">
    <mall-header title="注 册"></mall-header>
    <div class="flex-auto p-2">
      <div class="w-full">
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
          </template> </van-field
        ><div class="px-3 mx-2 mt-4">
          <van-button
            color="linear-gradient(to right, #ff6034, #ee0a24)"
            round
            block
            size="large"
            :loading="form.loading"
            @click="getMsgCode"
            >获取验证码</van-button
          >
        </div>
      </div>
    </div>
    <van-overlay :show="form.showMask">
      <div class="h-full w-full flex justify-center items-center">
        <van-password-input
          class="flex-auto"
          :value="form.msgCode"
          :focused="form.canInputMsgCode"
          :gutter="10"
          @focus="form.canInputMsgCode = true"
          :mask="false"
      /></div>
    </van-overlay>

    <van-number-keyboard
      v-model="form.msgCode"
      :show="form.canInputMsgCode"
      :maxlength="6"
      @blur="form.canInputMsgCode = false"
    />
  </div>
</template>

<script lang="ts">
  import { reactive, watch } from 'vue'
  import { useRouter } from 'vue-router'
  export default {
    setup() {
      const router = useRouter()
      const form = reactive({
        phone: '',
        prefix: '86',
        msgCode: '',
        // showKeyboard: false,
        showMask: false,
        canInputMsgCode: false
      })

      const getMsgCode = () => {
        form.showMask = true
        form.canInputMsgCode = true
      }
      watch(
        () => form.msgCode,
        (val) => {
          if (val.length === 6) {
            console.log('验证码校验')
            form.showMask = false
            form.canInputMsgCode = false
            form.msgCode = ''
          }
        }
      )
      return { form, getMsgCode }
    }
  }
</script>

<style lang="scss"></style>
