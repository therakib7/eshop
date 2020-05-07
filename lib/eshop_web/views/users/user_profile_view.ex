defmodule EshopWeb.UserProfileView do
  use EshopWeb, :view
  alias EshopWeb.UserProfileView

  def render("index.json", %{user_profiles: user_profiles}) do
    %{data: render_many(user_profiles, UserProfileView, "user_profile.json")}
  end

  def render("show.json", %{user_profile: user_profile}) do
    %{data: render_one(user_profile, UserProfileView, "user_profile.json")}
  end

  def render("user_profile.json", %{user_profile: user_profile}) do
    %{id: user_profile.id,
      lat: user_profile.lat,
      long: user_profile.long,
      date_of_birth: user_profile.date_of_birth,
      merital_status: user_profile.merital_status,
      gender: user_profile.gender}
  end
end
