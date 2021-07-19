<template>
  <div class="flex w-full h-header leading-header">
    <slot name="left">
      <div
        v-if="back"
        @click="goBack"
        class="flex justify-center items-center px-2"
      >
        <van-icon
          name="arrow-left"
          class="text-gray-400 text-lg font-semibold"
        />
        {{ leftText }}
      </div>
    </slot>
    <slot
      ><div class="flex-auto text-center">{{ title }}</div></slot
    >
    <slot name="right">
      <van-popover
        v-if="showMenu"
        v-model:show="showPopover"
        theme="dark"
        :actions="actions"
        placement="bottom-end"
      >
        <template #reference>
          <div class="h-full px-2 flex justify-center items-center"
            ><van-icon name="weapp-nav" class="text-gray-400" size="20" /> </div
        ></template>
      </van-popover>
    </slot>
  </div>
</template>

<script lang="ts">
  import { useRouter } from 'vue-router'
  import { ref } from 'vue'
  export default {
    name: 'MallHeader',
    props: {
      title: {
        type: String,
        default: ''
      },
      showMenu: {
        type: Boolean,
        default: false
      },
      back: {
        type: Boolean,
        default: true
      },
      leftText: {
        type: String,
        default: ''
      }
    },
    setup() {
      const router = useRouter()
      const goBack = () => {
        router.go(-1)
      }
      const showPopover = ref(false)
      const actions = [
        { text: '首页', icon: 'wap-home-o' },
        { text: '分类搜索', icon: 'search' },
        { text: '购物车', icon: 'shopping-cart-o' },
        { text: '我的', icon: 'contact' },
        { text: '浏览记录', icon: 'clock-o' },
        { text: '消息', icon: 'comment-o' }
      ]
      return {
        goBack,
        showPopover,
        actions
      }
    }
  }
</script>

<style></style>
