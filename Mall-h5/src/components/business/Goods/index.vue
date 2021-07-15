<template>
  <div class="mall-goods"
    ><van-list
      v-bind="$attrs"
      v-on="$attrs"
      v-if="type === GoodType.CARD"
      class="mb-2"
      ><div
        v-for="(item, i) in goodList"
        :key="i"
        class="flex justify-between px-2"
      >
        <template v-for="(card, key) in item" :key="key"
          ><div
            class="w-1/2 flex flex-col bg-white my-1.5 mx-1.5 rounded-lg h-80"
            v-if="card"
          >
            <div class="w-full h-44 overflow-y-hidden">
              <img :src="card.img" alt="" class="w-full rounded-t-lg" />
            </div>
            <div class="w-full h-36 p-2 flex flex-col justify-between">
              <p class="text-gray-900 van-multi-ellipsis--l2 text-sm">
                <van-tag
                  v-if="card.tag"
                  type="danger"
                  size="medium"
                  class="mr-1 rounded"
                  >{{ card.tag }}</van-tag
                >{{ card.title }}</p
              >
              <div class="flex"
                ><van-tag
                  color="#f2f2f7"
                  class="mr-1 rounded-sm"
                  text-color="#999"
                  v-for="(trait, key) in card.traits"
                  :key="key"
                  >{{ trait }}</van-tag
                ></div
              >
              <p>
                <mall-price :price="card.price" special></mall-price>
              </p>
              <p class="text-gray-400 text-xs">
                {{ card.evaluation }}+评价 好评率{{ card.highPraise }}
              </p>
              <p class="text-gray-400 text-sm flex justify-between"
                ><span>{{ card.shops }} <van-icon name="arrow" /></span>
                <van-icon name="cart-o" size="20" color="#e4393c" />
              </p>
            </div> </div
          ><div v-else class="w-1/2 mx-1.5"></div
        ></template>
      </div>
    </van-list>
    <van-list v-bind="$attrs" v-on="$attrs" v-if="type === GoodType.LIST"
      ><div
        class="m-2 bg-white rounded-lg flex"
        v-for="(item, i) in goodList"
        :key="i"
      >
        <div class="w-1/3 h-32">
          <img :src="item.img" alt="" class="h-full w-full rounded-lg" />
        </div>
        <div class="flex flex-col justify-between py-2 px-4 w-2/3">
          <p class="text-gray-900 van-multi-ellipsis--l2 text-sm">
            <van-tag
              v-if="item.tag"
              type="danger"
              size="medium"
              class="mr-1 rounded"
              >{{ item.tag }}</van-tag
            >{{ item.title }}</p
          >
          <div class="flex mt-1" v-show="item.traits && item.traits.length">
            <van-tag
              color="#f2f2f7"
              class="mr-1 rounded-sm"
              text-color="#999"
              v-for="(trait, key) in item.traits"
              :key="key"
              >{{ trait }}</van-tag
            ></div
          >
          <p>
            <mall-price :price="item.price" special></mall-price>
          </p>
          <p class="text-gray-400 text-xs">
            {{ item.evaluation }}+评价 好评率{{ item.highPraise }}
          </p>
          <p class="text-gray-400 text-sm flex justify-between"
            ><span>{{ item.shops }} <van-icon name="arrow" /></span>
            <van-icon name="cart-o" size="20" color="#e4393c" />
          </p>
        </div>
      </div>
    </van-list>
  </div>
</template>

<script lang="ts">
  /* eslint-disable */
  import { computed, PropType } from 'vue'
  import { GoodType } from './type'
  export default {
    name: 'MallGoods',
    props: {
      type: {
        type: String as PropType<GoodType>,
        default: GoodType.LIST
      },
      list: {
        default: () => []
      }
    },
    setup(props: any) {
      const goodList = computed(() => {
        if (props.type === GoodType.CARD) {
          let pList = []
          for (let i = 0, len = props.list.length; i < len; i += 2) {
            pList.push([props.list[i], props.list[i + 1]])
          }
          return pList
        }
        return props.list
      })
      return {
        GoodType,
        goodList
      }
    }
  }
</script>

<style lang="scss"></style>
