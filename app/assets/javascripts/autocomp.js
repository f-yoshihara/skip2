var baseurl = "/typeahead?term=%QUERY"

var qst1 = { item: 'name' } 

var url1 = baseurl + "&" + jQuery.param(qst1)

var schoolNames = new Bloodhound({

  datumTokenizer: function(d) {return Bloodhound.tokenizers.whitespace([d.name]); }, //d.nameのnameはカラム名
  queryTokenizer: Bloodhound.tokenizers.whitespace,

  remote: {
            url: url1, wildcard: '%QUERY'
        }
});

schoolNames.initialize();

  jQuery( document ).ready(function( $ ) {
      $('#school_name.typeahead').typeahead({ 
      hint: true,
      highlight: true,
      minLength: 1
    },
    {
      name: 'name',       
      displayKey: 'name', 
      source: schoolNames.ttAdapter()
    }).on("typeahead:selected typeahead:autocomplete", function(e, datum) {
    return $('#school_name.typeahead').val(datum.name); 
  });
});