defmodule EshopWeb.Schema.Resolvers.UserLove do

	def list_user_loves(_parent, _args, _resolution) do
        {:ok, Eshop.Activities.list_user_loves()}
    end

    def create_user_love(_parent, args, _resolution) do
        Eshop.Activities.create_user_love(args)
    end 

end
