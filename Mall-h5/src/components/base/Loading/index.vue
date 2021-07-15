<template>
  <van-overlay
    v-bind="$attrs"
    v-on="$attrs"
    class="flex justify-center items-center"
    z-index="99"
  >
    <van-loading type="spinner" color="red" text-color="red" vertical
      >加载中...</van-loading
    >
  </van-overlay>
</template>

<script>
  export default {
    name: 'MallLoading'
  }
</script>

<style></style>
