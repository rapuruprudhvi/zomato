import "jquery"
import "jquery_ujs"
import "./jquery_ui"

$(document).ready(function(){
    $('#applyFilters').on('click', function(){
        var rating = $('input[name="ratingOption"]:checked').val();
        var sort = $('#sort').val();
        
        $('#loadingSpinner').show();
        
        var ratingFilter = "";
        if(rating){
           ratingFilter = "&rating=" + rating
        }
        var sortFilter = "?sort=popularity";
        if(sort){
            sortFilter = "?sort=" + sort
        } 
        window.location.href = "http://localhost:3000" + sortFilter + ratingFilter;   
    });
    $('input[name="sortOption"]').click(function() {
        var selectedValue = $(this).val(); 
        console.log("Selected value: " + selectedValue);
    });
});