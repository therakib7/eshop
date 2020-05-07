defmodule EshopWeb.UpdateHistoryController do
  use EshopWeb, :controller

  alias Eshop.Users
  alias Eshop.Users.UpdateHistory

  action_fallback EshopWeb.FallbackController

  def index(conn, _params) do
    update_histories = Users.list_update_histories()
    render(conn, "index.json", update_histories: update_histories)
  end

  def create(conn, %{"update_history" => update_history_params}) do
    with {:ok, %UpdateHistory{} = update_history} <- Users.create_update_history(update_history_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.update_history_path(conn, :show, update_history))
      |> render("show.json", update_history: update_history)
    end
  end

  def show(conn, %{"id" => id}) do
    update_history = Users.get_update_history!(id)
    render(conn, "show.json", update_history: update_history)
  end

  def update(conn, %{"id" => id, "update_history" => update_history_params}) do
    update_history = Users.get_update_history!(id)

    with {:ok, %UpdateHistory{} = update_history} <- Users.update_update_history(update_history, update_history_params) do
      render(conn, "show.json", update_history: update_history)
    end
  end

  def delete(conn, %{"id" => id}) do
    update_history = Users.get_update_history!(id)

    with {:ok, %UpdateHistory{}} <- Users.delete_update_history(update_history) do
      send_resp(conn, :no_content, "")
    end
  end
end