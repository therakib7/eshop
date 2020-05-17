defmodule EshopWeb.UserProfileController do
  use EshopWeb, :controller

  alias Eshop.Users
  alias Eshop.Users.UserProfile

  action_fallback EshopWeb.FallbackController

  def index(conn, _params) do
    user_profiles = Users.list_user_profiles()
    render(conn, "index.json", user_profiles: user_profiles)
  end

  def create(conn, %{"user_profile" => user_profile_params}) do
    with {:ok, %UserProfile{} = user_profile} <- Users.create_user_profile(user_profile_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_profile_path(conn, :show, user_profile))
      |> render("show.json", user_profile: user_profile)
    end
  end

  def show(conn, %{"id" => id}) do
    user_profile = Users.get_user_profile!(id)
    render(conn, "show.json", user_profile: user_profile)
  end

  def update(conn, %{"id" => id, "user_profile" => user_profile_params}) do
    user_profile = Users.get_user_profile!(id)

    with {:ok, %UserProfile{} = user_profile} <-
           Users.update_user_profile(user_profile, user_profile_params) do
      render(conn, "show.json", user_profile: user_profile)
    end
  end

  def delete(conn, %{"id" => id}) do
    user_profile = Users.get_user_profile!(id)

    with {:ok, %UserProfile{}} <- Users.delete_user_profile(user_profile) do
      send_resp(conn, :no_content, "")
    end
  end
end
