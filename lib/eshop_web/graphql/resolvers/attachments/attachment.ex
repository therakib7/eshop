defmodule EshopWeb.Schema.Resolvers.Attachment do

    def list_attachments(_parent, _args, _resolution) do
        {:ok, Eshop.Attachments.list_attachments()}
    end

end
