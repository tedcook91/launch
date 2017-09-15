class Article
  attr_reader :id, :title, :url, :description

  def initialize(id, title, url, description)
    @id = id
    @title = title
    @url = url
    @description = description
  end
end
