import axios from 'axios';
// import {use} from "iview/dist/locale";
// 获取秒杀数据
export const loadSeckillsInfo = ({commit}) => {
  return new Promise((resolve, reject) => {
    let failData = [];
    let failTime = {
      hours: 0,
      minute: 0,
      seconds: 0
    };
    axios({
      method: 'get',
      url: '/seckill/loadSecKillInfo'
    })
      .then(function (response) {
        let responseCode = response.data.rtnCode.toString().trim();
        let responseData = response.data.data;
        if (responseCode === '200') {
          let seckillTime = responseData.seckillInfo.time;
          let seckillGoods = responseData.seckillInfo.seckillGoods;
          let seckillType = responseData.seckillInfo.type;
          commit('SET_SECKILLS_INFO', [seckillGoods, seckillTime]);
          resolve(seckillType);
        } else {
          commit('SET_SECKILLS_INFO', [failData, failTime]);
          resolve('');
        }
      })
      .catch(function (e) {
        commit('SET_SECKILLS_INFO', [failData, failTime]);
        resolve('');
      });
  });
};

// 获取商品分类数据
export const loadCategories = () => {
  return new Promise((resolve, reject) => {
    const failData = [
      {
        type: '加载失败，请稍重试',
        detail: {}
      }
    ];
    axios({
      method: 'get',
      url: '/goods/getGoodsCategories'
    })
      .then(function (response) {
        let responseCode = response.data.rtnCode.toString().trim();
        let responseData = response.data.data;
        if (responseCode === '200') {
          let data = responseData.categoriesInfo;
          resolve(data);
        } else {
          resolve([]);
        }
      })
      .catch(function (e) {
        resolve(failData);
      });
  });
};

// 获取商品属性数据
export const loadAttributes = ({commit}, categoryId) => {
  return new Promise((resolve, reject) => {
    const failData = [
      {
        tagName: '加载失败..请稍后刷新页面重试',
        tags: ['加载失败..请稍后刷新页面重试']
      }
    ];
    axios({
      method: 'get',
      url: '/goods/getGoodsAttributes',
      headers: {categoryId: categoryId}
      // params: {}
    })
      .then(function (response) {
        let responseCode = response.data.rtnCode.toString().trim();
        let responseData = response.data.data;
        if (responseCode === '200') {
          let data = responseData.attributesInfo;
          resolve(data);
        } else {
          resolve(failData);
        }
      })
      .catch(function (e) {
        resolve(failData);
      });
  });
};

// 创建订单
export const prePayAction = ({commit}, payList) => {
  return new Promise((resolve, reject) => {
    axios({
      method: 'post',
      url: '/order/prePay',
      data: JSON.stringify({
        payList: payList,
        couponIdList: [],
        payChannelBean: 'aliPayTest'
      }),
      headers: {'Content-Type': 'application/json'}
    })
      .then(function (response) {
        let responseCode = response.data.rtnCode.toString().trim();
        let responseData = response.data.data;
        if (responseCode === '200') {
          let payToken = responseData.payToken;
          commit('SET_PAY_TOKEN', payToken);
        }
      });
  });
};

// 支付完成后查询支付状态
export const queryPayStatue = ({commit}, payData) => {
  return new Promise((resolve, reject) => {
    let failData = 'networkErr';
    axios({
      method: 'post',
      url: '/order/queryPayStatue',
      data: payData.params,
      headers: {'payToken': payData.payToken}
    })
      .then(function (response) {
        let responseCode = response.data.rtnCode.toString().trim();
        let responseData = response.data.msg;
        if (responseCode === '200') {
          resolve(responseData);
        }
      })
      .catch(function (e) {
        resolve(failData);
      });
  });
};

