defmodule PhoenixHelloWorldWeb.CommentController do
  use PhoenixHelloWorldWeb, :controller

  alias PhoenixHelloWorld.MyBlog

  def create(conn, %{"comment" => comment_params, "article_id" => article_id} = _params) do
    case MyBlog.create_comment(Map.merge(comment_params, %{"article_id" => article_id})) do
      {:ok, comment} ->
        conn
        |> put_flash(:info, "Comment created successfully.")
        |> redirect(to: ~p"/articles/#{comment.article_id}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end
end
