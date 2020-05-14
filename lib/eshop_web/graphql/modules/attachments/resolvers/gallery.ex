defmodule EshopWeb.Schema.Resolvers.Gallery do
	 
   	def list_galleries(_parent, _args, _resolution) do
        {:ok, Eshop.Attachments.list_galleries()}
    end

    def get_gallery(_, %{id: id}, _) do
		{:ok, Eshop.Attachments.get_gallery!(id)} 
	end 
	 
    def create_gallery(_parent, args, _resolution) do
        Eshop.Attachments.create_gallery(args)
    end 

    def update_gallery(%{id: id, gallery_params: gallery_params}, _info) do
		case {:ok, Eshop.Attachments.get_gallery!(id)} do
			{:ok, gallery} -> gallery |> Eshop.Attachments.update_gallery(gallery_params) 
		end  
	end

	def delete_gallery(%{id: id}, _info) do 
		case {:ok, Eshop.Attachments.get_gallery!(id)} do
			{:ok, gallery} -> gallery |> Eshop.Attachments.delete_gallery() 
		end 
	end  
end
