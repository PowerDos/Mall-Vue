// 字段排序函数
const compare = property => {
  return function (a, b) {
    var value1 = a[property];
    var value2 = b[property];
    return value1 - value2;
  };
};

// 获取排序后的列表
export const goodsInfoByNameFilter = state => {
  const goodsList = [];
  for (const item of state.goodsInfoByName) {
    console.log(item.basicPrice);
    const temp = {
      goodsId: item.id,
      goodsName: item.goodsName.substring(0, 39) + '...',
      merchantName: item.merchant.merchantName,
      merchantId: item.merchant.id,
      goodsImgs: item.goodsImgs.split(',')[0],
      price: item.basicPrice,
      salesNum: item.salesNum
    };
    goodsList.push(temp);
  }
  return goodsList || [];
};

// 获取商品侧边广告栏
export const merchantItem = state => {
  if (state.goodsInfoByMerchanrtId.length <= 0) return [];
  const asAll = state.goodsInfoByMerchanrtId.sort(compare('salesNum'));
  const asItem = [];
  for (let i = 0; i < 6; i++) {
    const temp = {
      goodsId: asAll[i].id,
      goodsName: asAll[i].goodsName.substring(0, 30) + '...',
      merchantName: asAll[i].merchant.merchantName,
      merchantId: asAll[i].merchant.id,
      img: asAll[i].goodsImgs.split(',')[0],
      price: asAll[i].basicPrice,
      sale: asAll[i].salesNum
    };
    asItem.push(temp);
  }
  return asItem || [];
};

// 商家侧边栏
export const asItem = state => {
  if (state.goodsInfoByName.length <= 0) return [];
  const asAll = state.goodsInfoByName.sort(compare('salesNum'));
  const asItem = [];
  for (let i = 0; i < 6; i++) {
    const temp = {
      goodsId: asAll[i].id,
      goodsName: asAll[i].goodsName.substring(0, 30) + '...',
      merchantName: asAll[i].merchant.merchantName,
      merchantId: asAll[i].merchant.id,
      goodsImgs: asAll[i].goodsImgs.split(',')[0],
      price: asAll[i].basicPrice,
      salesNum: asAll[i].salesNum
    };
    asItem.push(temp);
  }
  return asItem || [];
};

// 获取商品详情基础展示
export const getGoodsDetailBase = state => {
  const goodsImgs = state.goodsDetail.goodsImgs ? state.goodsDetail.goodsImgs.split(',') : [];
  const price = state.goodsDetail.basicPrice;
  const data = {
    goodsImg: goodsImgs,
    goodsId: state.goodsDetail.id || 0,
    merchantId: state.goodsDetail.merchant ? state.goodsDetail.merchant.id : 0,
    title: state.goodsDetail.goodsName,
    tags: ['满69-20元', '关注产品★送钢化膜', 'BIT配次日达'],
    discount: ['满148减10', '满218减20', '满288减30'],
    promotion: ['跨店满减', '多买优惠'],
    salesNum: state.goodsDetail.salesNum,
    setMeal: state.goodsDetail.goodsAttrs,
    price: price
  };
  return data;
};

// 获取商品详情
export const getGoodsDetail = state => {
  const param = [];
  const desc = state.goodsDetail.goodsDesc ? state.goodsDetail.goodsDesc.split(',') : [];
  for (const item of state.goodsDetail.goodsDetails || []) {
    param.push({
      title: item.detailKey.substring(0, 15),
      content: item.detailValue.substring(0, 15)
    });
  }
  const data = {
    param: param || [],
    goodsDesc: desc || [],
    remarks: {
      goodAnalyse: 90,
      remarksTags: [ '颜色可人', '实惠优选', '严丝合缝', '极致轻薄', '质量没话说', '比定做还合适', '完美品质', '正品行货', '包装有档次', '不容易发热', '已经买第二个', '是全覆盖' ],
      remarksNumDetail: [ 2000, 3000, 900, 1 ],
      detail: [
        {
          username: 'p****1',
          values: 3,
          content: '颜色很好看，质量也不错！，还送了个指环，想不到哦！',
          goods: '4.7英寸-深邃蓝',
          create_at: '2018-05-15 09:20'
        },
        {
          username: '13****1',
          values: 5,
          content: '手感没的说，是硬壳，后背带有磨砂手感。很不错，很喜欢，还加送了钢化膜，支架环，物超所值，准备再买一个。很满意。物流很快。很愉快的一次购物！',
          goods: '5.5英寸-玫瑰金',
          create_at: '2018-05-13 15:23'
        },
        {
          username: '3****z',
          values: 4.5,
          content: '相当轻薄，店家还送了一大堆配件，*元非常值得！',
          goods: '4.7英寸-玫瑰金',
          create_at: '2018-05-05 12:25'
        },
        {
          username: 'gd****c',
          values: 3.5,
          content: '就是我想要的手机壳，壳子很薄，手感不错，就像没装手机壳一样，想要裸机手感的赶快下手了。',
          goods: '4.7英寸-中国红',
          create_at: '2018-04-06 16:23'
        },
        {
          username: 'r****b',
          values: 4.5,
          content: '壳子还不错，送的膜也可以，不过还是感觉膜小了那么一点，屏幕没法完全覆盖。对了，壳子稍微有点硬，可能会伤漆，所以不要频繁取壳就好。',
          goods: '4.7英寸-中国红',
          create_at: '2018-03-15 19:24'
        },
        {
          username: 'd****e',
          values: 5,
          content: '磨砂的，相当漂亮，尺寸非常合适！精工细作！',
          goods: '5.5英寸-星空黑',
          create_at: '2018-03-10 10:13'
        }
      ]
    }
  };
  return data;
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

// 获取收货地址
export const getAddress = state => {
  return state.address;
};
