var allTestFiles = []
var TEST_REGEXP = /(spec|test)\.js$/i

// Get a list of all the test files to include
Object.keys(window.__karma__.files).forEach(function (file) {
  if (TEST_REGEXP.test(file)) {
    // Normalize paths to RequireJS module names.
    // If you require sub-dependencies of test files to be loaded as-is (requiring file extension)
    // then do not normalize the paths
    var normalizedTestModule = file.replace(/^\/base\/|\.js$/g, '')
    allTestFiles.push(normalizedTestModule)
  }
})

require.config({
  // Karma serves files under /base, which is the basePath from your config file
  baseUrl: '/base',

  // dynamically load all test files
  deps: allTestFiles,

  // we have to kickoff jasmine, as it is asynchronous
  callback: window.__karma__.start,

  paths: {
    // External dependancies
    jquery: 'bower_components/jquery/dist/jquery',
    eventsWithPromises: 'bower_components/eventsWithPromises/src/eventsWithPromises',
    jqueryThrottleDebounce: 'bower_components/jqueryThrottleDebounce/jquery.ba-throttle-debounce',
    rsvp: 'bower_components/rsvp/rsvp',
    modernizr: 'spec/javascripts/lib/modernizr-custom',

    // Dough components
    mediaQueries: 'bower_components/dough/assets/js/lib/mediaQueries',
    utilities: 'bower_components/dough/assets/js/lib/utilities',
    featureDetect: 'bower_components/dough/assets/js/lib/featureDetect',
    DoughBaseComponent: 'bower_components/dough/assets/js/components/DoughBaseComponent',

    // Components
    Nav: 'app/assets/javascripts/components/Nav',
    Nav_A11Y: 'app/assets/javascripts/components/Nav_A11Y',
    Tooltip: 'app/assets/javascripts/components/Tooltip',
    Header: 'app/assets/javascripts/components/Header'
  }
})
