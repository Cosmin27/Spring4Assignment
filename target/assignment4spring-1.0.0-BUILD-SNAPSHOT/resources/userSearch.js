$(document).ready(function() {
	$("#searchResults").on('click', '.btn-follow-user', function(event) {
		console.log("here " + event.currentTarget.id);
	});
	
	$("#userSearch").keyup(function() {
		var urlString = "http://localhost:8080/assignment4spring/search/";
		if($("#userSearch").val().length == 0) {
			$("#searchResults").empty();
			$.ajax({
				url : urlString,
				dataType : 'json'
			}).then(function(data) {
				for(var index = 0; index < data.length; index++) {
					var hasFriend = false;
					var friends = data[index].friends;
					for(var friendIndex = 0; index < friends.length; friendIndex++) {
						console.log(friends[friendIndex].username + " " + data[index].username);
						if(friends[friendIndex].username == data[index].username) {
							hasFriend = true;
						}
					}
					if(hasFriend) {
						
					}
					else {
						$("#searchResults").append("<p><span class=\"bold_font\">" + data[index].username + "</span> <input name=\"adduser\" type=\"button\" id=\"" + data[index].username + "\" value=\"Follow\" class=\"btn btn-follow-user\" /></p>");
					}
				}
			});
			
		}
		else {
			console.log($("#userSearch").val());
			
			urlString += $("#userSearch").val();
			
			$.ajax({
				url : urlString,
				dataType : 'json'
			})
			.then(
					function(data) {
						$("#searchResults").empty();
						if(data.length == 0){
							$("#searchResults").append("<p>Search returned no results.</p>");
						}
						else {
							$("#searchResults").append("<p>Search results:</p>");
							for(var index = 0; index < data.length; index++) {
								var hasFriend = false;
								var friends = data[index].friends;
								for(var friendIndex = 0; index < friends.length; friendIndex++) {
									console.log(friends[friendIndex].username + " " + data[index].username);
									if(friends[friendIndex].username == data[index].username) {
										hasFriend = true;
									}
								}
								if(hasFriend) {
									
								}
								else {
									$("#searchResults").append("<p><span class=\"bold_font\">" + data[index].username + "</span> <input name=\"adduser\" type=\"button\" id=\"" + data[index].username + "\" value=\"Follow\" class=\"btn btn-follow-user\" /></p>");
								}
							}
						}
					});
		}
	});
	
	
});

function loadInitialList() {
	var urlString = "http://localhost:8080/assignment4spring/search/";
	$("#searchResults").empty();
	$.ajax({
		url : urlString,
		dataType : 'json'
	}).then(function(data) {
		console.log(data);
		for(var index = 0; index < data.length; index++) {
			var hasFriend = false;
			var friends = data[index].friends;
			for(var friendIndex = 0; index < friends.length; friendIndex++) {
				console.log(friends[friendIndex].username + " " + data[index].username);
				if(friends[friendIndex].username == data[index].username) {
					hasFriend = true;
				}
			}
			if(hasFriend) {
				
			}
			else {
				$("#searchResults").append("<p><span class=\"bold_font\">" + data[index].username + "</span> <input name=\"adduser\" type=\"button\" id=\"" + data[index].username + "\" value=\"Follow\" class=\"btn btn-follow-user\" /></p>");
			}
		}
	});
}