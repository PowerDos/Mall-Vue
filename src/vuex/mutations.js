// 设置注册步骤
export const SET_SIGN_UP_SETP = (state, step) => {
  state.signUpStep = step;
};

// 设置用户登录信息
export const SET_USER_LOGIN_INFO = (state, data) => {
  const info = {
    data: data,
    exp: new Date().getTime() + (3600 * 60 * 1000)
  };
  localStorage.setItem('info', JSON.stringify(info));
  state.userInfo = info;
};

// 更新用户信息
export const FLASH_USER_INFO = (state, data) => {
  const info = localStorage.getItem('info');
  state.userInfo = info === null ? {} : JSON.parse(info);
};

// 用户登出
export const SIGN_OUT_USER = (state) => {
  localStorage.removeItem('info');
  state.userInfo = {};
};

// 设置加载状态
export const SET_LOAD_STATUS = (state, status) => {
  state.isLoading = status;
};

// 设置秒杀商品
export const SET_SECKILLS_INFO = (state, seckills) => {
  state.seckills.goodsList = seckills[0];
  state.seckills.deadline = seckills[1];
};

// 设置轮播(营销)图
export const SET_CAROUSELITEMS_INFO = (state, {
  carouselItems,
  activity
}) => {
  state.marketing.CarouselItems = carouselItems;
  state.marketing.activity = activity;
};

// 设置电脑专栏数据
export const SET_COMPUTER_INFO = (state, computer) => {
  state.computer = computer;
};

// 设置爱吃专栏数据
export const SET_EAT_INFO = (state, eat) => {
  state.eat = eat;
};

// 减少秒杀时间
export const REDUCE_SECKILLS_TIME = state => {
  state.seckills.deadline.seconds--;
  if (state.seckills.deadline.seconds === -1) {
    state.seckills.deadline.seconds = 59;
    state.seckills.deadline.minute--;
    if (state.seckills.deadline.minute === -1) {
      state.seckills.deadline.minute = 59;
      state.seckills.deadline.hour--;
    }
  }
};

// 设置商品列表排序
export const SET_GOODS_ORDER_BY = (state, data) => {
  state.orderBy = data;
};

// 设置商品列表(搜索)
export const SET_GOODS_INFO_BY_NAME = (state, data) => {
  state.goodsInfoByName = data;
};

// 设置商户商品列表
export const SET_GOODS_INFO_BY_MERCHANT_ID = (state, data) => {
  state.goodsInfoByMerchanrtId = data;
};

// 设置商品详细信息
export const SET_GOODS_DETAIL = (state, data) => {
  console.log(data);
  state.goodsDetail = data;
};

// 添加购物车
export const ADD_SHOPPING_CART = (state, data) => {
  state.shoppingCart.push(data);
  state.newShoppingCart = data;
};

// 设置购物车信息
export const SET_SHOPPING_CART = (state, data) => {
  state.shoppingCart = data;
};

// 设置推荐信息
export const SET_RECOMMEND_INFO = (state, data) => {
  state.recommend = data;
};

// 设置收获地址
export const SET_USER_ADDRESS = (state, data) => {
  state.address = data;
};

// 设置验证码
export const SET_CHECK_NUM = (state, data) => {
  state.checkNum = data;
};

// 设置订单信息
export const SET_USER_ORDER_INFO = (state, data) => {
  console.log(data);
  state.order = data;
};

// 移除购物车信息
export const REMOVE_SHOPPING_CART = (state, data) => {
  for (const item of data) {
    for (let i = 0; i < state.shoppingCart.length; i++) {
      if (item === state.shoppingCart[i].id) {
        state.shoppingCart.splice(i, 1);
        break;
      }
    }
  }
};
