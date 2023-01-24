class Public::CooksController < ApplicationController
  before_action :authenticate_customer!
  def new #レシピ投稿
    @cook = Cook.new(rate: 0)
    @tags = Tag.all
  end

  def index #レシピ一覧
    @genres = Genre.where(is_active: true)
    if params[:genre_id]
		  @genre = Genre.find(params[:genre_id])
		  @cooks = @genre.cooks.where(is_active: true).page(params[:page])
    else
      @cooks = Cook.where(is_active: true).page(params[:page])
    end

    @cooks = Cook.all
    @tags = Tag.all

    #タグ検索
    if params[:tag_id]
      @tag = Tag.find(params[:tag_id])
      @cooks = @cooks.where(tag_id: @tag.id) #複数のidを取得
    end

    #ソート機能
    if params[:latest]
      @cooks = Cook.latest.page(params[:page]).per(8)
    elsif params[:old]
      @cooks = Cook.old.page(params[:page]).per(8)
    elsif params[:star_count]
      @cooks = Cook.star_count.page(params[:page]).per(8)
    else
      @cooks = @cooks.order("created_at DESC").page(params[:page]).per(8) #降順に指定
    end
  end

  def show #レシピ詳細
    @cook = Cook.find(params[:id])
    @cook_comment = CookComment.new
  end

  def edit #レシピ編集
    @cook = Cook.find(params[:id])
    @tag =  Tag.find(@cook.tag_id)
  end

  def create
    @cook = Cook.new(cook_params)
    @cook.customer_id = current_customer.id
    if @cook.save
      if @cook.image.attached?
        tags = Vision.get_image_data(@cook.image)
        tags.each do |tag|
          @cook.cook_tags.create(name: tag)
        end
      end
      redirect_to cooks_path,notice: "You have created cook successfully." #レシピ一覧へ
    else
      @cooks = Cook.all
      @tags = Tag.all
      render 'new' #レシピ投稿へ戻る
    end
  end

  def update
    @cook = Cook.find(params[:id])
    if @cook.update(cook_params)
      redirect_to cook_path(@cook) #レシピ一覧へ
    else
      render :edit #レシピ編集へ戻る
    end
  end

  def destroy
    @cook = Cook.find(params[:id])

    @cook.destroy
    redirect_to cooks_path #レシピ一覧へ
  end

  private
  def cook_params
    params.require(:cook).permit(:image, :name, :required_time, :foods, :recipe, :tag_id, :rate) #タグidも追記
  end

end

