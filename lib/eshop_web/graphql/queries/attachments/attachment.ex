defmodule EshopWeb.Schema.Queries.Attachment do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.Attachment, as: Attachment

  object :attachment_queries do
      @desc "Get all attachments"
      field :attachments, list_of(:attachment) do
          resolve &Attachment.list_attachments/3
      end

      @desc "Get a attachment by its id"
      field :attachment, :attachment do
          arg :id, non_null(:id)
          resolve &Attachment.get_attachment/3
      end 
  end
end
