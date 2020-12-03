defmodule App.Images.Image do
  use Ecto.Schema
  use Ecto.Schema
  import Ecto.Changeset
  use Arc.Ecto.Schema

  schema "images" do
    field :image, App.ImageUploader.Type

    timestamps()
  end

  @doc false
  def changeset(image, attrs) do
    image
    |> cast(attrs, [:image])
    |> cast_attachments(attrs, [:image])
    |> validate_required([:image])
  end
end
