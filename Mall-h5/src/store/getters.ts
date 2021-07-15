import type { OrderBy, IState } from './index'

// 字段排序函数
const compare = (property: OrderBy) => {
  return function (a: any, b: any) {
    const value1 = a[property]
    const value2 = b[property]
    return value1 - value2
  }
}

// 获取排序后的列表
export const orderGoodsList = (state: IState) => {
  return state.goodsList.sort(compare(state.orderBy))
}

// 获取秒杀的小时
export const seckillsHours = (state: IState) => {
  return state.seckills.deadline.hours < 10
    ? '0' + state.seckills.deadline.hours
    : state.seckills.deadline.hours
}

// 获取秒杀的分钟
export const seckillsMinutes = (state: IState) => {
  return state.seckills.deadline.minute < 10
    ? '0' + state.seckills.deadline.minute
    : state.seckills.deadline.minute
}

// 获取秒杀的秒
export const seckillsSeconds = (state: IState) => {
  return state.seckills.deadline.seconds < 10
    ? `0${state.seckills.deadline.seconds}`
    : state.seckills.deadline.seconds
}
