defmodule EshopWeb.TypeCommentController do
  use EshopWeb, :controller

  alias Eshop.Activities
  alias Eshop.Activities.TypeComment

  action_fallback EshopWeb.FallbackController

  def index(conn, _params) do
    type_comments = Activities.list_type_comments()
    render(conn, "index.json", type_comments: type_comments)
  end

  def create(conn, %{"type_comment" => type_comment_params}) do
    with {:ok, %TypeComment{} = type_comment} <-
           Activities.create_type_comment(type_comment_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.type_comment_path(conn, :show, type_comment))
      |> render("show.json", type_comment: type_comment)
    end
  end

  def show(conn, %{"id" => id}) do
    type_comment = Activities.get_type_comment!(id)
    render(conn, "show.json", type_comment: type_comment)
  end

  def update(conn, %{"id" => id, "type_comment" => type_comment_params}) do
    type_comment = Activities.get_type_comment!(id)

    with {:ok, %TypeComment{} = type_comment} <-
           Activities.update_type_comment(type_comment, type_comment_params) do
      render(conn, "show.json", type_comment: type_comment)
    end
  end

  def delete(conn, %{"id" => id}) do
    type_comment = Activities.get_type_comment!(id)

    with {:ok, %TypeComment{}} <- Activities.delete_type_comment(type_comment) do
      send_resp(conn, :no_content, "")
    end
  end
end
