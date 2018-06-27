import http from '@/utils/http';

const post = (data) => {
  const info = JSON.parse(localStorage.getItem('info'));
  data.method = 'POST';
  data.headers = { 'x-access-token': info.data.token };
  return http(data);
};

// 添加收货地址
export const addAddress = (data) => {
  return post({
    url: '/u/address_add',
    data: {
      address: data
    }
  });
};

// 获取收货地址
export const getAddressList = () => {
  return post({
    url: '/u/address_list'
  });
};

// 删除地址
export const delAddress = (data) => {
  return post({
    url: '/u/address_del',
    data: {
      address: data
    }
  });
};

// 修改地址
export const editAddress = (data) => {
  return post({
    url: '/u/address_edit',
    data: {
      address: data
    }
  });
};

// 添加购物车
export const addShoppingCart = (data) => {
  return post({
    url: '/u/cart_add',
    data: {
      shoppingCart: data
    }
  });
};

// 获取购物车信息
export const getShoppingCart = () => {
  return post({
    url: '/u/cart_list'
  });
};

// 生成订单
export const addOrder = (data) => {
  return post({
    url: '/u/order_add',
    data: data
  });
};

// 获取订单
export const getOrder = () => {
  return post({
    url: '/u/order_list'
  });
};
