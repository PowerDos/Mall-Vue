import * as baseApi from '@/api/baseApi';
import * as userApi from '@/api/userApi';
// 判断手机是否存在
export const isExist = ({ commit }, data) => {
  return new Promise((resolve, reject) => {
    baseApi.isExist(data).then(res => {
      const data = res.data;
      const result = { isExist: data.result.isExist };
      if (!data.result.isExist) {
        const checkNum = Math.floor(Math.random() * 9000 + 1000);
        commit('SET_CHECK_NUM', checkNum);
        result.checkNum = checkNum;
      }
      resolve(result);
    });
  });
};

// 注册
export const signUp = ({ commit }, data) => {
  return new Promise((resolve, reject) => {
    baseApi.signUp(data).then(res => {
      if (res.data.rcode === 0) {
        resolve(true);
      } else {
        resolve(false);
      }
    });
  });
};

// 登陆
export const login = ({ commit }, data) => {
  return new Promise((resolve, reject) => {
    baseApi.login(data).then(res => {
      const data = res.data;
      if (data.rcode === 0) {
        commit('SET_USER_LOGIN_INFO', data.result);
        resolve(true);
      } else {
        resolve(false);
      }
    }).catch(error => {
      reject(error);
    });
  });
};

// 判断登陆有没有过期
export const isExp = () => {
  return new Promise((resolve, reject) => {
    let info = localStorage.getItem('info');
    if (!info) {
      resolve(false);
      return;
    }
    info = JSON.parse(info);
    const now = new Date().getTime();
    if (info.exp > now) {
      resolve(true);
      return;
    }
    resolve(false);
  });
};

// 获取秒杀数据
export const loadSeckillsInfo = ({ commit }) => {
  return new Promise((resolve, reject) => {
    const data = [
      {
        intro: '【赠小风扇】维他 柠檬茶250ml*32盒 礼品装 整箱',
        img: 'static/img/index/seckill/seckill-item1.jpg',
        price: 71.9,
        realPrice: 89.6
      },
      {
        intro: 'Kindle Paperwhite 全新升级版6英寸护眼非反光电子墨水',
        img: 'static/img/index/seckill/seckill-item2.jpg',
        price: 989.0,
        realPrice: 1299.0
      },
      {
        intro: '粮悦 大吃兄糯米锅巴 安徽特产锅巴糯米原味400g*2盒',
        img: 'static/img/index/seckill/seckill-item3.jpg',
        price: 21.8,
        realPrice: 49.0
      },
      {
        intro: '【京东超市】清风（APP）抽纸 原木纯品金装系列 3层',
        img: 'static/img/index/seckill/seckill-item4.jpg',
        price: 49.9,
        realPrice: 59.0
      },
      {
        intro: 'NIKE耐克 男子休闲鞋 AIR MAX 90 ESSENTIAL 气垫',
        img: 'static/img/index/seckill/seckill-item5.jpg',
        price: 559.9,
        realPrice: 759.9
      }
    ];
    const date = new Date();
    const hours = date.getHours();
    const minute = date.getMinutes();
    const seconds = date.getSeconds();
    console.log([hours, minute, seconds]);
    // 距离开始秒杀时间
    const deadline = {
      hours: 1,
      minute: 38,
      seconds: 36
    };
    commit('SET_SECKILLS_INFO', [data, deadline]);
  });
};

// 获取轮播(营销)图片
export const loadCarouselItems = ({ commit }) => {
  return new Promise((resolve, reject) => {
    const data = {
      carouselItems: [
        'static/img/nav/1.jpg',
        'static/img/nav/2.jpg',
        'static/img/nav/3.jpg',
        'static/img/nav/4.jpg',
        'static/img/nav/5.jpg'
      ],
      activity: [
        'static/img/nav/nav_showimg1.jpg',
        'static/img/nav/nav_showimg2.jpg'
      ]
    };
    commit('SET_CAROUSELITEMS_INFO', data);
  });
};

