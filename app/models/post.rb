class Post
  attr_reader :id,:text,:title,:tags,:project_id

  def initialize params
    @id = params[:id]
    @title = params[:title]
    @text = params[:text]
    @tags = params[:tags]
    @project_id = params[:project_id]
  end

  def self.create(title,text,tags,project_id)
    id = SecureRandom.uuid
    $redis.hmset "posts:#{id}","id","#{id}","title","#{title}","text","#{text}",:project_id,"#{project_id}"
    $redis.sadd "posts:#{id}:tags",tags.map {|t| t.strip.downcase} unless tags.empty?
    Post.new({:id => id,:text => text,:tags => tags,:title => title, :project_id => project_id})
  end

  def self.find_by_id(id)
    post = nil
    if $redis.exists "posts:#{id}"
      id,text,title,project_id = $redis.hmget "posts:#{id}","id","text","title","project_id"
      tags = $redis.smembers "posts:#{id}:tags"
      post = Post.new({:id=> id, :text=>text, :tags => tags, :title => title, :project_id => project_id})
    end
    post
  end

  def update(title,text,tags)
    $redis.hmset "posts:#{@id}","title","#{title}","text","#{text}"
    $redis.del "posts:#{@id}:tags"
    $redis.sadd "posts:#{@id}:tags",tags.map {|t| t.strip.downcase} unless tags.empty?
    @title = title
    @text = text
    @tags = tags
  end
end