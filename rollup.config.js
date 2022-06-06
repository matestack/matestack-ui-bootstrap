import resolve from "@rollup/plugin-node-resolve"
import commonjs from "@rollup/plugin-commonjs"
import json from '@rollup/plugin-json';
import { terser } from "rollup-plugin-terser"
import scss from 'rollup-plugin-scss'

const terserOptions = {
  mangle: true,
  compress: true
}

export default [
  {
    input: "./lib/matestack/ui/bootstrap/index.js",
    external: ['matestack-ui-vuejs', 'bootstrap'],
    output: [
      {
        file: "./dist/matestack-ui-bootstrap.esm.js",
        format: "es",
        globals: { 'matestack-ui-vuejs': 'MatestackUiVueJs', bootstrap: 'bootstrap' },
      }
    ],
    plugins: [
      resolve({ browser: true }),
      json(),
      commonjs(),
      scss({ output: './dist/matestack-ui-bootstrap.css' }),
      terser(terserOptions)
    ]
  }
]
