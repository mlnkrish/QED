$(document).ready(
	function () {
  	$('#project-nav a').click(function (e) {
  		e.preventDefault();
  		$(this).tab('show');
		})

    $(".tagManager").each(function(){
      $(this).tagsManager({
        typeahead: true,
        tagCloseIcon: '<i class="icon-remove-sign"></i>'
      }).typeahead({
        source: []
      });  
    });
    

    $(".edit-icon").click(function(){
      var context = $(this).attr("id").split("-")[0];
      $("#input-"+context).show();
      $("#input-"+context).focus();
      $("#"+context+" .myTagRemover").show();
      $("#"+context+"-edit-icon").hide();
      $("#"+context+"-done-icon").show();
      return false;
    });

    $(".done-icon").click(function(){
      var context = $(this).attr("id").split("-")[0];
      var updateUrl = $(this).attr("href");
      var dataToUpdate = $("#input-"+context).data("tlis").join(",");
      
      $.ajax({
        url : updateUrl,
        data : "data="+encodeURIComponent(dataToUpdate),
        type : "PUT",
        success : function(){
          $("#input-"+context).hide();    
          $("#"+context+" .myTagRemover").hide();
          $("#"+context+"-done-icon").hide();
          $("#"+context+"-edit-icon").show();
        },
        error : function(){
          alert("ERROR HAPPENED");
        }
      });

      return false;
    });

    $(".myTagRemover").hide();
    $(".tagManager").hide();

})
