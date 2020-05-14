defmodule EshopWeb.Schema.Resolvers.TypeComment do
	 
   	def list_type_comments(_parent, _args, _resolution) do
        {:ok, Eshop.Activities.list_type_comments()}
    end

    def get_type_comment(_, %{id: id}, _) do
		{:ok, Eshop.Activities.get_type_comment!(id)} 
	end 
	 
    def create_type_comment(_parent, args, _resolution) do
        Eshop.Activities.create_type_comment(args)
    end 

    def update_type_comment(%{id: id, type_comment_params: type_comment_params}, _info) do
		case {:ok, Eshop.Activities.get_type_comment!(id)} do
			{:ok, type_comment} -> type_comment |> Eshop.Activities.update_type_comment(type_comment_params) 
		end  
	end

	def delete_type_comment(%{id: id}, _info) do 
		case {:ok, Eshop.Activities.get_type_comment!(id)} do
			{:ok, type_comment} -> type_comment |> Eshop.Activities.delete_type_comment() 
		end 
	end  
end