// 获取轮播(营销)图片
export const loadCarouselItems = ({commit}) => {
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
export const loadComputer = ({commit}) => {
  return new Promise((resolve, reject) => {
    const computer = {
      title: '电脑数码',
      link: ['电脑馆', '游戏极品', '装机大师', '职场焕新', '女神频道', '虚拟现实', '二合一平板', '电子教育', '万物周刊'],
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
export const loadEat = ({commit}) => {
  return new Promise((resolve, reject) => {
    const eat = {
      title: '爱吃',
      link: ['休闲零食', '坚果', '牛奶', '饮料冲调', '食用油', '大米', '白酒', '红酒', '烧烤食材', '牛排', '樱桃'],
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
export const loadGoodsInfo = ({commit}, productId) => {
  commit('SET_LOAD_STATUS', true);
  return new Promise(() => {
    const failData = {
      goodsImg: [],
      title: '',
      tags: [],
      discount: [],
      promotion: [],
      remarksNum: 0,
      setMeal: [],
      hot: [],
      goodsDetail: [],
      param: [],
      remarks: {}
    };
    axios({
      method: 'get',
      url: '/goods/getGoodDetail',
      headers: {productId: productId}
      // params: {}
    })
      .then(function (response) {
        let responseCode = response.data.rtnCode.toString().trim();
        let responseData = response.data.data;
        if (responseCode === '200') {
          let data = responseData.goodDetail;
          // data.goodsImg = [
          //   'static/img/goodsDetail/item-detail-1.jpg',
          //   'static/img/goodsDetail/item-detail-2.jpg',
          //   'static/img/goodsDetail/item-detail-3.jpg',
          //   'static/img/goodsDetail/item-detail-4.jpg'
          // ];
          commit('SET_GOODS_INFO', data);
          commit('SET_LOAD_STATUS', false);
        } else {
          commit('SET_GOODS_INFO', failData);
          commit('SET_LOAD_STATUS', false);
        }
      })
      .catch(function (e) {
        commit('SET_GOODS_INFO', failData);
        commit('SET_LOAD_STATUS', false);
      });
  });
};

export const loadSeckillGoodsInfo = ({commit}, seckillId) => {
  commit('SET_LOAD_STATUS', true);
  return new Promise((resolve, reject) => {
    const failData = {
      goodsImg: [],
      title: '',
      tags: [],
      discount: [],
      promotion: [],
      remarksNum: 0,
      setMeal: [],
      hot: [],
      goodsDetail: [],
      param: [],
      remarks: {}
    };
    axios({
      method: 'get',
      url: '/seckill/SecKillDetail',
      headers: {secKillId: seckillId}
    })
      .then(function (response) {
        let responseCode = response.data.rtnCode.toString().trim();
        let responseData = response.data.data;
        if (responseCode === '200') {
          let data = responseData.goodDetail;
          console.log(data);
          commit('SET_GOODS_INFO', data);
          commit('SET_LOAD_STATUS', false);
          resolve();
        } else {
          commit('SET_GOODS_INFO', failData);
          commit('SET_LOAD_STATUS', false);
        }
      })
      .catch(function (e) {
        commit('SET_GOODS_INFO', failData);
        commit('SET_LOAD_STATUS', false);
      });
  });
};

// 获取商品列表
export const loadGoodsList = ({commit}, categoryId) => {
  commit('SET_LOAD_STATUS', true);
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      let data = {
        // 广告信息
        asItems: [
          {
            img: 'static/img/goodsList/item-as-img-1.jpg',
            price: 39.9,
            intro: 'SKSK 苹果7/7plus手机壳 iPhone 7 Plus保护套全包硬',
            num: 3140,
            sale: 9000
          }
        ],
        // 商品信息
        goodsList: [
          {
            img: '',
            lowestPrice: '0',
            intro: '加载失败！请刷新重试',
            comment: '0',
            shopName: '0',
            sale: '0'
          }
        ]
      };
      axios({
        method: 'get',
        url: '/goods/getGoodsLists',
        headers: {categoryId: categoryId}
      })
        .then(function (response) {
          let responseCode = response.data.rtnCode.toString().trim();
          let responseData = response.data.data;
          if (responseCode === '200') {
            data = responseData.productsInfo;
            resolve(data);
            commit('SET_GOODS_LIST', data);
          } else {
            resolve(data);
          }
        })
        .catch(function (e) {
          resolve(data);
        });
      commit('SET_GOODS_LIST', data);
      commit('SET_LOAD_STATUS', false);
    });
  });
};

// 秒杀商品
export const secKillAction = ({commit}, param) => {
  let seckillId = param[0];
  let userToken = param[1];
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      axios({
        method: 'post',
        url: '/seckill/SecKill',
        headers: {userToken: userToken,
          seckillId: seckillId}
      })
        .then(function (response) {
          resolve(response.data);
        })
        .catch(function (e) {
          resolve('网络连接超时');
        });
    });
  });
};

// 查询秒杀订单是否成功
export const querysecKillActionStatue = ({commit}, seckillToken) => {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      axios({
        method: 'post',
        url: '/seckill/querysecKilStatue',
        headers: {seckillToken: seckillToken}
      })
        .then(function (response) {
          let responseData = response.data.data;
          resolve(responseData.statue);
        })
        .catch(function (e) {
          resolve('网络连接超时');
        });
    });
  });
};

