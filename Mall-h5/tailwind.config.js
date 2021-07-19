module.exports = {
  purge: ['./index.html', './src/**/*.{vue,js,ts,jsx,tsx}'],
  darkMode: false, // or 'media' or 'class'
  theme: {
    screens: {},
    extend: {
      animation: {
        shak: 'shak .4s infinite'
      },
      keyframes: {
        shak: {
          '0%, 100%': { transform: 'translateX(0)' },
          '50%': { transform: 'translateX(5px)' }
        }
      },
      boxShadow: {
        foot: '0 0 10px 0 hsl(0deg 6% 58% / 60%)'
      },
      height: {
        header: '46px'
      },
      margin: {
        header: '46px'
      },
      width: {
        34: '8.5rem'
      },
      lineHeight: {
        header: '46px'
      },
      scale: {
        25: '.25'
      },
      padding: {
        full: '100%'
      }
    }
  },
  variants: {
    extend: {}
  },
  plugins: []
}
