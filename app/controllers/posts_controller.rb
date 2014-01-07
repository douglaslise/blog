class PostsController < ApplicationController

	before_filter :authenticate_user!,
	  except: [:index, :show]

	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
		@comentario = Comentario.new
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new
		@post.titulo = params[:post][:titulo]
		@post.texto  = params[:post][:texto]

		if @post.save
			redirect_to post_path(@post)
		else
			render action: 'new'
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		
		param_permit = params[:post].permit([:titulo, :texto])
		
		@post.update_attributes(param_permit)
		
		if @post.save
			redirect_to post_path(@post)
		else
			render action: 'edit'
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path
	end

end
