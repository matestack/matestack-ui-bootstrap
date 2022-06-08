import resolve from "@rollup/plugin-node-resolve"
import commonjs from "@rollup/plugin-commonjs"
import json from '@rollup/plugin-json';
import { terser } from "rollup-plugin-terser"
import scss from 'rollup-plugin-scss'
import { writeFileSync } from 'fs'

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
      scss({ output: function (styles, styleNodes) {
        writeFileSync('./dist/stylesheets/matestack-ui-bootstrap.css', styles)
      }}),
      terser(terserOptions)
    ]
  }
]
