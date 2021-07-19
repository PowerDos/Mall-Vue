<template>
  <div
    class="
      w-full
      h-full
      flex
      justify-center
      items-center
      bg-transparent
      fixed
      l-0
      t-0
      z-50
    "
  >
    <div class="w-20 h-20 bg-black opacity-30 rounded-md px-2 py-3"
      ><van-loading type="spinner" color="white" text-color="white" vertical
        >加载中</van-loading
      ></div
    >
  </div>
</template>

<script>
  export default {
    name: 'MallLoading'
  }
</script>

<style></style>
