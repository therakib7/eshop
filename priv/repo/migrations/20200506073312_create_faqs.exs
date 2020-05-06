defmodule Eshop.Repo.Migrations.CreateFaqs do
  use Ecto.Migration

  def change do
    create table(:faqs) do
      add :question, :string
      add :native_question, :string
      add :content, :text
      add :native_content, :text
      add :item, references(:items, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:faqs, [:item])
    create index(:faqs, [:user_id])
  end
end
