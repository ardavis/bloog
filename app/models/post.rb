class Post
  attr_accessor :title, :body

  def publish
    blog.add_entry(self)
  end
end
