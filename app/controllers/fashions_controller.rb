class FashionsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    def new
        @fashion = Fashion.new
    end

    def index
        @fashions = Fashion.all
        if params[:tag]
            @fashions = Fashion.tagged_with(params[:tag])
          else
            @fashions = Fashion.all
        end
    end

    def create
        @fashion = Fashion.new(fashion_params)
        @fashion.user_id = current_user.id
        if @fashion.save
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
    end

    def show
        @fashion = Fashion.find(params[:id])
        @like = Like.new
        @comments = @fashion.comments
        @comment = @fashion.comments.build
    end

    def edit
        @fashion = Fashion.find(params[:id])
    end
    
    def update
        @fashion = Fashion.find(params[:id])
        if @fashion.update(fashion_params)
          redirect_to :action => "show", :id => @fashion.id
        else
          redirect_to :action => "new"
        end
    end

    def destroy
        Fashion.find(params[:id]).destroy
        redirect_to action: :index
    end
      
    private
    def fashion_params
        params.require(:fashion).permit(:body,:image,:tag_list)
    end
end
