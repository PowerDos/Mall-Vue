<template>
  <div>
    <div class="address-box" v-for="(item, index) in getAddress" :key="index">
      <div class="address-header">
        <span>{{item.name}}</span>
        <div class="address-action">
          <span @click="edit(index)"><Icon type="edit"></Icon> 修改</span>
          <span @click="del(index)"><Icon type="trash-a"></Icon> 删除</span>
        </div>
      </div>
      <div class="address-content">
        <p><span class="address-content-title"> 收 货 人 :</span> {{item.name}}</p>
        <p><span class="address-content-title">收货地区:</span> {{item.province}} {{item.city}} {{item.area}}
        </p>
        <p><span class="address-content-title">手机号码:</span> {{item.phone}}</p>
        <p><span class="address-content-title">收货地址:</span> {{item.address}}</p>
        <p><span class="address-content-title">邮政编码:</span> {{item.postalcode}}</p>
      </div>
    </div>
    <Modal v-model="modal" width="530">
        <p slot="header">
          <Icon type="edit"></Icon>
          <span>修改地址</span>
        </p>
        <div>
            <Form :model="formData" label-position="left" :label-width="100" :rules="ruleInline">
              <FormItem label="收件人" prop="name">
                <i-input v-model="formData.name" size="large"></i-input>
              </FormItem>
              <FormItem label="收件地区" prop="address">
                <Distpicker :province="formData.province" :city="formData.city" :area="formData.area" @province="getProvince" @city="getCity" @area="getArea"></Distpicker>
              </FormItem>
              <FormItem label="收件地址" prop="address">
                <i-input v-model="formData.address" size="large"></i-input>
              </FormItem>
              <FormItem label="手机号码" prop="phone">
                <i-input v-model="formData.phone" size="large"></i-input>
              </FormItem>
              <FormItem label="邮政编码" prop="postalcode">
                <i-input v-model="formData.postalcode" size="large"></i-input>
              </FormItem>
            </Form>
        </div>
        <div slot="footer">
            <Button type="primary" size="large" long @click="editAction()">修改</Button>
        </div>
    </Modal>
  </div>
</template>

<script>
import store from '@/vuex/store';
import { mapActions, mapGetters } from 'vuex';
import Distpicker from 'v-distpicker';
export default {
  name: 'MyAddress',
  data () {
    return {
      modal: false,
      formData: {
        address_id: '',
        name: '',
        address: '',
        phone: '',
        postalcode: '',
        province: '广东省',
        city: '广州市',
        area: '天河区'
      },
      ruleInline: {
        name: [
          { required: true, message: '请输入姓名', trigger: 'blur' }
        ],
        address: [
          { required: true, message: '请输入地址', trigger: 'blur' }
        ],
        postalcode: [
          { required: true, message: '请输入邮政编码', trigger: 'blur' }
        ],
        phone: [
          { required: true, message: '手机号不能为空', trigger: 'blur' },
          { type: 'string', pattern: /^1[3|4|5|7|8][0-9]{9}$/, message: '手机号格式出错', trigger: 'blur' }
        ]
      }
    };
  },
  created () {
    this.loadAddress();
  },
  computed: {
    ...mapGetters(['getAddress'])
  },
  methods: {
    ...mapActions(['loadAddress', 'delAddress', 'editAddress']),
    getProvince (data) {
      this.formData.province = data.value;
    },
    getCity (data) {
      this.formData.city = data.value;
    },
    getArea (data) {
      this.formData.area = data.value;
    },
    edit (index) {
      this.modal = true;
      this.formData.address_id = this.getAddress[index].address_id;
      this.formData.province = this.getAddress[index].province;
      this.formData.city = this.getAddress[index].city;
      this.formData.area = this.getAddress[index].area;
      this.formData.address = this.getAddress[index].address;
      this.formData.name = this.getAddress[index].name;
      this.formData.phone = this.getAddress[index].phone;
      this.formData.postalcode = this.getAddress[index].postalcode;
    },
    editAction () {
      this.editAddress(this.formData).then(result => {
        if (result) {
          this.$Message.success(`修改成功`);
          this.loadAddress();
        } else {
          this.$Message.error('修改失败');
        }
        this.modal = false;
      });
    },
    del (index) {
      this.$Modal.confirm({
        title: '信息提醒',
        content: '你确定删除这个收货地址',
        onOk: () => {
          console.log(this.getAddress[index]);
          this.delAddress(this.getAddress[index]).then(result => {
            if (result) {
              this.$Message.success(`删除成功`);
              this.loadAddress();
            } else {
              this.$Message.error('删除失败');
            }
          });
        },
        onCancel: () => {
          this.$Message.info('取消删除');
        }
      });
    }
  },
  components: {
    Distpicker
  },
  store
};
</script>

<style scoped>
.address-box {
  padding: 15px;
  margin: 15px;
  border-radius: 5px;
  box-shadow: 0px 0px 5px #ccc;
}
.address-header {
  height: 35px;
  display: flex;
  justify-content: space-between;
  color: #232323;
  font-size: 18px;
}
.address-content {
  font-size: 14px;
}
.address-content-title {
  color: #999;
}
.address-action span{
  margin-left: 15px;
  font-size: 14px;
  color: #2d8cf0;
  cursor: pointer;
}
</style>
