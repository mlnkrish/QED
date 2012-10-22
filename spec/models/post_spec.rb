require "spec_helper"

describe "posts" do 
  describe "post creation" do
    it "should create a new post" do
      post = Post.create "title","im post text", ["t1","t2"], "12233-3344"

      loaded_post = Post.find_by_id post.id

      loaded_post.title.should == "title"
      loaded_post.text.should == "im post text"
      loaded_post.tags.should =~ ["t1","t2"]
      loaded_post.project_id.should == "12233-3344"
    end

    it "should be edit a post" do
      post = Post.create "title","im post text", ["t1","t2"], "12233-3344"

      loaded_post = Post.find_by_id post.id
      loaded_post.update "title","text",["t5","t6"]
      loaded_post.title.should == "title"
      loaded_post.text.should == "text"
      loaded_post.tags.should =~ ["t5","t6"]

      loaded_post2 = Post.find_by_id post.id
      loaded_post2.title.should == "title"
      loaded_post2.text.should == "text"
      loaded_post2.tags.should =~ ["t5","t6"]
    end
  end  
end