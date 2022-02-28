defmodule StationWork.Company.Companies do
  use Ecto.Schema
  import Ecto.Changeset

  schema "companies" do
    field :image, :string
    field :name, :string
    field :web_site, :string

    timestamps()
  end

  @doc false
  def changeset(companies, attrs) do
    companies
    |> cast(attrs, [:name, :web_site, :image])
    |> validate_required([:name, :web_site, :image])
  end
end
