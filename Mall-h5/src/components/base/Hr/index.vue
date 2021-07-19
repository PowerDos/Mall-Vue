<template>
  <div class="mall-line">
    <span
      class="mall-dot"
      :style="`background:${backgroundColor}`"
      v-if="title"
      >{{ title }}</span
    >
  </div>
</template>

<script lang="ts">
  export default {
    name: 'MallHr',
    props: {
      title: {
        type: String,
        default: ''
      },
      backgroundColor: {
        type: String,
        default: 'transparent'
      }
    }
  }
</script>

<style lang="scss">
  .mall-line {
    position: relative;
    z-index: 1;
    text-align: center;
    margin: 10px 0;
    &::before {
      content: '';
      position: absolute;
      top: 50%;
      left: 0;
      z-index: 1;
      width: 100%;
      height: 1px;
      margin-top: 1px;
      background-color: #ccc;
      transform: scaleY(0.5);
    }
    .mall-dot {
      position: relative;
      padding: 0 10px;
      z-index: 2;
      font-size: 12px;
      color: #999;
      &::before,
      &::after {
        content: '';
        position: absolute;
        top: 50%;
        width: 4px;
        height: 4px;
        background-color: #999;
        border-radius: 2px;
        margin-top: -2px;
        z-index: 2;
      }
      &::before {
        left: 0;
      }
      &::after {
        right: 0;
      }
    }
  }
</style>
