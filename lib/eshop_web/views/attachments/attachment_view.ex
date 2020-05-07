defmodule EshopWeb.AttachmentView do
  use EshopWeb, :view
  alias EshopWeb.AttachmentView

  def render("index.json", %{attachments: attachments}) do
    %{data: render_many(attachments, AttachmentView, "attachment.json")}
  end

  def render("show.json", %{attachment: attachment}) do
    %{data: render_one(attachment, AttachmentView, "attachment.json")}
  end

  def render("attachment.json", %{attachment: attachment}) do
    %{id: attachment.id,
      type: attachment.type,
      type_id: attachment.type_id,
      file_name: attachment.file_name,
      resized_size: attachment.resized_size,
      orginal_size: attachment.orginal_size,
      name: attachment.name}
  end
end
