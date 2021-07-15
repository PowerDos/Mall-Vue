type Env = 'development' | 'testing' | 'production'

interface Url {
  base: string
}

type Urls = {
  [T in Env]: Url
}

const env: Env = process.env.NODE_ENV as Env

const DEV_URLS: Url = {
  base: '127.0.0.1:5000'
}

const TEST_URLS: Url = {
  base: '127.0.0.1:5500'
}

const PROD_URLS: Url = {
  base: '127.0.0.1:5555'
}

const URLS: Urls = {
  development: DEV_URLS,
  testing: TEST_URLS,
  production: PROD_URLS
}

export default URLS[env] || DEV_URLS
