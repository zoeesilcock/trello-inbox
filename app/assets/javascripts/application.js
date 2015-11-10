// DO NOT REQUIRE jQuery or jQuery-ujs in this file!
// DO NOT REQUIRE TREE!

// CRITICAL that generated/vendor-bundle must be BEFORE bootstrap-sprockets and turbolinks
// since it is exposing jQuery and jQuery-ujs
//= require i18n/translations
//= require react_on_rails

//= require generated/vendor-bundle
//= require generated/ideas-bundle

// bootstrap-sprockets depends on generated/vendor-bundle for jQuery.
//= require bootstrap-sprockets
