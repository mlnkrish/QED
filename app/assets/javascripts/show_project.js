$(document).ready(
	function () {
  	$('#project-nav a').click(function (e) {
  		e.preventDefault();
  		$(this).tab('show');
		})

    $(".language-tag-manager").tagsManager({
      tagsContainer: $("#language-tags-container"),
      typeahead: true,
      tagCloseIcon: '<i class="icon-remove-sign"></i>'
    }).typeahead({
      source: []
    });

    $(".framework-tag-manager").tagsManager({
      tagsContainer: $("#frameworks-tags-container"),
      typeahead: true,
      tagCloseIcon: '<i class="icon-remove-sign"></i>'
    }).typeahead({
      source: []
    });

    $(".edit-icon").click(function(){
      var context = $(this).attr("id").split("-")[0];
      $("#input-"+context).show();
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
        data : "languages="+dataToUpdate,
        type : "POST",
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
