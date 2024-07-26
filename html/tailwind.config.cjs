/** @type {import('tailwindcss').Config} */
export default {
  content: ["./index.html", "./src/**/*.{svelte,js,ts,jsx,tsx}"],
  theme: {
    extend: {
      colors: {
        "primary": "#fd9800",
        "dark": "#1c1e21"
      },
    },
  },
  plugins: [],
};