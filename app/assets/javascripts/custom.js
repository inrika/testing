document.addEventListener("turbolinks:load", function() {


    $("#next").on ("click",function(){
      $("#create").submit();
      console.log("submit");

    })

})
