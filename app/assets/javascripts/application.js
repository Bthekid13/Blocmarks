// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require_tree .

var blocmetrics = {}
  blocmetrics.report = function(eventName){
    // We create an event JSON object to send to the Blocmetrics analytics service.
    var event = { name: eventName };
    // # we initialize a new XMLHttpRequest() (AJAX request)
    var request = new XMLHttpRequest();
    // # We set the HTTP method to POST, the url of our events endpoint,
    // # and allow the request to run asynchronously.
    request.open("POST", "http://localhost:3000/api/events", true);
    // # We set the request Content-Type header to 'application/json.' Without that, our
    // # API::EventsController would not know to process the request as JSON     request.setRequestHeader('Content-Type', 'application/json');
    request.setRequestHeader('Content-Type', 'application/json');
    // # We send the request.
    request.send(JSON.stringify(event));
  };
