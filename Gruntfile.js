module.exports = function(grunt) {
    require('jit-grunt')(grunt);
    grunt.initConfig({
        'less': {
            'development': {
                'options': {
                    'compress': true,
                    'yuicompress': true,
                    'optimization': 2
                },
                'files': {
                    'assets/css/styles.css': 'assets/less/styles.less'
                }
            }
        },
        'uglify': {
            'compressed': {
                'files': [{
                    'expand': true,
                    'src': '**/*.js',
                    'dest': 'assets/js',
                    'cwd': 'assets/js',
                    'ext': '.min.js'
                }],
                'options': {
                    'sourceMap': true
                }
            }
        },
        'watch': {
            'less': {
                'files': ['assets/less/**/*.less'],
                'tasks': ['build:less'],
                'options': {
                    'nospawn': true
                }
            },
            'js': {
                'files': ['assets/js/**/*.js'],
                'tasks': ['build:js'],
                'options': {
                    'nospawn': true
                }
            }
        },
        'notify': {
            'less': {
                'options': {
                    'title': 'Task Complete (LESS)',
                    'message': 'LESS compiled and minified'
                },
            },
            'js': {
                'options': {
                    'title': 'Task Complete (JS)',
                    'message': 'JS compiled and minified'
                },
            }
        }
    });
    grunt.loadNpmTasks('grunt-notify');
    grunt.registerTask('default', ['watch']);
    grunt.registerTask('watch:less', ['watch:less']);
    grunt.registerTask('watch:js', ['watch:js']);
    grunt.registerTask('build:less', ['less', 'notify:less']);
    grunt.registerTask('build:js', ['uglify', 'notify:js']);
};