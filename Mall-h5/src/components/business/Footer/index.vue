<template>
  <van-tabbar
    v-model="active"
    class="border-t shadow-foot"
    active-color="#fa2c19"
    route
    :fixed="false"
  >
    <van-tabbar-item
      v-for="(item, i) in MenuOptions"
      :key="i"
      :icon="item.icon"
      :to="item.url"
      >{{ item.title }}
    </van-tabbar-item>
  </van-tabbar>
</template>

<script lang="ts">
  import { watch } from '@vue/runtime-core'
  import { useRoute } from 'vue-router'
  import { ref } from 'vue'
  import { MenuOptions } from './config'

  export default {
    name: 'MallFooter',
    setup() {
      const route = useRoute()
      const active = ref(0)
      watch(
        () => route.path,
        (val) => {
          active.value = MenuOptions.findIndex((i) => i.url === val)
        }
      )
      return {
        MenuOptions,
        active
      }
    }
  }
</script>

<style></style>
