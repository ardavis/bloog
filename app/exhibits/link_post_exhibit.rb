class LinkPostExhibit < Exhibit
  def render_body
    @context.render(partial: "/posts/link_body", locals: { post: self })
  end

  def self.applicable_to?(object)
    object.is_a?(Post)
  end
end
