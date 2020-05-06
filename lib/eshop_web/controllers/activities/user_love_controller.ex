defmodule EshopWeb.UserLoveController do
  use EshopWeb, :controller

  alias Eshop.Activities
  alias Eshop.Activities.UserLove

  action_fallback EshopWeb.FallbackController

  def index(conn, _params) do
    user_loves = Activities.list_user_loves()
    render(conn, "index.json", user_loves: user_loves)
  end

  def create(conn, %{"user_love" => user_love_params}) do
    with {:ok, %UserLove{} = user_love} <- Activities.create_user_love(user_love_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_love_path(conn, :show, user_love))
      |> render("show.json", user_love: user_love)
    end
  end

  def show(conn, %{"id" => id}) do
    user_love = Activities.get_user_love!(id)
    render(conn, "show.json", user_love: user_love)
  end

  def update(conn, %{"id" => id, "user_love" => user_love_params}) do
    user_love = Activities.get_user_love!(id)

    with {:ok, %UserLove{} = user_love} <- Activities.update_user_love(user_love, user_love_params) do
      render(conn, "show.json", user_love: user_love)
    end
  end

  def delete(conn, %{"id" => id}) do
    user_love = Activities.get_user_love!(id)

    with {:ok, %UserLove{}} <- Activities.delete_user_love(user_love) do
      send_resp(conn, :no_content, "")
    end
  end
end
