$(document).ready(function (){
   $(".follow").on('click', function() {
       console.log("Clicked")
        Rails.ajax({
           url: "/follow/" + this.parentElement.id,
            type: "GET",
            success: function (r) {

            },
            error: function (){
               console.log("Failed")
            }
        });
    });
});