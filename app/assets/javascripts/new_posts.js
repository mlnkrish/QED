Qed.NewPost = function(){
    this.init = function(){
        var converter = Markdown.getSanitizingConverter();
        var options = {
            helpButton: { handler: function(){window.open("http://stackoverflow.com/editing-help")} }
        };
        var editor = new Markdown.Editor(converter,'',options);
        editor.run(); 

        $("#post-tags-input").tagsManager({
          typeahead: true,
          tagCloseIcon: '<i class="icon-remove-sign"></i>',
          hiddenTagListName: 'post_tags'
        }).typeahead({
          source: []
        });    
    }
}