<template>
  <div class="w-full h-full flex flex-col">
    <mall-header showMenu>
      <mall-search
        v-model="search.value"
        @update:model-value="search.change"
        autofocus
      />
      <template #right
        ><van-button
          class="m-2 ml-0 px-4"
          round
          size="small"
          color="linear-gradient(to right, #ff6034, #ee0a24)"
          @click="search.search"
        >
          搜索
        </van-button>
      </template>
    </mall-header>
    <div class="mall-bg flex-auto flex flex-col p-4 overflow-y-auto">
      <div class="flex flex-col" v-if="history.list.length">
        <div class="flex justify-between">
          <h4 class="font-semibold">搜索历史</h4
          ><van-icon
            name="delete-o"
            size="18"
            class="text-gray-300"
            @click="history.delAllHistory"
          />
        </div>
        <div class="flex flex-wrap mt-2">
          <span
            class="
              bg-white
              rounded-2xl
              px-2
              py-1
              m-1
              text-sm
              border border-gray-100
              van-ellipsis
            "
            v-for="(item, i) in history.list"
            :key="i"
            >{{ item }}</span
          >
        </div>
      </div>
      <div class="flex flex-col mt-2">
        <div class="flex items-center">
          <h4
            :class="{
              'font-semibold border-rb-red relative':
                searchRecommend.tab === TabType.FIND
            }"
            @click="searchRecommend.tab = TabType.FIND"
            >搜索发现</h4
          >
          <div class="h-2/5 w-1 transform scale-x-25 bg-gray-200 mx-4"></div>
          <h4
            :class="{
              'font-semibold border-rb-red relative':
                searchRecommend.tab === TabType.HOT
            }"
            @click="searchRecommend.tab = TabType.HOT"
            >热搜榜</h4
          >
        </div>
        <div
          v-if="searchRecommend.tab === TabType.FIND"
          class="mt-2 flex flex-wrap"
        >
          <p
            v-for="(item, i) in searchRecommend.findList"
            :key="i"
            class="w-1/2 text-sm mb-2 pr-2 van-ellipsis"
            >{{ item }}</p
          >
        </div>
        <div
          v-if="searchRecommend.tab === TabType.HOT"
          class="mt-2 flex flex-col"
        >
          <div
            v-for="(item, i) in searchRecommend.hotList"
            :key="i"
            class="w-full h-14 m-1 flex relative"
          >
            <img :src="item.img" alt="" class="w-14 h-14 rounded-lg" />
            <i
              :class="{
                'absolute top-0 left-0 rounded-tl rounded-tr-md rounded-br-none rounded-bl-md leading-4 text-center w-4 h-4 text-white text-sm font-semibold': true,
                'bg-gray-300': i > 2,
                'bg-red-500': i === 0,
                'bg-pink-500': i === 1,
                'bg-yellow-400': i === 2
              }"
              >{{ i + 1 }}</i
            >
            <div
              class="h-full ml-2 flex flex-auto flex-col justify-center"
              style="width: calc(100% - 4rem)"
            >
              <div class="w-full flex"
                ><p class="text-sm mb-1 van-ellipsis">{{ item.title }}</p
                ><span
                  v-if="i < 3"
                  class="
                    px-1
                    pt-0.5
                    bg-red-100
                    text-red-500
                    font-semibold
                    rounded
                    text-xs text-center
                    ml-2
                    block
                    h-5
                  "
                  >热</span
                ></div
              >
              <p class="text-xs text-gray-400">人气值 {{ item.hotValue }}</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
  import { reactive } from 'vue'
  import {
    getSearchHistory,
    addSearchHistory,
    delAllSearchHistory
  } from '@/utils/storage'
  import { Dialog } from 'vant'
  export default {
    setup() {
      enum TabType {
        FIND = 'FIND',
        HOT = 'HOT'
      }
      const searchRecommend = reactive({
        tab: TabType.FIND,
        findList: [
          '帮帮龙',
          '小魔方新品',
          '汪汪队李工大队汪汪队李工大队汪汪队李工大队汪汪队李工大队汪汪队李工大队汪汪队李工大队汪汪队李工大队',
          '退吧套装',
          '拖地神奇'
        ],
        hotList: [
          {
            img: 'static/img/goodsList/item-show-1.jpg',
            title:
              '随谁说汪队李工大队汪汪队李工大队汪汪队李工大队汪汪队李工大队汪汪队李工大队汪汪队李工大队汪汪',
            hotValue: 3000
          },
          {
            img: 'static/img/goodsList/item-show-2.jpg',
            title: '安静了',
            hotValue: 3000
          },
          {
            img: 'static/img/goodsList/item-show-3.jpg',
            title: '2嗯嗯',
            hotValue: 3000
          },
          {
            img: 'static/img/goodsList/item-show-4.jpg',
            title: '人噶官方',
            hotValue: 3000
          },
          {
            img: 'static/img/goodsList/item-show-5.jpg',
            title: '人体的噶',
            hotValue: 3000
          },
          {
            img: 'static/img/goodsList/item-show-6.jpg',
            title: '换工会',
            hotValue: 3000
          },
          {
            img: 'static/img/goodsList/item-show-7.jpg',
            title: '健康与',
            hotValue: 3000
          },
          {
            img: 'static/img/goodsList/item-show-8.jpg',
            title: '随谁ui哦于i说',
            hotValue: 3000
          }
        ]
      })
      const history = reactive({
        list: getSearchHistory(),
        delAllHistory: () => {
          Dialog.confirm({
            message: '确定要清空吗？',
            showCancelButton: true
          })
            .then(() => {
              delAllSearchHistory()
              history.list = getSearchHistory()
            })
            .catch(() => {})
        }
      })
      const search = reactive({
        value: '',
        change: (val: string) => {
          console.log(val, getSearchHistory(), history.list)
        },
        search: () => {
          addSearchHistory(search.value)
          history.list = getSearchHistory()
          search.value = ''
        }
      })
      return { history, search, TabType, searchRecommend }
    }
  }
</script>

<style lang="scss">
  .border-rb-red::after {
    content: '';
    position: absolute;
    right: -0.2rem;
    bottom: -0.3rem;
    display: block;
    width: 1rem;
    height: 1.5rem;
    border: 3px solid red;
    border-radius: 50%;
    border-right-color: transparent;
    border-left-color: transparent;
    border-top-color: transparent;
    transform: rotate(-60deg);
  }
</style>
