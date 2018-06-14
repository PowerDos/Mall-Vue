import Vue from 'vue';
import Vuex from 'vuex';

Vue.use(Vuex);
function compare (property) {
  return function (a, b) {
    var value1 = a[property];
    var value2 = b[property];
    return value1 - value2;
  };
}
export default new Vuex.Store({
  state: {
    isLoading: false,
    orderBy: 'sale',
    goodsInfo: {},
    userInfo: {
      username: ''
    },
    signUpStep: 0,
    CarouselItems: [
      'static/img/nav/1.jpg',
      'static/img/nav/2.jpg',
      'static/img/nav/3.jpg',
      'static/img/nav/4.jpg',
      'static/img/nav/5.jpg'
    ],
    seckills: [
      {
        intro: '【赠小风扇】维他 柠檬茶250ml*32盒 礼品装 整箱',
        img: '/static/img/index/seckill/seckill-item1.jpg',
        price: 71.9,
        realPrice: 89.6
      },
      {
        intro: 'Kindle Paperwhite 全新升级版6英寸护眼非反光电子墨水',
        img: '/static/img/index/seckill/seckill-item2.jpg',
        price: 989.0,
        realPrice: 1299.0
      },
      {
        intro: '粮悦 大吃兄糯米锅巴 安徽特产锅巴糯米原味400g*2盒',
        img: '/static/img/index/seckill/seckill-item3.jpg',
        price: 21.8,
        realPrice: 49.0
      },
      {
        intro: '【京东超市】清风（APP）抽纸 原木纯品金装系列 3层',
        img: '/static/img/index/seckill/seckill-item4.jpg',
        price: 49.9,
        realPrice: 59.0
      },
      {
        intro: 'NIKE耐克 男子休闲鞋 AIR MAX 90 ESSENTIAL 气垫',
        img: '/static/img/index/seckill/seckill-item5.jpg',
        price: 559.9,
        realPrice: 759.9
      }
    ],
    computer: {
      title: '电脑数码',
      link: [ '电脑馆', '游戏极品', '装机大师', '职场焕新', '女神频道', '虚拟现实', '二合一平板', '电子教育', '万物周刊' ],
      detail: [
        {
          bigImg: '/static/img/index/computer/item-computer-1.jpg',
          itemFour: [
            {
              title: '电脑馆',
              intro: '笔记本999元限量秒！',
              img: '/static/img/index/computer/item-computer-2.jpg'
            },
            {
              title: '外设装备',
              intro: '1000减618',
              img: '/static/img/index/computer/item-computer-1-3.jpg'
            },
            {
              title: '电脑配件',
              intro: '联合满减最高省618',
              img: '/static/img/index/computer/item-computer-1-4.jpg'
            },
            {
              title: '办公生活',
              intro: '5折神券 精品文具',
              img: '/static/img/index/computer/item-computer-1-5.jpg'
            }
          ],
          itemContent: [
            '/static/img/index/computer/item-computer-1-6.jpg',
            '/static/img/index/computer/item-computer-1-7.jpg',
            '/static/img/index/computer/item-computer-1-8.jpg'
          ]
        },
        {
          bigImg: '/static/img/index/computer/item-computer-2-1.jpg',
          itemFour: [
            {
              title: '平板电脑',
              intro: '爆款平板12期免息',
              img: '/static/img/index/computer/item-computer-2-2.jpg'
            },
            {
              title: '智能酷玩',
              intro: '抢999减666神券',
              img: '/static/img/index/computer/item-computer-2-3.jpg'
            },
            {
              title: '娱乐影音',
              intro: '大牌耳机低至5折',
              img: '/static/img/index/computer/item-computer-2-4.jpg'
            },
            {
              title: '摄影摄像',
              intro: '大牌相机5折抢',
              img: '/static/img/index/computer/item-computer-2-5.jpg'
            }
          ],
          itemContent: [
            '/static/img/index/computer/item-computer-2-6.jpg',
            '/static/img/index/computer/item-computer-2-7.jpg',
            '/static/img/index/computer/item-computer-2-8.jpg'
          ]
        }
      ]
    },
    eat: {
      title: '爱吃',
      link: [ '休闲零食', '坚果', '牛奶', '饮料冲调', '食用油', '大米', '白酒', '红酒', '烧烤食材', '牛排', '樱桃' ],
      detail: [
        {
          bigImg: '/static/img/index/eat/item-eat-1-1.jpg',
          itemFour: [
            {
              title: '粮油调味',
              intro: '买2免1',
              img: '/static/img/index/eat/item-eat-1-2.jpg'
            },
            {
              title: '饮料冲调',
              intro: '第二件半价',
              img: '/static/img/index/eat/item-eat-1-3.jpg'
            },
            {
              title: '休闲零食',
              intro: '满99减40',
              img: '/static/img/index/eat/item-eat-1-4.jpg'
            },
            {
              title: '中外名酒',
              intro: '满199减100',
              img: '/static/img/index/eat/item-eat-1-5.jpg'
            }
          ],
          itemContent: [
            '/static/img/index/eat/item-eat-1-6.jpg',
            '/static/img/index/eat/item-eat-1-7.jpg',
            '/static/img/index/eat/item-eat-1-8.jpg'
          ]
        },
        {
          bigImg: '/static/img/index/eat/item-eat-2-1.jpg',
          itemFour: [
            {
              title: '东家菜',
              intro: '丰富好味',
              img: '/static/img/index/eat/item-eat-2-2.jpg'
            },
            {
              title: '东家菜',
              intro: '丰富好味',
              img: '/static/img/index/eat/item-eat-2-2.jpg'
            },
            {
              title: '东家菜',
              intro: '丰富好味',
              img: '/static/img/index/eat/item-eat-2-2.jpg'
            },
            {
              title: '东家菜',
              intro: '丰富好味',
              img: '/static/img/index/eat/item-eat-2-2.jpg'
            }
          ],
          itemContent: [
            '/static/img/index/eat/item-eat-2-6.jpg',
            '/static/img/index/eat/item-eat-2-7.jpg',
            '/static/img/index/eat/item-eat-2-8.jpg'
          ]
        }
      ]
    },
    asItems: [],
    goodsList: []
  },
  getters: {
    orderGoodsList (state) {
      return state.goodsList.sort(compare(state.orderBy));
    }
  },
  actions: {
    loadGoodsList (context) {
      context.commit('SET_LOAD_STATUS', true);
      return new Promise((resolve, reject) => {
        setTimeout(() => {
          const data = {
            asItems: [
              {
                img: 'static/img/goodsList/item-as-img-1.jpg',
                price: 39.9,
                intro: 'SKSK 苹果7/7plus手机壳 iPhone 7 Plus保护套全包硬',
                num: 3140,
                sale: 9000
              },
              {
                img: 'static/img/goodsList/item-as-img-2.jpg',
                price: 36.6,
                intro: '狮普 苹果7/7 Plus手机壳 电镀 超薄 全包 防摔 保护外',
                num: 6160,
                sale: 8900
              },
              {
                img: 'static/img/goodsList/item-as-img-1.jpg',
                price: 38.6,
                intro: 'SKSK 苹果7/7plus手机壳 iPhone 7 Plus保护套全包硬',
                num: 9160,
                sale: 8800
              },
              {
                img: 'static/img/goodsList/item-as-img-2.jpg',
                price: 35.6,
                intro: '狮普 苹果7/7 Plus手机壳 电镀 超薄 全包 防摔 保护外',
                num: 6160,
                sale: 7990
              },
              {
                img: 'static/img/goodsList/item-as-img-1.jpg',
                price: 38.6,
                intro: 'SKSK 苹果7/7plus手机壳 iPhone 7 Plus保护套全包硬',
                num: 9160,
                sale: 7600
              },
              {
                img: 'static/img/goodsList/item-as-img-2.jpg',
                price: 35.6,
                intro: '狮普 苹果7/7 Plus手机壳 电镀 超薄 全包 防摔 保护外',
                num: 6160,
                sale: 6900
              }
            ],
            goodsList: [
              {
                img: 'static/img/goodsList/item-show-1.jpg',
                price: 36.60,
                intro: 'SKSK 苹果7/7plus手机壳 iPhone 7 Plus保护套全包硬壳男女磨砂防摔 火影红(苹',
                remarks: 6160,
                shopName: '元亨利配件专营店',
                sale: 9900
              },
              {
                img: 'static/img/goodsList/item-show-2.jpg',
                price: 28.00,
                intro: '蒙奇奇 苹果6s手机壳磨砂防摔保护套 适用于iphone6/6s/6sPlus/6plus 6/6s 4.7英',
                remarks: 3000,
                shopName: 'monqiqi旗舰店',
                sale: 9600
              },
              {
                img: 'static/img/goodsList/item-show-3.jpg',
                price: 15.00,
                intro: 'BIAZE 苹果6/6s手机壳 苹果iphone6s 4.7英寸透明手机套 清爽系列',
                remarks: 2800,
                shopName: 'BIAZE官方旗舰店',
                sale: 8900
              },
              {
                img: 'static/img/goodsList/item-show-4.jpg',
                price: 29.90,
                intro: '慕臣 苹果6s手机壳全包防摔磨砂软保护套男女 适用于iPhone6splus',
                remarks: 9000,
                shopName: '歌乐力手配专营店',
                sale: 8600
              },
              {
                img: 'static/img/goodsList/item-show-5.jpg',
                price: 15.00,
                intro: 'BIAZE 苹果6/6s手机壳 苹果iphone6s 4.7英寸透明手机套 清爽系列',
                remarks: 6160,
                shopName: 'BIAZE官方旗舰店',
                sale: 8560
              },
              {
                img: 'static/img/goodsList/item-show-6.jpg',
                price: 28.00,
                intro: '慕臣 苹果6s手机壳全包防摔磨砂软保护套男女 适用于iPhone6splus',
                remarks: 9006,
                shopName: '歌乐力手配专营店',
                sale: 8530
              },
              {
                img: 'static/img/goodsList/item-show-7.jpg',
                price: 15.00,
                intro: 'BIAZE 苹果6/6s手机壳 苹果iphone6s 4.7英寸透明手机套 清爽系列',
                remarks: 8666,
                shopName: 'BIAZE官方旗舰店',
                sale: 8360
              },
              {
                img: 'static/img/goodsList/item-show-8.jpg',
                price: 29.90,
                intro: '慕臣 苹果6s手机壳全包防摔磨砂软保护套男女 适用于iPhone6splus',
                remarks: 6080,
                shopName: '歌乐力手配专营店',
                sale: 7560
              },
              {
                img: 'static/img/goodsList/item-show-1.jpg',
                price: 36.60,
                intro: 'SKSK 苹果7/7plus手机壳 iPhone 7 Plus保护套全包硬壳男女磨砂防摔 火影红(苹',
                remarks: 6160,
                shopName: '元亨利配件专营店',
                sale: 7360
              },
              {
                img: 'static/img/goodsList/item-show-2.jpg',
                price: 28.00,
                intro: '蒙奇奇 苹果6s手机壳磨砂防摔保护套 适用于iphone6/6s/6sPlus/6plus 6/6s 4.7英',
                remarks: 3000,
                shopName: 'monqiqi旗舰店',
                sale: 6960
              },
              {
                img: 'static/img/goodsList/item-show-3.jpg',
                price: 15.00,
                intro: 'BIAZE 苹果6/6s手机壳 苹果iphone6s 4.7英寸透明手机套 清爽系列',
                remarks: 2800,
                shopName: 'BIAZE官方旗舰店',
                sale: 6560
              },
              {
                img: 'static/img/goodsList/item-show-4.jpg',
                price: 29.90,
                intro: '慕臣 苹果6s手机壳全包防摔磨砂软保护套男女 适用于iPhone6splus',
                remarks: 9000,
                shopName: '歌乐力手配专营店',
                sale: 6360
              },
              {
                img: 'static/img/goodsList/item-show-5.jpg',
                price: 15.00,
                intro: 'BIAZE 苹果6/6s手机壳 苹果iphone6s 4.7英寸透明手机套 清爽系列',
                remarks: 6160,
                shopName: 'BIAZE官方旗舰店',
                sale: 5530
              },
              {
                img: 'static/img/goodsList/item-show-6.jpg',
                price: 28.00,
                intro: '慕臣 苹果6s手机壳全包防摔磨砂软保护套男女 适用于iPhone6splus',
                remarks: 9006,
                shopName: '歌乐力手配专营店',
                sale: 5560
              },
              {
                img: 'static/img/goodsList/item-show-7.jpg',
                price: 15.00,
                intro: 'BIAZE 苹果6/6s手机壳 苹果iphone6s 4.7英寸透明手机套 清爽系列',
                remarks: 8666,
                shopName: 'BIAZE官方旗舰店',
                sale: 5260
              },
              {
                img: 'static/img/goodsList/item-show-8.jpg',
                price: 29.90,
                intro: '慕臣 苹果6s手机壳全包防摔磨砂软保护套男女 适用于iPhone6splus',
                remarks: 6080,
                shopName: '歌乐力手配专营店',
                sale: 3560
              }
            ]
          };
          context.commit('SET_GOODS_LIST', data);
          context.commit('SET_LOAD_STATUS', false);
        }, 500);
      });
    }
  },
  mutations: {
    SET_SIGN_UP_SETP (state, step) {
      state.signUpStep = step;
    },
    SET_USER_LOGIN_INFO (state, username) {
      state.userInfo.username = username;
    },
    SET_LOAD_STATUS (state, status) {
      state.isLoading = status;
    },
    SET_GOODS_LIST (state, data) {
      state.goodsList = data.goodsList;
      state.asItems = data.asItems;
    },
    SET_GOODS_ORDER_BY (state, data) {
      state.orderBy = data;
    }
  }
});
