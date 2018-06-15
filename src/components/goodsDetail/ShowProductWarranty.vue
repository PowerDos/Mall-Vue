<template>
  <div>
    <div class="remarks-title">
      <span>售后保障</span>
    </div>
    <div class="item-protect-container">
      <div class="item-protect-box">
        <p class="item-protect-title-box">
          <Avatar style="background-color: #e4393c" icon="ribbon-a" />
          <span class="item-protect-title">卖家服务</span>
        </p>
        <p class="item-protect-detail">
          高品质敢承诺：7天无理由退货，30天免费换新，质量问题商家承担来回运费换新；如需发票，请在确认收货无误后联系商家开出。（注*发票不随货品一同发出）
        </p>
      </div>
      <div class="item-protect-box">
        <p class="item-protect-title-box">
          <Avatar style="background-color: #e4393c" icon="cash" />
          <span class="item-protect-title">平台承诺</span>
        </p>
        <p class="item-protect-detail">
          平台卖家销售并发货的商品，由平台卖家提供发票和相应的售后服务。请您放心购买！<br> 注：因厂家会在没有任何提前通知的情况下更改产品包装、产地或者一些附件，本司不能确保客户收到的货物与商城图片、产地、附件说明完全一致。只能确保为原厂正货！并且保证与当时市场上同样主流新品一致。若本商城没有及时更新，请大家谅解！
        </p>
      </div>
      <div class="item-protect-box">
        <p class="item-protect-title-box">
          <Avatar style="background-color: #e4393c" icon="locked" />
          <span class="item-protect-title">正品行货</span>
        </p>
        <p class="item-protect-detail">
          BIT商城向您保证所售商品均为正品行货，BIT自营商品开具机打发票或电子发票。
        </p>
      </div>
      <div class="item-protect-box">
        <p class="item-protect-title-box">
          <Avatar style="background-color: #e4393c" icon="settings" />
          <span class="item-protect-title">全国联保</span>
        </p>
        <p class="item-protect-detail">
          凭质保证书及BIT商城发票，可享受全国联保服务（奢侈品、钟表除外；奢侈品、钟表由BIT联系保修，享受法定三包售后服务），与您亲临商场选购的商品享受相同的质量保证。BIT商城还为您提供具有竞争力的商品价格和运费政策，请您放心购买！<br><br> 注：因厂家会在没有任何提前通知的情况下更改产品包装、产地或者一些附件，本司不能确保客户收到的货物与商城图片、产地、附件说明完全一致。只能确保为原厂正货！并且保证与当时市场上同样主流新品一致。若本商城没有及时更新，请大家谅解！
        </p>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'ShowProductWarranty'
};
</script>

<style scoped>
.remarks-title {
  padding-left: 15px;
  height: 36px;
  font-size: 16px;
  font-weight: bolder;
  line-height: 36px;
  color: #666666;
  background-color: #F7F7F7;
}
.item-protect-container {
  padding: 15px;
}
.item-protect-box {
  margin-bottom: 30px;
}
.item-protect-title-box {
  display: flex;
  align-items: center;
}
.item-protect-title {
  padding-left: 15px;
  font-size: 20px;
  font-weight: bolder;
  color: #e4393c;
}
.item-protect-detail {
  padding-top: 5px;
  padding-left: 46px;
  font-size: 14px;
  color: #999;
}
</style>
