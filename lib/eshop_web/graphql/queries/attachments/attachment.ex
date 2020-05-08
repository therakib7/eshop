defmodule EshopWeb.Schema.Queries.Attachment do
  use Absinthe.Schema.Notation

  object :attachment_queries do
    @desc "Get all attachments"
    field :attachments, list_of(:attachment) do
      resolve &EshopWeb.Schema.Resolvers.Attachment.list_attachments/3
    end
  end 
end
