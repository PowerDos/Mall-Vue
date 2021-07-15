<template>
  <!-- 全屏loading -->
  <mall-loading :show="isLoading" />
  <!-- 首页 -->
  <div class="mall-home">
    <div class="mall-home_nav">
      <van-sticky @change="search.setBgColor"
        ><mall-search
          :background="search.isFixed ? '#e43130' : 'transparent'"
          @focus="search.handle"
        />
      </van-sticky>

      <div class="flex justify-center items-center">
        <van-swipe class="w-full" :autoplay="4000" :duration="300">
          <van-swipe-item
            class="px-4"
            v-for="(item, i) in markets.swiper"
            :key="i"
          >
            <img :src="item" alt="" class="w-full rounded-lg"
          /></van-swipe-item>
        </van-swipe>
      </div>
    </div>

    <div class="flex justify-center items-center px-4 mt-3">
      <div class="rounded-xl bg-white w-full">
        <van-swipe class="w-full">
          <van-swipe-item v-for="(item, i) in navList" :key="i">
            <div class="flex flex-wrap pb-5">
              <div
                v-for="(nav, key) in item"
                :key="key"
                class="flex flex-col justify-center text-center w-1/5 px-3 py-1"
              >
                <img :src="nav.icon" alt="" class="w-full" />
                <span class="text-sm">{{ nav.title }}</span>
              </div>
            </div>
          </van-swipe-item>
        </van-swipe>
      </div>
    </div>
    <div class="flex px-4 mt-3">
      <div class="rounded-xl bg-white w-full p-2">
        <div class="w-full flex items-center">
          <van-icon name="clock-o" class="animate-shak mr-3 text-xl"></van-icon>
          <p class="mr-2 font-medium text-sm">限时秒杀</p>
          <div class="seckill-time">{{ seckills.seckillsHours }}</div>
          <span class="seckill-colon">:</span>
          <div class="seckill-time">{{ seckills.seckillsMinutes }}</div>
          <span class="seckill-colon">:</span>
          <div class="seckill-time">{{ seckills.seckillsSeconds }}</div>
        </div>
        <div class="w-full flex items-center mt-2">
          <div
            class="flex-auto mx-2"
            v-for="(item, i) in seckills.goodsList"
            :key="i"
          >
            <img :src="item.img" class="w-full" />
            <p class="text-xs text-center text-red-600 mt-2">
              ￥{{ item.price }}
            </p>
            <p class="text-xs text-center text-gray-400 line-through">
              ￥{{ item.realPrice }}
            </p>
          </div>
        </div>
      </div>
    </div>

    <mall-goods
      class="mt-2"
      v-model:loading="list.loading"
      @load="list.load"
      :finished="list.finished"
      :list="list.data"
      :type="GoodType.CARD"
      finished-text="到底了~~"
    ></mall-goods>
  </div>
</template>

<script lang="ts">
  /* eslint-disable */
  import { ref, reactive, computed, onMounted, onUnmounted } from 'vue'
  import { useStore } from 'vuex'
  import { navList } from './config'
  import { GoodType } from '../../components/business/Goods/type'
  import { useRouter } from 'vue-router'
  export default {
    setup() {
      const store = useStore()
      const router = useRouter()
      //搜索
      const search = reactive({
        handle: () => {
          router.push('/search')
        },
        isFixed: false,
        setBgColor: (isFixed: boolean) => {
          search.isFixed = isFixed
        }
      })
      //全屏loading
      const isLoading = ref(false)
      //营销和轮播图
      store.dispatch('loadCarouselItems')
      const markets = reactive({
        swiper: computed(() => store.state.marketing.CarouselItems),
        activity: computed(() => store.state.marketing.activity)
      })

      //限时秒杀秒杀
      store.dispatch('loadSeckillsInfo')
      const seckills = reactive({
        timer: -1,
        seckillsHours: computed(() => store.getters.seckillsHours),
        seckillsMinutes: computed(() => store.getters.seckillsMinutes),
        seckillsSeconds: computed(() => store.getters.seckillsSeconds),
        goodsList: computed(() => store.state.seckills.goodsList)
      })

      onMounted(() => {
        //限时秒杀读秒
        seckills.timer = setInterval(() => {
          store.commit('REDUCE_SECKILLS_TIME')
        }, 1000)
      })
      onUnmounted(() => {
        //取消定时器与监听
        clearInterval(seckills.timer)
      })

      store.dispatch('loadComputer')
      store.dispatch('loadSeckillsInfo')

      console.log(navList)
      //商品推荐
      const list = reactive({
        data: [] as any[],
        loading: false,
        finished: false,
        load: () => {
          setTimeout(() => {
            store.dispatch('getGoodsList')
            store.state.goodsList && list.data.push(...store.state.goodsList)
            list.loading = false
            if (list.data.length >= 80) list.finished = true
          }, 2000)
        }
      })

      return {
        search,
        markets,
        seckills,
        isLoading,
        navList,
        list,
        GoodType
      }
    }
  }
</script>

<style lang="scss">
  .mall-home {
    background-color: var(--mall-background-color);
    min-height: 100%;

    .mall-home_nav {
      background: url(@/assets/img/nav_bg.jpg) no-repeat;
      background-size: 100% auto;
    }
    .seckill-time {
      width: 1rem;
      color: #fff;
      background-image: -webkit-linear-gradient(230deg, #ff6152, #fa2c19);
      background-image: linear-gradient(-140deg, #ff6152, #fa2c19);
      background-color: #fa2c19;
      border-radius: 0.2rem;
      text-align: center;
      font-weight: 400;
      font-size: 0.5rem;
      margin: 0 0.1rem;
    }
    .seckill-colon {
      color: #fa2c19;
    }
  }
</style>
