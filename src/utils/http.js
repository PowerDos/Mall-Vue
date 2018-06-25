import axios from 'axios';

const http = axios.create({
  baseURL: '/api/v8',
  timeout: 5000
});

export default http;
