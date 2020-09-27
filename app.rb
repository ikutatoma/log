require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require './models.rb'
enable :sessions


helpers do
  def current_user
  @userr = User.find_by(id: session[:user])
  end
end

get '/' do
  if current_user.nil? then
  redirect '/signin'
  else
    @courses = Course.all
    @users = User.all
    @user_color = current_user.color
    @quesitons = Question.order(:updated_at,:created_at).reverse_order
    erb :index
  end
end

get "/like/:id" do
  sele_ques = Question.find(params[:id])
  new_like = Like.create!(
  user: current_user,
  question_id: sele_ques.id
  )

redirect "/"
end

get '/signup' do
  erb :sign_up
end

post '/signup' do
user = User.create(
name: params[:name],
password: params[:password],
password_confirmation: params[:password_confirmation],
color: params[:color]
)
if user.persisted?
session[:user] = user.id
end
redirect '/'
end

get '/signin' do
erb :sign_in
end

post '/signin' do
user = User.find_by(name: params[:name])
if user && user.authenticate(params[:password])
session[:user] = user.id
end
redirect '/'
end

get '/logout' do
session[:user] = nil
redirect '/'
end

get '/questions/new' do
erb :question_new
end

post '/questions' do
course = Course.find(params[:course])
current_user.questions.create!(
title: params[:title],
content:params[:content],
course_id: course.id)
redirect '/'
end


post '/questions/:id/delete' do
question = Question.find(params[:id])
question.destroy
redirect '/'
end

get '/questions/:id/edit' do
@question_edit = Question.find(params[:id])
erb :question_edit
end

post '/questions/:id' do
questions = Question.find(params[:id])
course = Course.find(params[:course])
questions.title = CGI.escapeHTML(params[:title])
questions.course_id = course.id
questions.save
redirect '/'
end

get '/questions/:id/course' do
seleQ = Course.find(params[:id]).questions
@courQues = seleQ.order(:updated_at,:created_at).reverse_order
@courses = Course.all
@user_color = current_user.color
erb :questions_course
end

get '/question/:id/detail' do
@all_answer = Answer.all
@QuesDetail = Question.find(params[:id])
@escaped_hoge = (@QuesDetail.content).gsub(/\r\n/, "\\n").gsub(/"/,'\"')
erb :question_detail
end

post '/question/:id/detail/answer' do
@QuesDetail = Question.find(params[:id])
current_user.answers.create!(
title: params[:title],
content:params[:content],
question_id:@QuesDetail.id)
redirect "/"
end

get '/quesiton/sarch' do
@courses = Course.all
@users = User.all
@user_color = current_user.color
@quesitons = Question.order(:updated_at,:created_at).reverse_order
@sarch_ques = Question.where(content: params[:sarch])
@sarch_ques = Question.where('title like ?', "%#{params[:sarch]}%")
erb :sarch_questions
end


get '/user/:id/detail' do
@user_profile = User.find(params[:id])
@user_questions = @user_profile.questions.count
@user_likes = Like.where(user_id: @user_profile.id).count
@user_color = @user_profile.color
erb :my_profile
end


get '/user/:id/edit' do
@user_edit = current_user.id
erb :my_profile_edit
end

post '/current_user/edit' do
user_up = current_user.update(
name: params[:name],
color:params[:color],
simple_word: params[:simple_word]
)
redirect "/"
end