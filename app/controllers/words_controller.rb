class WordsController < ApplicationController
	respond_to :html, :js, :json
	before_action :set_category, only: [:create, :destroy]

	def index
		@words = Word.where(category_id: params[:category_id])
		respond_with @words
	end

	def create
		@word = @category.words.new word_params
		@word.save
		if @word.save
			redirect_to @category, notice: 'Palavra salva com sucesso'
		else
			redirect_to @category, alert: 'Palavra não pode ser nulo'
		end
	end

	def destroy
		@word = Word.find(params[:id])
		@word.destroy
	end

	private
	def word_params
		params.require(:word).permit(:word, :category_id)
	end

  	def set_category
		@category = Category.find(params[:category_id])
	end
end
