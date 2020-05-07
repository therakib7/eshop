defmodule EshopWeb.Schema.Resolvers.UserProfile do

    def list_user_profiles(_parent, _args, _resolution) do
        {:ok, Eshop.Users.list_user_profiles()}
    end

    # def create_user_profile(_parent, args, _resolution) do
    #     Eshop.Users.create_user_profile(args)
    # end
    
end