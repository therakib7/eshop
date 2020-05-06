defmodule EshopWeb.Schema.Resolvers.User do

    def list_users(_parent, _args, _resolution) do
        {:ok, User.Tasks.list_users()}
    end

    def create_user(_parent, args, _resolution) do
        User.Tasks.create_task(args)
    end
    
end