// 加载电脑专栏数据
export const loadComputer = ({ commit }) => {
  return new Promise((resolve, reject) => {
    const computer = {
      title: '电脑数码',
      link: [ '电脑馆', '游戏极品', '装机大师', '职场焕新', '女神频道', '虚拟现实', '二合一平板', '电子教育', '万物周刊' ],
      detail: [
        {
          bigImg: 'static/img/index/computer/item-computer-1.jpg',
          itemFour: [
            {
              title: '电脑馆',
              intro: '笔记本999元限量秒！',
              img: 'static/img/index/computer/item-computer-2.jpg'
            },
            {
              title: '外设装备',
              intro: '1000减618',
              img: 'static/img/index/computer/item-computer-1-3.jpg'
            },
            {
              title: '电脑配件',
              intro: '联合满减最高省618',
              img: 'static/img/index/computer/item-computer-1-4.jpg'
            },
            {
              title: '办公生活',
              intro: '5折神券 精品文具',
              img: 'static/img/index/computer/item-computer-1-5.jpg'
            }
          ],
          itemContent: [
            'static/img/index/computer/item-computer-1-6.jpg',
            'static/img/index/computer/item-computer-1-7.jpg',
            'static/img/index/computer/item-computer-1-8.jpg'
          ]
        },
        {
          bigImg: 'static/img/index/computer/item-computer-2-1.jpg',
          itemFour: [
            {
              title: '平板电脑',
              intro: '爆款平板12期免息',
              img: 'static/img/index/computer/item-computer-2-2.jpg'
            },
            {
              title: '智能酷玩',
              intro: '抢999减666神券',
              img: 'static/img/index/computer/item-computer-2-3.jpg'
            },
            {
              title: '娱乐影音',
              intro: '大牌耳机低至5折',
              img: 'static/img/index/computer/item-computer-2-4.jpg'
            },
            {
              title: '摄影摄像',
              intro: '大牌相机5折抢',
              img: 'static/img/index/computer/item-computer-2-5.jpg'
            }
          ],
          itemContent: [
            'static/img/index/computer/item-computer-2-6.jpg',
            'static/img/index/computer/item-computer-2-7.jpg',
            'static/img/index/computer/item-computer-2-8.jpg'
          ]
        }
      ]
    };
    commit('SET_COMPUTER_INFO', computer);
  });
};

// 加载爱吃专栏数据
export const loadEat = ({ commit }) => {
  return new Promise((resolve, reject) => {
    const eat = {
      title: '爱吃',
      link: [ '休闲零食', '坚果', '牛奶', '饮料冲调', '食用油', '大米', '白酒', '红酒', '烧烤食材', '牛排', '樱桃' ],
      detail: [
        {
          bigImg: 'static/img/index/eat/item-eat-1-1.jpg',
          itemFour: [
            {
              title: '粮油调味',
              intro: '买2免1',
              img: 'static/img/index/eat/item-eat-1-2.jpg'
            },
            {
              title: '饮料冲调',
              intro: '第二件半价',
              img: 'static/img/index/eat/item-eat-1-3.jpg'
            },
            {
              title: '休闲零食',
              intro: '满99减40',
              img: 'static/img/index/eat/item-eat-1-4.jpg'
            },
            {
              title: '中外名酒',
              intro: '满199减100',
              img: 'static/img/index/eat/item-eat-1-5.jpg'
            }
          ],
          itemContent: [
            'static/img/index/eat/item-eat-1-6.jpg',
            'static/img/index/eat/item-eat-1-7.jpg',
            'static/img/index/eat/item-eat-1-8.jpg'
          ]
        },
        {
          bigImg: 'static/img/index/eat/item-eat-2-1.jpg',
          itemFour: [
            {
              title: '东家菜',
              intro: '丰富好味',
              img: 'static/img/index/eat/item-eat-2-2.jpg'
            },
            {
              title: '东家菜',
              intro: '丰富好味',
              img: 'static/img/index/eat/item-eat-2-2.jpg'
            },
            {
              title: '东家菜',
              intro: '丰富好味',
              img: 'static/img/index/eat/item-eat-2-2.jpg'
            },
            {
              title: '东家菜',
              intro: '丰富好味',
              img: 'static/img/index/eat/item-eat-2-2.jpg'
            }
          ],
          itemContent: [
            'static/img/index/eat/item-eat-2-6.jpg',
            'static/img/index/eat/item-eat-2-7.jpg',
            'static/img/index/eat/item-eat-2-8.jpg'
          ]
        }
      ]
    };
    commit('SET_EAT_INFO', eat);
  });
};

// 请求获得商品详细信息
export const loadGoodsInfo = ({ commit }, data) => {
  commit('SET_LOAD_STATUS', true);
  return new Promise((resolve, reject) => {
    baseApi.getOneGoods(data).then(res => {
      console.log(res.data.result);
      commit('SET_GOODS_DETAIL', res.data.result.data);
      commit('SET_LOAD_STATUS', false);
    });
  });
};

// 添加购物车
export const addShoppingCart = ({ commit }, data) => {
  const item = {
    goodsId: data.goods_id,
    merchantId: data.merchant_id,
    attrId: data.package.id,
    count: data.count,
    img: data.package.attrImgUrl,
    attrTitle: data.package.attrTitle,
    price: data.package.attrPrice,
    title: data.title,
    goodsCode: data.package.goodsCode
  };
  return new Promise((resolve, reject) => {
    userApi.addShoppingCart(item).then(res => {
      if (res.data.rcode === 0) {
        commit('ADD_SHOPPING_CART', item);
        resolve(true);
      } else {
        resolve(false);
      }
    });
  });
};

