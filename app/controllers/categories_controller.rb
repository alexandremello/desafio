class CategoriesController < ApplicationController
	respond_to :html
	before_action :set_category, only: [:destroy]

	def index
		@categories = Category.all
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.create category_params

		if @category.save 
			redirect_to action: 'index', notice: 'Categoria criada com sucesso'
		else
			render action: 'new'
		end
	end

	def destroy
		@category.destroy
		redirect_to action: 'index', notice: 'Categoria apagada com sucesso'
	end

	private
	def category_params
		params.require(:category).permit(:description)
	end

	def set_category
    	@category = Category.find(params[:id])
  	end
end
