import { IState } from './index'

// 设置注册步骤
export const SET_SIGN_UP_SETP = (state: IState, step: any): void => {
  state.signUpStep = step
}

// 设置用户登录信息
export const SET_USER_LOGIN_INFO = (state: IState, data: any): void => {
  state.userInfo = data
}

// 设置加载状态
export const SET_LOAD_STATUS = (state: IState, status: any): void => {
  state.isLoading = status
}

// 设置秒杀商品
export const SET_SECKILLS_INFO = (state: IState, seckills: any): void => {
  state.seckills.goodsList = seckills[0]
  state.seckills.deadline = seckills[1]
}

// 设置轮播(营销)图
export const SET_CAROUSELITEMS_INFO = (
  state: IState,
  { carouselItems, activity }: any
): void => {
  state.marketing.CarouselItems = carouselItems
  state.marketing.activity = activity
}

// 设置电脑专栏数据
export const SET_COMPUTER_INFO = (state: IState, computer: any): void => {
  state.computer = computer
}

// 设置爱吃专栏数据
export const SET_EAT_INFO = (state: IState, eat: any): void => {
  state.eat = eat
}

// 减少秒杀时间
export const REDUCE_SECKILLS_TIME = (state: IState): void => {
  state.seckills.deadline.seconds--
  if (state.seckills.deadline.seconds === -1) {
    state.seckills.deadline.seconds = 59
    state.seckills.deadline.minute--
    if (state.seckills.deadline.minute === -1) {
      state.seckills.deadline.minute = 59
      state.seckills.deadline.hour--
    }
  }
}

// 设置商品列表(搜索)
export const SET_GOODS_LIST = (state: IState, data: any): void => {
  state.goodsList = data.goodsList
  state.asItems = data.asItems
}

// 设置商品列表排序
export const SET_GOODS_ORDER_BY = (state: IState, data: any): void => {
  state.orderBy = data
}

// 设置商品详细信息
export const SET_GOODS_INFO = (state: IState, data: any): void => {
  state.goodsInfo = data
}

// 添加购物车
export const ADD_SHOPPING_CART = (state: IState, data: any): void => {
  const item = {
    goods_id: data.goods_id,
    count: data.count,
    img: data.package.img,
    package: data.package.intro,
    price: data.package.price,
    title: data.title
  }
  state.shoppingCart.push(item)
  state.newShoppingCart = data
}

// 设置购物车信息
export const SET_SHOPPING_CART = (state: IState, data: any): void => {
  state.shoppingCart = data
}

// 设置推荐信息
export const SET_RECOMMEND_INFO = (state: IState, data: any): void => {
  state.recommend = data
}

// 设置收获地址
export const SET_USER_ADDRESS = (state: IState, data: any): void => {
  state.address = data
}

// 设置分类数据
export const GET_CATEGORY_LIST = (state: IState, data: any): void => {
  state.category = data
}
// 设置商品数据
export const GET_GOODS_LIST = (state: IState, data: any): void => {
  state.goodsList = data
}
