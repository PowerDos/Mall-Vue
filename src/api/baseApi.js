import http from '@/utils/http';

export const login = (data) => {
  return http({
    url: '/user_login',
    method: 'POST',
    data: data
  });
};

export const signUp = (user) => {
  return http({
    url: '/user_signUp',
    method: 'POST',
    data: {
      user: user
    }
  });
};

// 判断用户手机是否注册过
export const isExist = (phone) => {
  return http({
    url: '/user_isExist',
    method: 'POST',
    data: {
      phone: phone
    }
  });
};
