<template>
  <div class="flex flex-col">
    <div class="container overflow-y-auto">
      <router-view />
    </div>
    <mall-footer class="absolute left-0 bottom-0 right-0" />
  </div>
</template>

<script lang="ts">
  export default {
    name: 'App'
  }
</script>

<style lang="scss" scoped>
  .container {
    height: calc(100vh - 51px);
    width: 100%;
  }
</style>
