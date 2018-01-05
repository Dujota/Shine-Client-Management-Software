import { Component } from "@angular/core";
import { Http      } from "@angular/http";


var CustomerSearchComponent = Component({
  selector: "shine-customer-search",
  template: '\
<header> \
  <h1 class="h2">Customer Search</h1> \
</header> \
<section class="search-form"> \
  <form> \
    <label for="keywords" class="sr-only">Keywords></label> \
    <input type="text" id="keywords" name="keywords" \
           placeholder="First Name, Last Name, or Email Address"\
           bindon-ngModel="keywords" \
           on-ngModelChange="search($event)" \
           class="form-control input-lg">\
  </form> \
</section> \
<section class="search-results" *ngIf="customers"> \
  <header> \
    <h1 class="h3">Results</h1> \
  </header> \
  <ol class="list-group"> \
    <li *ngFor="let customer of customers" \
      class="list-group-item clearfix"> \
      <h3 class="pull-right"> \
        <small class="text-uppercase">Joined</small> \
        {{customer.created_at}} \
      </h3> \
      <h2 class="h3"> \
        {{customer.first_name}} {{customer.last_name}} \
        <small>{{customer.username}}</small> \
      </h2> \
      <h4>{{customer.email}}</h4> \
    </li> \
  </ol> \
</section> \
  '
}).Class({
  constructor: [
    Http,
    function(http) {
    this.customers  = null;
    this.http       = http;
    this.keywords   = "";
    }
  ],
  search: function($event) {
  var self = this; // saving this (search) into local variable so we can refer to the same thing throughout the code as "this" will change depending where we are.
  self.keywords = $event
  if (self.keywords.length < 3) {
    return;
  }
  self.http.get(
    "/customers.json?keywords=" + self.keywords // this is the url to our rails controller with keywords in params
  ).subscribe( // observable RxJS wait for http to finish then run functions in the subscribe
    function(response) {
      self.customers = response.json().customers; // extracts results from response and sets it to customers
    },
    function(response) {
      window.alert(response); //error handling in case the http request fails
    }
  );
  }
});

export { CustomerSearchComponent };
