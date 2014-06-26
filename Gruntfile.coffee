module.exports = (grunt) ->

  require('load-grunt-tasks')(grunt)

  appConfig =
    comp: 'bower_components'

  grunt.initConfig

    app: appConfig

    # SASS ======================
    sass:
      compile:
        files:
          'assets/stylesheets/style.css': '_source/sass/style.scss'

    # Coffee ====================
    coffee:
      options:
        join: true
      compile:
        files:
          'assets/javascripts/app.js' : [
            '_source/coffee/modules{,**/}*.coffee'
            '_source/coffee/application.coffee'
          ]

    # Uglify ====================
    uglify:
      dist:
        files:
          'assets/javascripts/app.js': 'assets/javascripts/app.js'

    # CSSMin ====================
    cssmin:
      dist:
        files:
          'assets/stylesheets/style.css': 'assets/stylesheets/style.css'

    imagemin:
      dist:
        files: [
          expand: true
          cwd: 'assets/images/'
          src: ['**/*.{png,jpg,gif}']
          dest: 'assets/images/'
        ]

    svgmin:
      dist:
        files: [
          expand: true
          cwd: 'assets/images/'
          src: ['**/*.svg']
          dest: 'assets/images/'
        ]

    # Watch
    watch:
      images:
        files: ['assets/images/{**/*}.{png,jpg,gif,svg}']
        tasks: ['imagemin']
      sass:
        files: ['_source/sass/{,**/}*.scss']
        tasks: ['sass', 'cssmin']

      coffee:
        files: ['_source/coffee/{,**/}*.coffee']
        tasks: ['coffee', 'uglify']

    grunt.registerTask 'default', [
      'sass'
      'coffee'
      'cssmin'
      'uglify'
      'imagemin'
      'svgmin'
      'watch'
    ]