// 获取搜索商品列表
export const searchGoodsList = ({commit}, searchStr) => {
  commit('SET_LOAD_STATUS', true);
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      let failData = {
        // 广告信息
        asItems: [
          {
            img: 'static/img/goodsList/item-as-img-1.jpg',
            price: 39.9,
            intro: 'SKSK 苹果7/7plus手机壳 iPhone 7 Plus保护套全包硬',
            num: 3140,
            sale: 9000
          }
        ],
        // 商品信息
        goodsList: [
          {
            img: '',
            lowestPrice: '0',
            intro: '查询失败！请刷新重试',
            comment: '0',
            shopName: '0',
            sale: '0'
          }
        ]
      };
      axios({
        method: 'get',
        url: '/goods/searchGoodsLists',
        headers: {searchStr: encodeURI(searchStr)}
      })
        .then(function (response) {
          let responseCode = response.data.rtnCode.toString().trim();
          let responseData = response.data.data;
          if (responseCode === '200') {
            let data = responseData.productsInfo;
            // resolve(data);
            commit('SET_GOODS_LIST', data);
            resolve();
          } else {
            commit('SET_GOODS_LIST', failData);
          }
        })
        .catch(function (e) {
          commit('SET_GOODS_LIST', failData);
        });
      commit('SET_LOAD_STATUS', false);
    });
  });
};

// 添加购物车
export const addShoppingCart = ({commit}, data) => {
  return new Promise((resolve, reject) => {
    commit('ADD_SHOPPING_CART', data);
  });
};

