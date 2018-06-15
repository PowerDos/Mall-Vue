// 设置注册步骤
export const SET_SIGN_UP_SETP = (state, step) => {
  state.signUpStep = step;
};

// 设置用户登录信息
export const SET_USER_LOGIN_INFO = (state, username) => {
  state.userInfo.username = username;
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
export const SET_CAROUSELITEMS_INFO = (state, { carouselItems, activity }) => {
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

// 设置商品列表(搜索)
export const SET_GOODS_LIST = (state, data) => {
  state.goodsList = data.goodsList;
  state.asItems = data.asItems;
};

// 设置商品列表排序
export const SET_GOODS_ORDER_BY = (state, data) => {
  state.orderBy = data;
};

// 设置商品详细信息
export const SET_GOODS_INFO = (state, data) => {
  state.goodsInfo = data;
};
