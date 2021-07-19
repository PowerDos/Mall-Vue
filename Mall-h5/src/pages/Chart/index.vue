<template>
  <div class="mall-chart mall-bg relative">
    <mall-header back title="购物车" showMenu class="bg-white"> </mall-header>
    <mall-pull-refresh
      v-model="refresh.loading"
      @refresh="refresh.handle"
      class="flex-auto overflow-y-auto mb-14"
    >
      <div class="flex-auto w-full">
        <div
          class="flex justify-center items-center chart-list"
          v-if="chart.list.length === 0"
        >
          <div class="flex flex-col items-center">
            <img src="/static/img/no-goods.png" class="w-28 h-28 mb-4" />
            <p>购物车空空如也，去逛逛吧~</p>
          </div>
        </div>
        <div class="flexchart-list" v-else>
          <div
            class="flex flex-col m-2 bg-white rounded-lg"
            v-for="(chart, i) in chart.list"
            :key="i"
          >
            <div class="flex pt-3 px-3 pb-1"
              ><div class="w-6 flex justify-center items-center mr-4"
                ><van-checkbox
                  v-model="chart.checkAll"
                  checked-color="#e4393c"
                ></van-checkbox></div
              ><div class="flex-auto flex items-center">
                <van-icon
                  name="shop"
                  color="#e4393c"
                  size="24"
                  class="mr-2" /><span class="text-sm font-bold">{{
                  chart.shopName
                }}</span
                ><van-icon name="arrow" /></div
              ><div v-if="chart.showCoupon" class="text-sm">领券</div></div
            >
            <template v-for="(good, key) in chart.goodsList" :key="key">
              <van-swipe-cell right-width="120">
                <div class="w-full px-3 py-2">
                  <div class="float-left w-34 flex mr-3">
                    <div class="w-6 flex justify-center items-center mr-4"
                      ><van-checkbox
                        v-model="good.checked"
                        checked-color="#e4393c"
                      ></van-checkbox
                    ></div>
                    <img :src="good.img" alt="" class="w-24 h-24 rounded-2xl" />
                  </div>
                  <div class="flex flex-col h-24 justify-between">
                    <div>
                      <p class="text-sm font-semibold van-ellipsis">{{
                        good.goodName
                      }}</p>
                      <div class="flex"
                        ><div
                          class="
                            pr-2.5
                            flex
                            items-center
                            text-sm text-gray-400
                            rounded
                            my-1
                            py-1
                            px-2
                            bg-gray-100
                            max-w-full
                          "
                          ><p class="flex-auto van-ellipsis">{{
                            good.goodType.map((i) => i.name).join(';')
                          }}</p>
                          <van-icon name="arrow-down" class="w-4 ml-1" /></div
                      ></div>
                    </div>

                    <div class="felx">
                      <mall-price :price="good.price" special></mall-price>
                      <van-stepper class="float-right" v-model="good.count" />
                    </div>
                  </div>
                </div>
                <template #right>
                  <van-button
                    class="h-full"
                    square
                    type="warning"
                    text="收藏"
                  />
                  <van-button class="h-full" square type="danger" text="删除" />
                </template>
              </van-swipe-cell>
            </template>
          </div>
        </div>
        <div class="flex flex-col">
          <mall-hr
            title="可能你还想要"
            background-color="rgba(243, 244, 246)"
          ></mall-hr>
          <mall-goods
            v-model:loading="list.loading"
            @load="list.load"
            :finished="list.finished"
            :list="list.data"
            :type="list.type"
            finished-text="到底了~~"
          ></mall-goods>
        </div>
      </div>
    </mall-pull-refresh>
    <div
      class="
        absolute
        bottom-0
        left-0
        h-14
        w-full
        bg-white
        opacity-95
        flex
        items-center
      "
    >
      <van-submit-bar
        class="relative"
        :price="chart.price"
        :button-text="`去结算(${chart.count}件)`"
        :disabled="chart.count === 0"
        @submit="onSubmit"
      >
        <van-checkbox v-model="chart.checkAll" checked-color="#e4393c"
          >全选</van-checkbox
        ></van-submit-bar
      >
    </div>
  </div>
  <mall-footer class="absolute left-0 bottom-0 right-0" />
</template>

<script lang="ts">
  /* eslint-disable */
  import { reactive } from 'vue'
  import { GoodType } from '../../components/business/Goods/type'
  import { useStore } from 'vuex'
  import { IState } from '@/store'
  export default {
    setup() {
      const store = useStore<IState>()
      const refresh = reactive({
        loading: false,
        handle: () => {
          console.log('开始刷新')
          setTimeout(() => {
            refresh.loading = false
          }, 1000)
        }
      })
      const list = reactive({
        data: [] as any[],
        loading: false,
        finished: false,
        type: GoodType.CARD,
        load: () => {
          setTimeout(() => {
            store.dispatch('getGoodsList')
            list.data.push(...store.state.goodsList)
            list.loading = false
            if (list.data.length >= 80) list.finished = true
          }, 2000)
        }
      })

      const chart = reactive({
        list: [
          {
            shopName: '超仔代购',
            shopId: '1',
            checkAll: false,
            showCoupon: true,
            goodsList: [
              {
                checked: false,
                goodName: '彪马运动裤',
                goodId: '1',
                goodType: [
                  {
                    id: 0,
                    name: '81015灰色'
                  },
                  {
                    id: 1,
                    name: 'M[90-100斤]'
                  },
                  {
                    id: 2,
                    name: 'M[90-100斤]'
                  }
                ],
                img: 'static/img/goodsDetail/intro/6.jpg',
                price: 11.99,
                count: 1
              },
              {
                checked: false,
                goodName: '彪马运动裤',
                goodId: '1',
                goodType: [
                  {
                    id: 0,
                    name: '81015灰色'
                  },
                  {
                    id: 1,
                    name: 'M[90-100斤]'
                  },
                  {
                    id: 2,
                    name: 'M[90-100斤]'
                  }
                ],
                img: 'static/img/goodsDetail/intro/6.jpg',
                price: 11.99,
                count: 1
              }
            ]
          },
          {
            shopName: '超仔代购',
            shopId: '1',
            checkAll: false,
            showCoupon: true,
            goodsList: [
              {
                checked: false,
                goodName: '彪马运动裤',
                goodId: '1',
                goodType: [
                  {
                    id: 0,
                    name: '81015灰色'
                  },
                  {
                    id: 1,
                    name: 'M[90-100斤]'
                  },
                  {
                    id: 2,
                    name: 'M[90-100斤]'
                  }
                ],
                img: 'static/img/goodsDetail/intro/6.jpg',
                price: 11.99,
                count: 1
              },
              {
                checked: false,
                goodName: '彪马运动裤',
                goodId: '1',
                goodType: [
                  {
                    id: 0,
                    name: '81015灰色'
                  },
                  {
                    id: 1,
                    name: 'M[90-100斤]'
                  },
                  {
                    id: 2,
                    name: 'M[90-100斤]'
                  }
                ],
                img: 'static/img/goodsDetail/intro/6.jpg',
                price: 11.99,
                count: 1
              }
            ]
          }
        ] as any[],
        checkAll: false,
        price: 0,
        count: 0
      })

      return { refresh, list, GoodType, chart }
    }
  }
</script>

<style lang="scss">
  .mall-chart {
    display: flex;
    flex-direction: column;
    width: 100%;
    height: 100%;
    .chart-list {
      min-height: 260px;
    }
  }
</style>
