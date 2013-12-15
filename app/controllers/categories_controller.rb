class CategoriesController < ApplicationController
	respond_to :html, :js, :json
	before_action :set_category, only: [:destroy, :edit, :update, :show]

	def index
		@categories = Category.all
		respond_with @categories
	end

	def show
	end

	def new
		@category = Category.new
	end

	def edit
	end

	def create
		@category = Category.create category_params

		if @category.save 
			redirect_to action: 'index', notice: 'Categoria criada com sucesso'
		else
			render action: 'new'
		end
	end

	def update
		if @category.update(category_params)
			redirect_to action: 'index', notice: 'Categoria atualizada com sucesso'
		else
			render action: 'edit'
		end
	end

	def destroy
		@category.destroy
		#redirect_to action: 'index', notice: 'Categoria apagada com sucesso'
	end

	private
	def category_params
		params.require(:category).permit(:description, :image)
	end

	def set_category
    	@category = Category.find(params[:id])
  	end
end
