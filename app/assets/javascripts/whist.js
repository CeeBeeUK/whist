$(document).ready(function() {

    $(".player_name_select2").select2(
    		{
				  width:'250px',
    			maximumSelectionSize: 7,
          createSearchChoice:function(term, data) { 
            if ($(data).filter(function() { return this.text.localeCompare(term)===0; }).length===0) 
              {return {id:term, text:term};} 
          },
          multiple: true,
          ajax: {
            url: "/players/find",
            dataType: "json",
            results: function(data, page) {
              return { 
                results: $.map( data, function(person, i) { 
                  return { id: person.id, text: person.name } 
                } )
              }
            }
          }
    		}
    	);


    $(".P2").select2({ 
           minimumInputLength:1,
           allowClear: true, 
           "ajax": { 
             data:function (term, page) { 
               return { term:term, page:page }; 
             }, 
             dataType:"json", 
             quietMillis:100, 
             results: function (data, page) { 
               return {results: data.results}; 
             }, 
             url: 'players/find' 
           }, 
           id: function(object) { 
             return object.text; 
           }, 
           //Allow manually entered text in drop down. 
           createSearchChoice:function(term, data) { 
             if ( $(data).filter( function() { 
               return this.text.localeCompare(term)===0; 
             }).length===0) { 
               return {id:term, text:term}; 
             } 
           }, 
          }); 
});
