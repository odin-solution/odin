module.exports = (grunt) ->
    (require 'load-grunt-tasks') grunt
    (require 'time-grunt') grunt
    grunt.initConfig
        clean:
            all: ['dist']
        webfont:
            options:
                font: 'yup'
                engine: 'node'
                relativeFontPath: './dist/'
                htmlDemo: true
                fontHeight: 240 # This is important
                types: 'eot,woff2,woff,ttf,svg'.split(',')
            iconfont:
                src: 'svgicons/*.svg'
                dest: 'dist'
                destCss: 'dist'
    grunt.registerTask 'default', ['clean', 'webfont']