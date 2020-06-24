<template>
  <div class="info-form">
    <Form ref="formValidate" :model="formValidate" :label-width="80" :rules="ruleValidate">
      <FormItem label="手机号" prop="phone">
          <i-input v-model="formValidate.phone" clearable size="large"  placeholder="请输入手机号"></i-input>
      </FormItem>
      <FormItem label="验证码" prop="checkNum">
          <i-input v-model="formValidate.checkNum" size="large"  placeholder="请输入验证码">
            <Button slot="append" @click="getcheckNum">获取验证码</Button>
          </i-input>
      </FormItem>
      <Button type="error" size="large" long @click="handleSubmit('formValidate')">验证手机号</Button>
    </Form>
  </div>
</template>

<script>
import store from '@/vuex/store';
import { mapMutations } from 'vuex';
const qs = require('qs');
export default {
  name: 'CheckPhone',
  data () {
    return {
      formValidate: {
        phone: '',
        checkNum: ''
      },
      ruleValidate: {
        phone: [
          { required: true, message: '手机号不能为空', trigger: 'blur' },
          { type: 'string', pattern: /^1[3|4|5|7|8][0-9]{9}$/, message: '手机号格式出错', trigger: 'blur' }
        ],
        checkNum: [
          { required: true, message: '必须填写验证码', trigger: 'blur' },
          { type: 'string', min: 5, max: 5, message: '验证码长度错误', trigger: 'blur' }
        ]
      }
    };
  },
  methods: {
    ...mapMutations(['SET_SIGN_UP_SETP']),
    getcheckNum () {
      if (this.formValidate.phone.length === 11) {
        let that = this;
        this.$axios.post('/member/sendSMS', qs.stringify({'mobile': this.formValidate.phone}))
          .then(function (response) {
            let responseCode = response.data.rtnCode.toString().trim();
            let responseMsg = response.data.msg.toString().trim();
            if (responseCode === '200' && responseMsg === 'success') {
              that.$Message.success({
                content: '验证码已发送，请注意查收',
                duration: 6,
                closable: true
              });
            } else if (responseCode === '500' && responseMsg === '该手机号已被注册') {
              that.$Message.error({
                content: '该手机号已被注册！',
                duration: 6,
                closable: true
              });
            } else {
              that.$Message.success({
                content: '发送失败，请稍后尝试',
                duration: 6,
                closable: true
              });
            }
          })
          .catch(function () {
            that.$Message.success({
              content: '网络超时，请稍后尝试',
              duration: 6,
              closable: true
            });
          });
      } else {
        this.$Message.error({
          content: '请输入正确的手机号',
          duration: 6,
          closable: true
        });
      }
    },
    handleSubmit (name) { // 提交验证
      this.$refs[name].validate((valid) => {
        if (valid) {
          let that = this;
          this.$axios.post('/member/verifyMobile', qs.stringify({'mobile': this.formValidate.phone,
            'registerCode': this.formValidate.checkNum}))
            .then(function (response) {
              let responseCode = response.data.rtnCode.toString().trim();
              let responseMsg = response.data.msg.toString().trim();
              if (responseCode === '200') {
                // 进入下一步骤,读取response中的Token并将它存储到sessionStorage中去
                let token = response.data.data.Token;
                sessionStorage.setItem('registerToken', token);
                that.$router.push({ path: '/SignUp/inputInfo', query: { phone: that.formValidate.phone } });
                that.SET_SIGN_UP_SETP(1);
              } else {
                that.$Message.error({
                  content: responseMsg,
                  duration: 6,
                  closable: true
                });
              }
            })
            .catch(function () {
              that.$Message.error({
                content: '系统错误，请稍后尝试',
                duration: 6,
                closable: true
              });
            });
        } else {
          this.$Message.error({
            content: '验证码长度不正确！',
            duration: 6,
            closable: true
          });
        }
      });
    }
  },
  store
};
</script>

<style scoped>
.info-form {
  width: 90% !important;
}
</style>
