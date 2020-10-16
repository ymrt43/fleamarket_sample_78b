class BuyerController < ApplicationController

  require 'payjp'

  def index
    @card = Card.where(user_id: current_user.id).first
    #Cardテーブルは作成済み、テーブルからpay.jpの顧客IDを検索
    if card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to controller: "card", action: "new"
    else
      Payjp.api_key = ENV
  end

  def done
  end
end
