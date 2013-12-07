class WordsController < ApplicationController
	respond_to :html
	before_action :set_category, only: [:create, :destroy]

	def index
		@words = Word.where(category_id: params[:category_id])
	end

	def create
		@word = @category.words.new word_params
		if @word.save
			redirect_to @category, notice: 'Palavra salva com sucesso'
		else
			render @category
		end
	end	

	def destroy
		@word = Word.find(params[:id])
		@word.destroy
		redirect_to @category
	end

	private
	def word_params
		params.require(:word).permit(:word, :category_id)
	end

  	def set_category
		@category = Category.find(params[:category_id])
	end
end
