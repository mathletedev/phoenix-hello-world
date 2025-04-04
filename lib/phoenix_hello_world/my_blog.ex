defmodule PhoenixHelloWorld.MyBlog do
  import Ecto.Query, warn: false

  alias PhoenixHelloWorld.Repo
  alias PhoenixHelloWorld.MyBlog.Article

  def list_articles() do
    Repo.all(Article)
  end
end