// 加载订单信息
export const loadOrders = ({commit}, userToken) => {
  return new Promise((resolve, reject) => {
    axios({
      method: 'get',
      url: '/order/loadOrders',
      headers: {userToken: userToken}
    })
      .then(function (response) {
        let responseCode = response.data.rtnCode.toString().trim();
        let responseData = response.data.data;
        if (responseCode === '200') {
          let data = responseData.orderInfo;
          resolve(data);
        } else {
          // resolve(data);
        }
      })
      .catch(function (e) {
        // resolve(data);
      });
  });
};
// 获取用户推荐
export const loadRecommend = ({commit}) => {
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

export const loadAddress = ({commit}) => {
  return new Promise((resolve, reject) => {
    const address = [
      {
        addressId: '123456',
        name: 'Gavin',
        province: '广东省',
        city: '广州市',
        area: '天河区',
        address: '燕岭路633号',
        phone: '152****0609',
        postalcode: '510000'
      },
      {
        addressId: '123458',
        name: 'Kevin',
        province: '上海市',
        city: '上海市',
        area: '浦东新区',
        address: '沙新镇',
        phone: '158****0888',
        postalcode: '200120'
      }
    ];
    commit('SET_USER_ADDRESS', address);
  });
};

// 加载购物车数据
export const loadShoppingCart = ({commit}) => {
  return new Promise((resolve, reject) => {
    // const data = [{
    //   // goods_id: 1529931938150,
    //   productId: 1,
    //   specsId: 1,
    //   count: 1,
    //   img: 'static/img/goodsDetail/pack/1.jpg',
    //   package: '4.7英寸-深邃蓝',
    //   price: 28,
    //   title: '苹果8/7手机壳iPhone7 Plus保护壳全包防摔磨砂硬外壳'
    // },
    // {
    //   // goods_id: 1529931938150,
    //   productId: 1,
    //   specsId: 2,
    //   count: 1,
    //   img: 'static/img/goodsDetail/pack/2.jpg',
    //   package: '4.7英寸-深邃红',
    //   price: 28,
    //   title: '苹果8/7手机壳iPhone7 Plus保护壳全包防摔磨砂硬外壳'
    // }];
    // commit('SET_SHOPPING_CART', data);
  });
};

// 添加注册用户
export const addSignUpUser = ({commit}, data) => {
  return new Promise((resolve, reject) => {
    // const userArr = localStorage.getItem('users');
    // let users = [];
    // if (userArr) {
    //   users = JSON.parse(userArr);
    // }
    // users.push(data);
    // localStorage.setItem('users', JSON.stringify(users));
  });
};
// 用户登录
export const login = ({commit}, data) => {
  return new Promise((resolve, reject) => {
    let loginType;
    let deviceInfo;
    if (/(iPhone)/i.test(navigator.userAgent)) {
      loginType = 'IOS';
      deviceInfo = 'iPone';
    } else if (/(iPad)/i.test(navigator.userAgent)) {
      loginType = 'IOS';
      deviceInfo = 'iPad';
    } else if (/(iPod)/i.test(navigator.userAgent)) {
      loginType = 'IOS';
      deviceInfo = 'iPod';
    } else if (/(iOS)/i.test(navigator.userAgent)) {
      loginType = 'IOS';
      deviceInfo = 'iOS';
    } else if (/(Android)/i.test(navigator.userAgent)) {
      loginType = 'Android';
      deviceInfo = 'Android';
    } else {
      loginType = 'PC';
      deviceInfo = 'PC';
    }
    let userLoginInpDTO = {
      'mobile': data.mobile,
      'password': data.password,
      'loginType': loginType,
      'deviceInfo': deviceInfo
    };
    axios({
      method: 'post',
      url: '/member/login',
      data: JSON.stringify(userLoginInpDTO),
      headers: {'Content-Type': 'application/json'}
    })
      .then(function (response) {
        let responseCode = response.data.rtnCode.toString().trim();
        let responseMsg = response.data.msg.toString().trim();
        let callbackData = {'code': responseCode, 'MSG': responseMsg};
        if (responseCode === '200') {
          // 进入下一步骤,登录成功 添加到状态信息中去
          data.token = response.data.data.token;
          data.username = response.data.data.username;
          localStorage.setItem('loginInfo', JSON.stringify(data));
          callbackData.MSG = {
            'mobile': data.mobile,
            'loginType': loginType,
            'token': data.token
          };
          commit('SET_USER_LOGIN_INFO', data);
          resolve(callbackData);
          return true;
        } else {
          resolve(callbackData);
        }
      })
      .catch(function (e) {
        resolve({'code': '500', 'MSG': '系统错误！'});
      });
  });
};

// 退出登陆
export const signOut = ({commit}) => {
  return new Promise((resolve, reject) => {
    axios({
      method: 'post',
      url: '/member/signOut',
      headers: {'Content-Type': 'application/json'}
    })
      .then(function (response) {
        let responseCode = response.data.rtnCode.toString().trim();
        let responseMsg = response.data.msg.toString().trim();
        let callbackData = {'code': responseCode, 'MSG': responseMsg};
        if (responseCode === '200') {
          localStorage.removeItem('loginInfo');
          commit('SET_USER_LOGIN_INFO', {});
        }
        resolve(callbackData);
      })
      .catch(function (e) {
        resolve({'code': '500', 'MSG': '系统错误！'});
      });
  });
};

// 判断是否登陆
export const isLogin = ({commit}, cookies) => {
  let token = cookies.get('token');
  let mobile = cookies.get('mobile');
  let user = localStorage.getItem('loginInfo');
  if (token && mobile && user) {
    commit('SET_USER_LOGIN_INFO', JSON.parse(user));
  } else {
    localStorage.removeItem('loginInfo');
    cookies.remove('token');
    cookies.remove('mobile');
    cookies.remove('loginType');
  }
};
// 检查用户的登录状态
export const checkToken = ({commit}, loginToken) => {
  return new Promise((resolve, reject) => {
    let resolveData = {};
    axios({
      method: 'post',
      url: '/member/checkLoginStatue',
      headers: {'loginToken': loginToken}
    })
      .then(function (response) {
        let responseCode = response.data.rtnCode.toString().trim();
        let responseMsg = response.data.msg.toString().trim();
        if (responseCode === '200') {
          if (responseMsg === 'online') {
            // 在线正常
            resolveData.code = 200;
            resolveData.data = 'online';
          } else if (responseMsg === 'offline') {
            resolveData.code = 500;
            resolveData.data = '账号超时下线';
            commit('SET_USER_LOGIN_INFO', {});
          } else if (responseMsg === 'out') {
            let responseData = response.data.data;
            console.log(responseData);
            resolveData.code = 500;
            resolveData.data = '账号于' + responseData.time + '在' + responseData.deviceInfo +
              '设备上登录' + '登录ip' + responseData.ip;
            commit('SET_USER_LOGIN_INFO', {});
          }
        } else {
          resolveData.code = 500;
          resolveData.data = '网络连接异常,账号下线';
          commit('SET_USER_LOGIN_INFO', {});
        }
        resolve(resolveData);
      })
      .catch(function (e) {
        console.log(e);
        resolveData.code = 500;
        resolveData.data = '系统异常,账号下线';
        resolve(resolveData);
        commit('SET_USER_LOGIN_INFO', {});
      });
  });
};