// 获取用户推荐
export const loadRecommend = ({ commit }) => {
  return new Promise((resolve, reject) => {
    const data = [
      [
        {
          img: 'static/img/otherBuy/1.jpg',
          intro: 'iPhone7/6s/8钢化膜苹果7Plus全屏全覆盖3D抗蓝',
          price: 29.00
        },
        {
          img: 'static/img/otherBuy/2.jpg',
          intro: '苹果数据线 苹果iPhoneX/6s/7plus/8充电线',
          price: 36.00
        },
        {
          img: 'static/img/otherBuy/3.jpg',
          intro: '苹果8/7/6/6s钢化膜 iphone8/7/6s/6钢化玻璃',
          price: 19.00
        },
        {
          img: 'static/img/otherBuy/4.jpg',
          intro: 'iPhone6s/7钢化膜苹果8 Plus手机膜抗蓝光非全屏',
          price: 28.00
        }
      ],
      [
        {
          img: 'static/img/otherBuy/5.jpg',
          intro: '苹果6s手机壳iPhone6s Plus保护壳防摔全',
          price: 28.00
        },
        {
          img: 'static/img/otherBuy/6.jpg',
          intro: 'iPhone7/8手机壳手机套防摔磨砂保护壳星空黑☆全包保护',
          price: 30.00
        },
        {
          img: 'static/img/otherBuy/7.jpg',
          intro: '数据线 适用于苹果iPhone 6s/6plus/7plus/8/X',
          price: 18.00
        },
        {
          img: 'static/img/otherBuy/8.jpg',
          intro: 'iPhone8/7/6S/6钢化膜 苹果8/7/6s/6玻璃膜 手机高',
          price: 15.00
        }
      ]
    ];
    commit('SET_RECOMMEND_INFO', data);
  });
};

// 加载收货地址
export const loadAddress = ({ commit }) => {
  return new Promise((resolve, reject) => {
    userApi.getAddressList().then(res => {
      if (res.data.rcode === 0) {
        commit('SET_USER_ADDRESS', res.data.result.data);
      }
    });
  });
};

// 删除收货地址
export const delAddress = ({ commit }, data) => {
  return new Promise((resolve, reject) => {
    userApi.delAddress(data).then(res => {
      if (res.data.rcode === 0) {
        resolve(true);
      } else {
        resolve(false);
      }
    });
  });
};

// 修改收货地址
export const editAddress = ({ commit }, data) => {
  return new Promise((resolve, reject) => {
    userApi.editAddress(data).then(res => {
      if (res.data.rcode === 0) {
        resolve(true);
      } else {
        resolve(false);
      }
    });
  });
};

// 加载购物车
export const loadShoppingCart = ({ commit }) => {
  return new Promise((resolve, reject) => {
    userApi.getShoppingCart().then(res => {
      console.log(res.data);
      commit('SET_SHOPPING_CART', res.data.result.data);
    });
  });
};

// 添加收货地址
export const addAddress = ({ commit }, data) => {
  return new Promise((resolve, reject) => {
    userApi.addAddress(data).then(res => {
      if (res.data.rcode === 0) {
        resolve(true);
      } else {
        resolve(false);
      }
    });
  });
};

// 按标签获取商品
export const getGoodsByName = ({ commit }, data) => {
  commit('SET_LOAD_STATUS', true);
  return new Promise((resolve, reject) => {
    baseApi.goodsList(data).then(res => {
      console.log(res.data.result);
      commit('SET_GOODS_INFO_BY_NAME', res.data.result.data);
      commit('SET_LOAD_STATUS', false);
    });
  });
};

// 获取商家的商品
export const getGoodsByMerchantId = ({ commit }, data) => {
  commit('SET_LOAD_STATUS', true);
  return new Promise((resolve, reject) => {
    baseApi.goodsList(null, data).then(res => {
      console.log(res.data.result);
      commit('SET_GOODS_INFO_BY_MERCHANT_ID', res.data.result.data);
      commit('SET_LOAD_STATUS', false);
    });
  });
};

// 生成订单
export const addOrder = ({ commit }, data) => {
  return new Promise((resolve, reject) => {
    userApi.addOrder(data).then(res => {
      if (res.data.rcode === 0) {
        resolve(true);
        commit('REMOVE_SHOPPING_CART', data.cart);
      } else {
        resolve(false);
      }
    });
  });
};

// 获取订单
export const getOrder = ({ commit }) => {
  return new Promise((resolve, reject) => {
    userApi.getOrder().then(res => {
      if (res.data.rcode === 0) {
        commit('SET_USER_ORDER_INFO', res.data.result.data);
        console.log(res.data);
      }
    });
  });
};
