// 字段正序排序函数
const compareASC = property => {
  return function (a, b) {
    let value1 = a[property];
    let value2 = b[property];
    return value1 - value2;
  };
};

// 字段倒序排序函数
const compareDesc = property => {
  return function (a, b) {
    let value1 = a[property];
    let value2 = b[property];
    return value2 - value1;
  };
};

// 获取排序后的列表
export const orderGoodsList = state => {
  if (state.sortBy === 'ASC') { // 升序
    return state.goodsList.sort(compareASC(state.orderBy.en));
  } else if (state.sortBy === 'DESC') { // 降序
    return state.goodsList.sort(compareDesc(state.orderBy.en));
  } else {
    console.log('sort error!');
  }
};

// 获取秒杀的小时
export const seckillsHours = state => {
  return state.seckills.deadline.hours < 10 ? '0' + state.seckills.deadline.hours : state.seckills.deadline.hours;
};

// 获取秒杀的分钟
export const seckillsMinutes = state => {
  return state.seckills.deadline.minute < 10 ? '0' + state.seckills.deadline.minute : state.seckills.deadline.minute;
};

// 获取秒杀的秒
export const seckillsSeconds = state => {
  return state.seckills.deadline.seconds < 10 ? `0${state.seckills.deadline.seconds}` : state.seckills.deadline.seconds;
};

// 获取payToken
export const payToken = state => {
  return state.payToken;
};
