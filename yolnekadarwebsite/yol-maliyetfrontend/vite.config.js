import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";

// https://vite.dev/config/
export default defineConfig({
  plugins: [react()],

  server: {
    proxy: {
      "/turkiye-api": {
        target: "https://turkiyeapi.dev",
        changeOrigin: true,
        rewrite: (path) => path.replace(/^\/turkiye-api/, "/api/v1"),
      },
    },
  },
});
