<template>
  <span v-if="old" class="text-gray-400 line-through">￥{{ price }}</span>
  <span v-else :style="`color:${color};`" class="text-xs">
    <span>￥</span>
    <span :class="{ 'text-lg': special }">{{
      price.toString().split('.')[0]
    }}</span>
    <span>.{{ price.toString().split('.')[1] }}</span>
  </span>
</template>

<script>
  export default {
    name: 'MallPrice',
    props: {
      price: {
        type: [Number, String],
        require: true
      },
      old: {
        type: Boolean,
        default: false
      },
      color: {
        type: String,
        default: '#e4393c'
      },
      special: {
        type: Boolean,
        default: false
      }
    }
  }
</script>

<style></style>
