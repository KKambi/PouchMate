$('#big-select').on('change', function() {
  var category_id = $(this).val();
	alert('이건 a');

  $.ajax({
    url: "/posts/" + category_id + "/get_subcategories", 
    type: "GET",
    data: { "category_id": category_id },
    dataType: "script", 
    success: function(){
    	alert('s');
    },
    error: function(jqXHR){
    	alert(jqXHR.responseText);
    }
  });
});

$('#middle-select').on('change', function() {
  var category_id = $(this).val();
	alert('이건 b');

  $.ajax({
    url: "/posts/" + category_id + "/get_subcategories", 
    type: "GET",
    data: { "category_id": category_id },
    dataType: "script", 
    success: function(){
    	alert('s');
    },
    error: function(jqXHR){
    	alert(jqXHR.responseText);
    }
  });
});
