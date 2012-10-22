Qed.ShowPost = function(){
  
  this.init = function(){
    var converter = Markdown.getSanitizingConverter();

    var html = converter.makeHtml($("#post-text").val())
    $("#content").html(html);

    $("#post-tags").tagsManager({
      typeahead: true,
      tagCloseIcon: '<i class="icon-remove-sign"></i>',
      hiddenTagListName: 'post_tags'
    })   

    $(".myTagRemover").hide();
    $("#post-tags").hide();
  }
}