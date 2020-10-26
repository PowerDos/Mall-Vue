<template>
  <div>
    <div class="item-detail-show">
      <el-dialog
        title="提示"
        :visible.sync="dialogVisible"
        width="30%">
        <span>{{message}}</span>
        <span slot="footer" class="dialog-footer">
    <el-button @click="dialogVisible = false">取 消</el-button>
    <el-button type="primary" @click="dialogVisible = false">确 定</el-button>
  </span>
      </el-dialog>
      <div class="item-detail-left">
        <div class="item-detail-big-img">
          <img :src="goodsInfo.goodsImg[imgIndex]" alt="" ref="viewImg">
        </div>
        <div class="item-detail-img-row">
          <div class="item-detail-img-small" v-for="(item, index) in goodsInfo.goodsImg" :key="index"
               @mouseover="showBigImg(index)">
            <img :src="item" alt="">
          </div>
        </div>
      </div>
      <div class="item-detail-right">
        <div class="item-detail-title">
          <p>
            <span class="item-detail-express">校园配送</span> {{goodsInfo.title}}</p>
        </div>
        <div class="item-detail-tag">
          <p>
            <span v-for="(item,index) in goodsInfo.tags" :key="index">【{{item}}】</span>
          </p>
        </div>
        <div class="item-detail-price-row">
          <div class="item-price-left">
            <div class="item-price-row">
              <p>
                <span class="item-price-title">B I T 价</span>
                <span class="item-price">￥{{price.toFixed(2)}}</span>
              </p>
            </div>
            <div class="item-price-row">
              <p>
                <span class="item-price-title">优 惠 价</span>
                <span class="item-price-full-cut" v-for="(item,index) in goodsInfo.discount"
                      :key="index">{{item}}</span>
              </p>
            </div>
            <div class="item-price-row">
              <p>
                <span class="item-price-title">促&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;销</span>
                <span class="item-price-full-cut" v-for="(item,index) in goodsInfo.promotion"
                      :key="index">{{item}}</span>
              </p>
            </div>
          </div>
          <div class="item-price-right">
            <div class="item-remarks-sum">
              <p>累计评价</p>
              <p>
                <span class="item-remarks-num">{{goodsInfo.remarksNum}} 条</span>
              </p>
            </div>
          </div>
        </div>
        <!-- 选择颜色 -->
        <div class="item-select">
          <div class="item-select-title">
            <p>选择规格</p>
          </div>
          <div class="item-select-column">
            <div class="item-select-row" v-for="(items, index) in goodsInfo.setMeal" :key="index">
              <div class="item-select-box" v-for="(item, index1) in items" :key="index1"
                   @mouseenter="select(index, index1)"
                   :class="{'item-select-box-active': ((index * 3) + index1) === selectBoxIndex}">
                <div class="item-select-img">
                  <img :src="item.img" alt="">
                </div>
                <div class="item-select-intro">
                  <p>{{item.intro}}</p>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- 白条分期 -->
        <div class="item-select">
          <div class="item-select-title">
            <p>白条分期</p>
          </div>
          <div class="item-select-row">
            <div class="item-select-class" v-for="(item,index) in hirePurchase" :key="index">
              <Tooltip :content="item.tooltip" placement="top-start">
                <span>{{item.type}}</span>
              </Tooltip>
            </div>
          </div>
        </div>
        <br>
        <div class="add-buy-car-box">
          <div class="add-buy-car">
            <InputNumber :min="1" v-model="count" size="large" :style="{visibility:shopVisibility}"></InputNumber>
            <Button type="error" size="large" @click="addShoppingCartBtn()" :style="{visibility:shopVisibility}">加入购物车
            </Button>
            <Button type="error" size="large" @click="seckill()" :style="{visibility:seckillVisibility}">立即秒杀</Button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import store from '@/vuex/store';
  import {mapState, mapActions} from 'vuex';

  export default {
    name: 'ShowGoods',
    data() {
      return {
        price: 0,
        count: 1,
        selectBoxIndex: undefined,
        imgIndex: 0,
        buyType: '1',
        shopVisibility: 'visible',
        seckillVisibility: 'hidden',
        seckillId: 0,
        message: '',
        dialogVisible: false
      };
    },
    computed: {
      ...mapState(['goodsInfo']),
      hirePurchase() {
        const three = this.price * this.count / 3;
        const sex = this.price * this.count / 6;
        const twelve = this.price * this.count / 12 * 1.0025;
        const twentyFour = this.price * this.count / 24 * 1.005;
        return [
          {
            tooltip: '无手续费',
            type: '不分期'
          },
          {
            tooltip: '无手续费',
            type: `￥${three.toFixed(2)} x 3期`
          },
          {
            tooltip: '无手续费',
            type: `￥${sex.toFixed(2)} x 6期`
          },
          {
            tooltip: '含手续费：费率0.25%起，￥0.1起×12期',
            type: `￥${twelve.toFixed(2)} x 12期`
          },
          {
            tooltip: '含手续费：费率0.5%起，￥0.1起×12期',
            type: `￥${twentyFour.toFixed(2)} x 24期`
          }
        ];
      }
    },
    methods: {
      ...mapActions(['addShoppingCart']),
      ...mapActions(['addSeckillCart']),
      ...mapActions(['secKillAction']),
      ...mapActions(['querysecKillActionStatue']),
      select(index1, index2) {
        this.selectBoxIndex = index1 * 3 + index2;
        this.price = this.goodsInfo.setMeal[index1][index2].price;
        // 在这里修改预览位置的图片
        this.$refs.viewImg.src = this.goodsInfo.goodsImg[index1 + index2];
      },
      showBigImg(index) {
        this.imgIndex = index;
      },
      addShoppingCartBtn() {
        const index1 = parseInt(this.selectBoxIndex / 3);
        const index2 = this.selectBoxIndex % 3;
        const data = {
          productId: this.goodsInfo.productId,
          specsId: this.goodsInfo.setMeal[index1][index2].specsId,
          title: this.goodsInfo.title,
          count: this.count,
          package: this.goodsInfo.setMeal[index1][index2]
        };
        this.addShoppingCart(data);
        this.$router.push('/shoppingCart');
      },
      seckill() {
        let that = this;
        let loginToken = this.$cookies.get('token');
        this.secKillAction([this.seckillId, loginToken]).then(function (response) {
          console.log(response);
          if (response.rtnCode.toString().trim() === '200') {
            // 在这里进行轮询查询订单是否创建成功，如果创建成功 跳转到订单结算页面
            let seckillToken = response.data.seckillToken;
            console.log('秒杀商品token' + seckillToken);
            that.handleSeckillStute(seckillToken);
          } else {
            that.message = response.msg;
            that.dialogVisible = true;
          }
        });
      },
      handleSeckillStute(seckillToken) {
        let that = this;
        setTimeout(function () {
          const loading = that.$loading({
            lock: true,
            text: '正在创建订单...请稍后',
            spinner: 'el-icon-loading',
            background: 'rgba(0, 0, 0, 0.7)'
          });
          that.querysecKillActionStatue(seckillToken).then(statue => {
            if (statue === 'success') {
              const data = {
                productId: that.goodsInfo.productId,
                specsId: that.goodsInfo.setMeal[0][0].specsId,
                title: that.goodsInfo.title,
                count: that.count,
                package: that.goodsInfo.setMeal[0][0]
              };
              console.log(data);
              that.addShoppingCart(data);
              loading.close();
              that.$router.push('/order');
            } else if (statue === 'fail') {
              // 秒杀失败
              that.message = '手慢了，秒杀失败！';
              that.dialogVisible = true;
              loading.close();
            } else if (statue === 'wait') {
              // 等待查询
              that.handleSeckillStute(seckillToken);
            }
          });
        }, 1);
      }
    },
    mounted() {
    },
    watch: {
      buyType(val1) {
        if (val1 === 'seckill') {
          this.shopVisibility = 'hidden';
          this.seckillVisibility = 'visible';
        }
      }
    },
    store
  };
