defmodule EshopWeb.UserView do
  use EshopWeb, :view
  alias EshopWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      is_active: user.is_active,
      first_name: user.first_name,
      surname: user.surname,
      email: user.email,
      mobile: user.mobile,
      pin: user.pin,
      password_hash: user.password_hash,
      verified_user: user.verified_user,
      verified_email: user.verified_email,
      verified_phone: user.verified_phone
    }
  end
end
