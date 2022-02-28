defmodule StationWork.Company do
  @moduledoc """
  The Company context.
  """

  import Ecto.Query, warn: false
  alias StationWork.Repo

  alias StationWork.Company.Companies

  @doc """
  Returns the list of companies.

  ## Examples

      iex> list_companies()
      [%Companies{}, ...]

  """
  def list_companies do
    Repo.all(Companies)
  end

  @doc """
  Gets a single companies.

  Raises `Ecto.NoResultsError` if the Companies does not exist.

  ## Examples

      iex> get_companies!(123)
      %Companies{}

      iex> get_companies!(456)
      ** (Ecto.NoResultsError)

  """
  def get_companies!(id), do: Repo.get!(Companies, id)

  @doc """
  Creates a companies.

  ## Examples

      iex> create_companies(%{field: value})
      {:ok, %Companies{}}

      iex> create_companies(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_companies(attrs \\ %{}) do
    %Companies{}
    |> Companies.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a companies.

  ## Examples

      iex> update_companies(companies, %{field: new_value})
      {:ok, %Companies{}}

      iex> update_companies(companies, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_companies(%Companies{} = companies, attrs) do
    companies
    |> Companies.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a companies.

  ## Examples

      iex> delete_companies(companies)
      {:ok, %Companies{}}

      iex> delete_companies(companies)
      {:error, %Ecto.Changeset{}}

  """
  def delete_companies(%Companies{} = companies) do
    Repo.delete(companies)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking companies changes.

  ## Examples

      iex> change_companies(companies)
      %Ecto.Changeset{data: %Companies{}}

  """
  def change_companies(%Companies{} = companies, attrs \\ %{}) do
    Companies.changeset(companies, attrs)
  end
end
