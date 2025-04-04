defmodule PhoenixHelloWorldWeb.ArticleController do
  use PhoenixHelloWorldWeb, :controller

  alias PhoenixHelloWorld.MyBlog

  def index(conn, _params) do
    articles = MyBlog.list_articles()
    render(conn, :index, articles: articles)
  end
end
