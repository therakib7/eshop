defmodule EshopWeb.Schema.Resolvers.Attachment do
	 
   	def list_attachments(_parent, _args, _resolution) do
        {:ok, Eshop.Attachments.list_attachments()}
    end

    def get_attachment(_, %{id: id}, _) do
		{:ok, Eshop.Attachments.get_attachment!(id)} 
	end 
	 
    def create_attachment(_parent, args, _resolution) do
        Eshop.Attachments.create_attachment(args)
    end 

    def update_attachment(%{id: id, attachment_params: attachment_params}, _info) do
		case {:ok, Eshop.Attachments.get_attachment!(id)} do
			{:ok, attachment} -> attachment |> Eshop.Attachments.update_attachment(attachment_params) 
		end  
	end

	def delete_attachment(%{id: id}, _info) do 
		case {:ok, Eshop.Attachments.get_attachment!(id)} do
			{:ok, attachment} -> attachment |> Eshop.Attachments.delete_attachment() 
		end 
	end  
end
