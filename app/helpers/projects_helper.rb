module ProjectsHelper
  def tag_input project,item_name,title,value
    raw "<div id='#{item_name}' class='span4'>
      <h5>
        #{title}
        <button id='#{item_name}-edit-icon' title='edit' class='edit-icon btn btn-primary btn-mini' >edit</button>
        <button id='#{item_name}-done-icon' title='done' class='done-icon btn btn-success btn-mini hide' href='/projects/#{project.id}/#{item_name}'>save</button>
      </h5>
      <div id='#{item_name}-tags-container' class='clearfix'></div>
      <input id='input-#{item_name}' type='text' name='#{item_name}-tags' value='#{value}' class='#{item_name}-tag-manager tagManager'/>
    </div>"
  end
end