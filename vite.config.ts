import { defineConfig } from 'vite'

export default defineConfig({
  publicDir: false,
  build: {
    sourcemap: true,
    emptyOutDir: false,
    rollupOptions: {
      input: './app/javascript/application.js',
      output: {
        dir: './app/assets/builds',
        entryFileNames: '[name].js',
        assetFileNames: '[name][extname]',
        inlineDynamicImports: true
      }
    }
  }
})
