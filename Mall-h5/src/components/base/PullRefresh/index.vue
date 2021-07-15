<template>
  <van-pull-refresh v-bind="$attrs" v-on="$attrs">
    <template #pulling>
      <van-icon name="upgrade" class="mr-1" size="16" />下拉即可刷新...
    </template>

    <!-- 释放提示 -->
    <template #loosing
      ><van-icon
        name="upgrade"
        class="transform rotate-180 mr-1"
        size="16"
      />释放即可刷新...
    </template>

    <!-- 加载提示 -->
    <template #loading
      ><van-icon name="replay" class="animate-spin mr-1" size="16" /> 刷新中...
    </template>
    <!-- 成功提示 -->
    <template #success
      ><van-icon name="passed" class="mr-2" size="16" /> 刷新成功
    </template>

    <slot></slot>
  </van-pull-refresh>
</template>

<script>
  export default {
    name: 'MallPullRefresh'
  }
</script>

<style></style>
