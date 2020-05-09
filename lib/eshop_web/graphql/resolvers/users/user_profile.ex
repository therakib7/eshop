defmodule EshopWeb.Schema.Resolvers.UserProfile do

    def list_user_profiles(_parent, _args, _resolution) do
        {:ok, Eshop.Users.list_user_profiles()}
    end

    def get_user_profile(_, %{id: id}, _) do
        {:ok, Eshop.Users.get_user_profile!(id)}
    end

    def create_user_profile(_parent, args, _resolution) do
        Eshop.Users.create_user_profile(args)
    end
    
end