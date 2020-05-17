defmodule EshopWeb.Schema.Resolvers.UserSetting do
  def list_user_settings(_parent, _args, _resolution) do
    {:ok, Eshop.Settings.list_user_settings()}
  end

  def get_user_setting(_, %{id: id}, _) do
    {:ok, Eshop.Settings.get_user_setting!(id)}
  end

  def create_user_setting(_parent, args, _resolution) do
    Eshop.Settings.create_user_setting(args)
  end

  def update_user_setting(%{id: id, user_setting_params: user_setting_params}, _info) do
    case {:ok, Eshop.Settings.get_user_setting!(id)} do
      {:ok, user_setting} ->
        user_setting |> Eshop.Settings.update_user_setting(user_setting_params)
    end
  end

  def delete_user_setting(%{id: id}, _info) do
    case {:ok, Eshop.Settings.get_user_setting!(id)} do
      {:ok, user_setting} -> user_setting |> Eshop.Settings.delete_user_setting()
    end
  end
end
