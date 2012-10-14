$(document).ready(
	function () {
  	$('#project-nav a').click(function (e) {
  		e.preventDefault();
  		$(this).tab('show');
		})

    $(".language-tag-manager").tagsManager({
      prefilled: [],
      tagsContainer: $("#language-tags-container"),
      typeahead: true,
      tagCloseIcon: '<i class="icon-remove-sign"></i>'
    }).typeahead({
      source: []
    });

    $(".framework-tag-manager").tagsManager({
      prefilled: [],
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
      $("#input-"+context).hide();
      $("#"+context+" .myTagRemover").hide();
      $("#"+context+"-done-icon").hide();
      $("#"+context+"-edit-icon").show();
      return false;
    });

    $(".myTagRemover").hide()
    $(".tagManager").hide()

})
