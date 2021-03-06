// Karma configuration
// Generated on Fri Mar 02 2018 10:46:21 GMT+0000 (GMT)

module.exports = function(config) {
  config.set({
    // base path that will be used to resolve all patterns (eg. files, exclude)
    basePath: '../../',

    // frameworks to use
    // available frameworks: https://npmjs.org/browse/keyword/karma-adapter
    frameworks: ['mocha', 'requirejs', 'chai', 'sinon', 'fixture', 'viewport'],

    // list of files / patterns to load in the browser
    files: [
      'spec/javascripts/test-main.js',
      {pattern: 'app/assets/javascripts/**/*.js', included: false},
      {pattern: 'bower_components/**/*.js', included: false},
      {pattern: 'spec/javascripts/tests/*_spec.js', included: false},
      {pattern: 'spec/javascripts/fixtures/*.html', included: true},
      {pattern: 'spec/javascripts/lib/*.js', included: true}
    ],

    // list of files / patterns to exclude
    exclude: [
      'app/assets/javascripts/application.js',
      'app/assets/javascripts/require_config.js.erb'
    ],

    // preprocess matching files before serving them to the browser
    // available preprocessors: https://npmjs.org/browse/keyword/karma-preprocessor
    preprocessors: {
     '**/*.html': ['html2js']
    },

    // test results reporter to use
    // available reporters: https://npmjs.org/browse/keyword/karma-reporter
    reporters: ['spec'],

    // web server port
    port: 9876,

    // enable / disable colors in the output (reporters and logs)
    colors: true,

    // level of logging
    // possible values: config.LOG_DISABLE || config.LOG_ERROR || config.LOG_WARN || config.LOG_INFO || config.LOG_DEBUG
    logLevel: config.LOG_INFO,

    // enable / disable watching file and executing tests whenever any file changes
    autoWatch: false,

    // start these browsers
    // available browser launchers: https://npmjs.org/browse/keyword/karma-launcher
    browsers: ['PhantomJS'],

    // Continuous Integration mode
    // if true, Karma captures browsers, runs the tests and exits
    singleRun: true,

    // Concurrency level
    // how many browser should be started simultaneous
    concurrency: Infinity,

    // Brakpoints
    viewport: {
      breakpoints: [
        {
          name: "tablet",
          size: {
            width: 720,
            height: 1024
          }
        }
      ]
    }
  })
}
