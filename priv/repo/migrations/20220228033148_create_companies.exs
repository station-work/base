defmodule StationWork.Repo.Migrations.CreateCompanies do
  use Ecto.Migration

  def change do
    create table(:companies) do
      add :name, :string
      add :web_site, :string
      add :image, :string

      timestamps()
    end
  end
end
