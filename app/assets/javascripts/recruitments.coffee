# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("#recruitment_address_zipcode").jpostal({
    postcode : [ "#recruitment_address_zipcode" ],
    address  : {
                  "#recruitment_prefecture" : "%3", 
                  "#recruitment_city"            : "%4%5", 
                  "#recruitment_street"          : "%6%7" 
                }
  })