</script>

<style scoped>
  /******************商品图片及购买详情开始******************/
  .item-detail-show {
    width: 80%;
    margin: 15px auto;
    display: flex;
    flex-direction: row;
    background-color: #fff;
  }

  .item-detail-left {
    width: 350px;
    margin-right: 30px;
  }

  .item-detail-big-img {
    width: 350px;
    height: 350px;
    box-shadow: 0px 0px 8px #ccc;
    cursor: pointer;
  }

  .item-detail-big-img img {
    width: 100%;
  }

  .item-detail-img-row {
    margin-top: 15px;
    display: flex;
    flex-direction: row;
    justify-content: space-between;
  }

  .item-detail-img-small {
    width: 68px;
    height: 68px;
    box-shadow: 0px 0px 8px #ccc;
    cursor: pointer;
  }

  .item-detail-img-small img {
    width: 100%;
  }

  /*商品选购详情*/
  .item-detail-right {
    display: flex;
    flex-direction: column;
  }

  .item-detail-title p {
    color: #666;
    font-size: 20px;
  }

  .item-detail-express {
    font-size: 14px;
    padding: 2px 3px;
    border-radius: 3px;
    background-color: #e4393c;
    color: #fff;
  }

  /*商品标签*/
  .item-detail-tag {
    font-size: 12px;
    color: #e4393c;
  }

  /*价格详情等*/
  .item-detail-price-row {
    padding: 5px;
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    background-color: #f3f3f3;
  }

  .item-price-left {
    display: flex;
    flex-direction: column;
  }

  .item-price-title {
    color: #999999;
    font-size: 14px;
    margin-right: 15px;
  }

  .item-price-row {
    margin: 5px 0px;
  }

  .item-price {
    color: #e4393c;
    font-size: 23px;
    cursor: pointer;
  }

  .item-price-full-cut {
    margin-right: 5px;
    padding: 3px;
    color: #e4393c;
    font-size: 12px;
    background-color: #ffdedf;
    border: 1px dotted #e4393c;
    cursor: pointer;
  }

  .item-remarks-sum {
    padding-left: 8px;
    border-left: 1px solid #ccc;
  }

  .item-remarks-sum p {
    color: #999999;
    font-size: 12px;
    line-height: 10px;
    text-align: center;
  }

  .item-remarks-num {
    line-height: 18px;
    color: #005eb7;
  }

  .item-select {
    display: flex;
    flex-direction: row;
    margin-top: 15px;
  }

  .item-select-title {
    color: #999999;
    font-size: 14px;
    margin-right: 15px;
  }

  .item-select-column {
    display: flex;
    flex-direction: column;
  }

  .item-select-row {
    display: flex;
    flex-direction: row;
    margin-bottom: 8px;
  }

  .item-select-box {
    display: flex;
    flex-direction: row;
    align-items: center;
  }

  .item-select-img {
    width: 36px;
  }

  .item-select-box {
    padding: 5px;
    margin-right: 8px;
    background-color: #f7f7f7;
    border: 0.5px solid #ccc;
    cursor: pointer;
  }

  .item-select-box:hover {
    border: 0.5px solid #e3393c;
  }

  .item-select-box-active {
    border: 0.5px solid #e3393c;
  }

  .item-select-img img {
    width: 100%;
  }

  .item-select-intro p {
    margin: 0px;
    padding: 5px;
  }

  .item-select-class {
    padding: 5px;
    margin-right: 8px;
    background-color: #f7f7f7;
    border: 0.5px solid #ccc;
    cursor: pointer;
  }

  .item-select-class:hover {
    border: 0.5px solid #e3393c;
  }

  .add-buy-car-box {
    width: 100%;
    margin-top: 15px;
    border-top: 1px dotted #ccc;
  }

  .add-buy-car {
    margin-top: 15px;
  }

  /******************商品图片及购买详情结束******************/
</style>
