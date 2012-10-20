Qed.ProjectPost = function(){
    this.init = function(){
        var converter = Markdown.getSanitizingConverter();
        var options = {
            helpButton: { handler: function(){window.open("http://stackoverflow.com/editing-help")} }
        };
        var editor = new Markdown.Editor(converter,'',options);
        editor.run();    
    }
}