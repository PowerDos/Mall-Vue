import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import babel from 'vite-babel-plugin'
import eslintPlugin from 'vite-plugin-eslint'
import { resolve } from 'path'

export default defineConfig({
  base: './',
  plugins: [eslintPlugin(), babel(), vue()],
  build: {
    minify: 'esbuild'
  },
  resolve: {
    alias: {
      '@': resolve(__dirname, 'src')
    }
  },
  css: {
    preprocessorOptions: {
      scss: {
        additionalData: `@import "@/assets/css/global.scss";`
      }
    }
  },
  server: {
    port: 8888,
    open: true
  }
})
