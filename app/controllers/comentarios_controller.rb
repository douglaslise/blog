class ComentariosController < ApplicationController

	def create
		@post = Post.find(params[:post_id])
		@comentario = @post.comentarios.build
		@comentario.texto = params[:comentario][:texto]
		@comentario.autor = params[:comentario][:autor]
		@comentario.save

		redirect_to post_path(@post)
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comentario = @post.comentarios.find(params[:id])
		@comentario.destroy

		respond_to do |format|
		  format.html {redirect_to post_path(@post)}
		  format.js { render }
		end
	end

end
