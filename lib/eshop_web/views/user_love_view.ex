defmodule EshopWeb.UserLoveView do
  use EshopWeb, :view
  alias EshopWeb.UserLoveView

  def render("index.json", %{user_loves: user_loves}) do
    %{data: render_many(user_loves, UserLoveView, "user_love.json")}
  end

  def render("show.json", %{user_love: user_love}) do
    %{data: render_one(user_love, UserLoveView, "user_love.json")}
  end

  def render("user_love.json", %{user_love: user_love}) do
    %{id: user_love.id,
      type: user_love.type,
      type_id: user_love.type_id}
  end
end
