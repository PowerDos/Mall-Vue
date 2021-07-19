<template>
  <div class="mall-category">
    <mall-header back>
      <mall-search v-model="search.content" @search="search.handle" />
    </mall-header>
    <div class="flex-auto flex border-t overflow-y-auto">
      <van-sidebar
        v-model="active"
        class="category-sidebar h-full w-1/4 overflow-hidden"
      >
        <div class="mall-sidebar-box">
          <van-sidebar-item
            v-for="(item, i) in categoryList"
            :key="i"
            :title="item.title"
            @click="scrollToItem"
          />
        </div>
      </van-sidebar>
      <div class="category-goods w-3/4 h-full flex flex-col overflow-hidden">
        <div class="mall-category-box">
          <div
            class="w-full p-2"
            v-for="(item, i) in categoryList[active].list"
            :key="i"
          >
            <p class="font-semibold mb-2">
              {{ item.title }}
            </p>
            <div class="flex w-full flex-wrap">
              <div
                v-for="(good, index) in item.list"
                :key="index"
                class="w-1/3 p-2"
              >
                <div
                  :style="`background-image:url(${good.img})`"
                  class="w-full h-0 pt-full bg-cover"
                ></div>
                <p class="text-center mt-1 text-sm">
                  {{ good.title }}
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <mall-footer class="absolute left-0 bottom-0 right-0" />
</template>

<script lang="ts">
  import { ref, reactive, computed } from 'vue'
  import { useStore } from 'vuex'
  import type { IState } from '@/store'
  import useTouchMove, { TouchMoveType } from '@/hooks/useTouchMove'
  import { $, setTranslateY } from '@/utils/dom'
  export default {
    setup() {
      const store = useStore<IState>()
      //搜索
      const search = reactive({
        content: '',
        handle: (val: string) => {
          console.log(search.content)
          console.log(val)
        }
      })

      //分类列表
      store.dispatch('getCategorysList')
      const categoryList = computed(() => store.state.category)
      const active = ref(0)

      //sider添加滑动特效
      const sidebarReset = useTouchMove(
        '.mall-sidebar-box',
        '.van-sidebar',
        TouchMoveType.y,
        160
      )
      //category添加滑动特效
      const categoryset = useTouchMove(
        '.mall-category-box',
        '.category-goods',
        TouchMoveType.y,
        160
      )

      const scrollToItem = (i: number) => {
        sidebarReset()
        categoryset()
        const scrollDom = $('.mall-sidebar-box') as any
        const boxDom = $('.van-sidebar') as any
        const heightDiff =
          scrollDom.offsetHeight - boxDom.offsetHeight > 0
            ? scrollDom.offsetHeight - boxDom.offsetHeight
            : 0
        const scrollHeight = i * 52
        if (heightDiff < scrollHeight) {
          setTranslateY(scrollDom, -heightDiff)
        } else {
          setTranslateY(scrollDom, -i * 52)
        }
      }

      return { search, categoryList, active, scrollToItem }
    }
  }
</script>

<style lang="scss">
  .mall-category {
    width: 100%;
    height: calc(100% - 50px);
    display: flex;
    flex-direction: column;
    overflow: hidden;
    .category-sidebar {
      background-color: var(--van-sidebar-background-color);
    }
  }
</style>
