document.addEventListener("turbolinks:load",function() {
	$input = $("[data-behavior='autocomplete']")

    var options = {
    	getValue: "title",
    	url: function(phrase){
    		return "/search.json?search=" + phrase;
    	},
    	categories: [
    	{
    		listLocation: "items",
    		header:"----items----"
    	}
    	]
    	list: {
    		onChooseEvent: function(){
    			val url = $input.getSeclectedItemData().url
    			console.log(url)

    		}
    	}
    }
    $input.easyAutocomplete(options)
});