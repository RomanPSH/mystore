# app/controllers/admin/comments_controller.rb
class Admin::CommentsController < Admin::AdminController
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to product_path(@comment.product), notice: 'Коментар успішно видалено.'
  end
end
