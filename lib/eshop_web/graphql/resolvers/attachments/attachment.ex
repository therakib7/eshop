defmodule EshopWeb.Schema.Resolvers.Attachment do

    def list_attachments(_parent, _args, _resolution) do
        {:ok, Eshop.Attachments.list_attachments()}
    end

    def create_attachment(_parent, args, _resolution) do
        Eshop.Attachments.create_attachment(args)
    end 

end
