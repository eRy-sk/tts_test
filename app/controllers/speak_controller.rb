class SpeakController < ApplicationController
  def index
    @names = User.all.pluck(:name)
    @langs = %w[af ar az be bg bn ca cs cy da de el en en_us en_gb en_au eo es et eu fa fi fr ga gl gu hi hr ht hu id is it iw ja ka kn ko la lt lv mk ms mt nl no pl pt ro ru sk sl sq sr sv sw ta te th tl tr uk ur vi yi zh zh-CN zh-TW]
  end
  def speak
    "今日の掃除当番は#{params[:user1]}さんと#{params[:user2]}さんです。".play 'ja'
    redirect_to root_path
  end
  def bonus
    params[:text].play params[:lang]
    redirect_to root_path
  end
end
