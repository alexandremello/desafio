class CategorySerializer < ActiveModel::Serializer
  attributes :id, :description, :image_url

  def image_url
  	object.image.url(:xsmall)
  end
end
