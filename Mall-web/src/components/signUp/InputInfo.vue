<template>
  <div class="info-form">
    <Form ref="formValidate" :model="formValidate" :rules="ruleValidate" :label-width="80">
      <FormItem label="用户名" prop="name">
        <i-input v-model="formValidate.name" clearable size="large" placeholder="请输入你的姓名"></i-input>
      </FormItem>
      <FormItem label="邮箱" prop="mail">
        <i-input v-model="formValidate.mail" clearable size="large" placeholder="请输入你的邮箱"></i-input>
      </FormItem>
      <FormItem label="密码" prop="password">
        <i-input type="password" v-model="formValidate.password" clearable size="large" placeholder="请输入你的密码"></i-input>
      </FormItem>
      <FormItem label="确认密码" prop="repassword">
        <i-input type="password" v-model="formValidate.repassword" clearable size="large"
                 placeholder="请再次输入你的密码"></i-input>
      </FormItem>
      <Button type="error" size="large" long @click="handleSubmit('formValidate')">注册</Button>
    </Form>
  </div>
</template>

<script>
  import store from '@/vuex/store';
  import {mapMutations, mapActions} from 'vuex';
  // const qs = require('qs');
  export default {
    name: 'InputInfo',
    data() {
      const validatePassCheck = (rule, value, callback) => {
        if (value === '') {
          callback(new Error('请再次输入密码'));
        } else if (value !== this.formValidate.password) {
          callback(new Error('两次输入的密码不一样'));
        } else {
          callback();
        }
      };
      return {
        formValidate: {
          name: '',
          mail: '',
          password: '',
          repassword: ''
        },
        ruleValidate: {
          name: [
            {required: true, message: '用户名不能为空', trigger: 'blur'}
          ],
          mail: [
            {required: true, message: '邮箱不能为空', trigger: 'blur'},
            {type: 'email', message: '邮箱格式错误', trigger: 'blur'}
          ],
          password: [
            {required: true, message: '密码不能为空', trigger: 'blur'},
            {type: 'string', min: 6, message: '密码长度不能小于6', trigger: 'blur'}
          ],
          repassword: [
            {validator: validatePassCheck, trigger: 'blur'}
          ]
        }
      };
    },
    methods: {
      ...mapMutations(['SET_SIGN_UP_SETP']),
      ...mapActions(['addSignUpUser']),
      handleSubmit(name) {
        const father = this;
        this.$refs[name].validate((valid) => {
          if (valid) {
            // 调用注册会员的接口
            let that = this;
            let userDTOInput = {
              'username': this.formValidate.name,
              'email': this.formValidate.mail,
              'password': this.formValidate.password
            };
            let registerToken = sessionStorage.getItem('registerToken');
            this.$axios({
              method: 'post',
              url: '/member/register',
              data: JSON.stringify(userDTOInput),
              headers: {'Content-Type': 'application/json'},
              params: {
                'registerToken': registerToken,
                'mobile': that.$route.query.phone
              }
            })
              .then(function (response) {
                let responseCode = response.data.rtnCode.toString().trim();
                let responseMsg = response.data.msg.toString().trim();
                if (responseCode === '200') {
                  // 进入下一步骤,注册成功 添加到状态信息中去
                  that.$Message.success('注册成功');
                  const userinfo = {
                    username: that.formValidate.name,
                    password: that.formValidate.password,
                    mail: that.formValidate.mail,
                    phone: that.$route.query.phone
                  };
                  that.addSignUpUser(userinfo);
                  father.SET_SIGN_UP_SETP(2);
                  that.$router.push({path: '/SignUp/signUpDone'});
                } else if (responseCode === '500') {
                  that.$Message.error({
                    content: responseMsg,
                    duration: 6,
                    closable: true
                  });
                } else {
                  that.$Message.error({
                    content: '注册失败，请稍后重试！',
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
            this.$Message.error('注册失败');
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
