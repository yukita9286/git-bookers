class BooksController < ApplicationController

  def new
  
  
   
  end
  
  

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "投稿に成功しました。"
      redirect_to book_path(@book.id)
    else
      flash.now[:notice] = "投稿に失敗しました。"
      render :new
    end
  end
  
  def index
     @book = Book.new
    @books = Book.all  
  end   
  

  def show
    @book = Book.find(params[:id])  
   
  end

  def edit
    @book = Book.find(params[:id])
    
  end
  
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)  
  end  
  
  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to '/books'  # 投稿一覧画面へリダイレクト  
  end  
  
  
   private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end 