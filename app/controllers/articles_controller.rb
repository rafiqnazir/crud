class ArticlesController < ApplicationController

    before_action :set_article, only: [:show, :update, :destroy]

    def show
        render json: @article
    end

    def index
        @articles = Article.all
        render json: @articles
    end

    def create

        article = Article.new(title: params[:title], description: params[:description],user_id: User.first.id)
        if article.save
            render json: {article: article}
        else
            render json: {error: article.errors.full_messages}
        end
    end

    def update
        @article.title = params[:title] if params[:title]
        @article.description = params[:description] if params[:description]
        if @article.save
            render json: {article: @article}
        else
            render json: {error: @article.errors.full_messages}
        end
    end

    def destroy
        if @article.destroy
            render json: {message: "deleted suceess"}
        else
            render json: {error: @article.errors.full_messages}
        end
    end

    private

    def set_article
        @article = Article.find(params[:id])    
    end

end