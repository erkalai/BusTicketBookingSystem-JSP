$(document).ready(function() {
	
    // Event listener for typing in the search input
    $('#source').on('keyup', function() {
        var query = $(this).val();

        // If query is empty, don't make an AJAX request
        if(query.length > 0) {  

            $.ajax({
                url: 'SearchServlet',   // Servlet that handles the search
                type: 'GET',
                data: { query: query },     // Send query as a parameter
                success: function(data) {

                    // Clear the existing dropdown options
                    $('#sourceDropdown').empty();

                    // Append new search results to the dropdown
                    if (data.length > 0) {
                    	
                        data.forEach(function(item) {
                        	 $('#sourceDropdown').append('<div class="dropdown-item" data-value="' + item + '">' + item + '</div>');
                        });
                        $('#sourceDropdown').show();
                    } else {
                        $('#sourceDropdown').append('<option>No results found</option>');
                        $('#sourceDropdown').show();
                    }
                },
                error: function() {
                    alert("An error occurred while fetching search results.");
                }
            });
        } else {
            // If the input is empty, reset the dropdown
            $('#sourceDropdown').empty().hide();
        }
    });
    
    // Handle the click event on dropdown items
    $('#sourceDropdown').on('click', '.dropdown-item', function() {
        // Set the value of the input field to the selected option
        var selectedValue = $(this).data('value');
        $('#source').val(selectedValue);

        // Hide the dropdown after selection
        $('#sourceDropdown').hide();
    });

    // Optional: Close the dropdown when clicking outside the input and dropdown
    $(document).on('click', function(e) {
        if (!$(e.target).closest('#source').length && !$(e.target).closest('#sourceDropdown').length) {
            $('#sourceDropdown').hide();
        }
    });
    
    
});

<!-- Destination Search DropDown -->



$(document).ready(function() {
    // Event listener for typing in the search input
    $('#destination').on('keyup', function() {
        var query = $(this).val();

        // If query is empty, don't make an AJAX request
        if(query.length > 0) {

            $.ajax({
                url: 'SearchServlet',   // Servlet that handles the search
                type: 'GET',
                data: { query: query },     // Send query as a parameter
                success: function(data) {

                    // Clear the existing dropdown options
                    $('#destinationDropdown').empty();

                    // Append new search results to the dropdown
                    if (data.length > 0) {
                    	
                        data.forEach(function(item) {
                        	 $('#destinationDropdown').append('<div class="dropdown-item" data-value="' + item + '">' + item + '</div>'); 
                           <!-- $('#dropdown').append('<option value="' + item + '">' + item + '</option>'); -->
                        });
                        $('#destinationDropdown').show();
                    } else {
                        $('#destinationDropdown').append('<option>No results found</option>');
                        $('#destinationDropdown').show();
                    }
                },
                error: function() {
                    alert("An error occurred while fetching search results.");
                }
            });
        } else {
            // If the input is empty, reset the dropdown
            $('#destinationDropdown').empty().hide();
        }
    });
    
    // Handle the click event on dropdown items
    $('#destinationDropdown').on('click', '.dropdown-item', function() {
        // Set the value of the input field to the selected option
        var selectedValue = $(this).data('value');
        $('#destination').val(selectedValue);
        // Hide the dropdown after selection
        $('#destinationDropdown').hide();
    });

    // Optional: Close the dropdown when clicking outside the input and dropdown
    $(document).on('click', function(e) {
        if (!$(e.target).closest('#destination').length && !$(e.target).closest('#destinationDropdown').length) {
            $('#destinationDropdown').hide();
        }
    });
    
    
});


 	