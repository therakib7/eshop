defmodule Eshop.Repo.Migrations.CreateFaqs do
  use Ecto.Migration

  def change do
    create table(:faqs) do
      add :question, :string, null: true, size: 255
      add :native_question, :string, null: true, size: 255
      add :answer, :text, null: true
      add :native_answer, :text, null: true
      add :item_id, references(:items, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:faqs, [:item_id])
    create index(:faqs, [:user_id])
  end
end
