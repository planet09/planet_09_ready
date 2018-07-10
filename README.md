#### Post(1)

- posts 컨트롤러 `rails g controller posts index new create show edit update destroy` 
- post 모델`rails g model post title:string content:text `

#### Comment(N)

- comments 컨트롤러 

  - CRUD - Create

- comment 모델 

  - `rails g model comment content:string post_id:integer`

    

#### Devise

1. `devise` gem 설치

```ruby
# Gemfile
gem 'devise'
```

```
$ bundle install
```

2. devise 설치

```
$ rails generate devise:install
```

- `config/initialize/devise.rb` 만들어짐.

3. user 모델 만들기

```
$ rails generate devise user
```

- `db/migrate/20180625_devise_create_users.rb`
- `model/user.rb`
- `config/routes.rb` : devise_for :users

4. migration

```
$ rake db:migrate
```

5. routes 확인

| new_user_session_path         | GET    | /users/sign_in(.:format)       | devise/sessions#new          |
| ----------------------------- | ------ | ------------------------------ | ---------------------------- |
| user_session_path             | POST   | /users/sign_in(.:format)       | devise/sessions#create       |
| destroy_user_session_path     | DELETE | /users/sign_out(.:format)      | devise/sessions#destroy      |
| user_password_path            | POST   | /users/password(.:format)      | devise/passwords#create      |
| new_user_password_path        | GET    | /users/password/new(.:format)  | devise/passwords#new         |
| edit_user_password_path       | GET    | /users/password/edit(.:format) | devise/passwords#edit        |
|                               | PATCH  | /users/password(.:format)      | devise/passwords#update      |
|                               | PUT    | /users/password(.:format)      | devise/passwords#update      |
| cancel_user_registration_path | GET    | /users/cancel(.:format)        | devise/registrations#cancel  |
| user_registration_path        | POST   | /users(.:format)               | devise/registrations#create  |
| new_user_registration_path    | GET    | /users/sign_up(.:format)       | devise/registrations#new     |
| edit_user_registration_path   | GET    | /users/edit(.:format)          | devise/registrations#edit    |
|                               | PATCH  | /users(.:format)               | devise/registrations#update  |
|                               | PUT    | /users(.:format)               | devise/registrations#update  |
|                               | DELETE | /users(.:format)               | devise/registrations#destroy |

- 회원가입 : `get 'users/sign_up'`
- 로그인 : `get 'users/sign_in' `
- 로그아웃 : `delete 'users/sign_out'`

6. helper method

- `user_sign_in?`
  : 유저가 로그인 했는지 안했는지를 true/false 리턴

- `current_user`
  : 로그인되어있는 user 오브젝트를 가지고 있음

- `before_action :authenticate_user!`

  : 로그인 되어있는 유저 검증(필터)

7. View 파일 수정하기

```
$ rails generate devise:views users
```

8. config 수정

   ```ruby
   # config/initializers/devise.rb 232번째 줄
     config.scoped_views = true
   ```

   * 모든 initializers 폴더 안에 있는 설정은 서버를 껐다가 켜야 반영됩니다.

9. [custom column 추가하기](https://github.com/plataformatec/devise#strong-parameters)

   1. migration 파일에 원하는 column추가

   2. `app/views/devise/registrations/new.html.erb` input 추가

   3. `app/controllers/application_controller.rb`

   ```ruby
     before_action :configure_permitted_parameters, if: :devise_controller?
   
     protected
   
     def configure_permitted_parameters
       devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
     end
   ```

#### Active Record query interface 

```ruby
Post.find(1)
Post.first(3) # 앞에서부터 3개
Post.last(3) # 뒤에서부터 3개
Post.order(:title) # title column data기준으로 정렬
Post.order(title: :desc) # z~a
Post.order(title: :asc) # a~z
Post.where("title=?", "Golduck") # title column에서 data가 Golduck인 것을 찾아줘요
Post.where("title like ?", "%duck%") # title column에서 data에 duck이 들어간 것을 찾아줘요
Post.where.not("조건")
User.where("age > ? AND gender = ?", 25, "male") # 나이 25 초과, 남자
```

#### [Form_tag, Form_for](https://guides.rorlab.org/form_helpers.html)

```erb
<form action="/posts" method="post">
  <input type="text" name="title" /> <br />
  <textarea name="content"></textarea> <br />
  <input type="hidden" name="authenticity_token" value="<%= form_authenticity_token%>">
  <input type="submit" />
</form>
```

```erb
<%= form_tag('/posts', method: 'post') do %>
  <%= text_field_tag :title %>
  <%= text_area_tag :content %>
  <%= submit_tag "뿅!"%>
<% end %>
```

```erb
<!-- new.html.erb, edit.html.erb --> 
<%= form_for @post do |f| %>
  <%= f.text_field :title %>
  <%= f.text_area :content %>
  <%= f.submit %>
<% end %>
```

* `form_for` 주요 특징
  * 특정한 모델의 객체를(Post) 조작하기 위해 사용
  * 별도의 url(action="/"), method(get, post, put) 명시하지 않아도 됨.
  * Controller의 해당 액션(`new`, `edit`)에서 반드시 @post에 Post 오브젝트가 담겨야함.
    * `new` : `@post = Post.new`
    * `edit` : `@post = Post.find(id)`
  * 각 input field의 symbol은 반드시 @post의 column 명이랑 일치해야함.

#### [link_to : url helper](https://apidock.com/rails/ActionView/Helpers/UrlHelper/link_to)

```erb
<%= link_to '글 보기', @post %>
<%= link_to '글 보기', post_path, class: "btn btn-warning" %>
<%= link_to '새 글 쓰기', new_post_path %>
<%= link_to '글 수정', edit_post_path %>
<%= link_to '모든 글 보기', posts_path %>
<%= link_to '글 삭제', post_path, method: :delete, data: {confirm: "지울래?"} %>
```



#### gem : [simple form](https://github.com/plataformatec/simple_form) 

1. Gemfile 설정

   ```ruby
   gem 'simple_form'
   ```

2. bundle install

   ```
   $ bundle install
   ```

3. 설치

   ```
   $ rails generate simple_form:install --bootstrap
   ```

4. Bootstrap 프로젝트에 적용

   * CDN을 `application.html.erb`

5. Form helper 만들기

   ```erb
   <%= simple_form_for @post do |f| %>
     <%= f.input :title %>
     <%= f.input :content %>
     <%= f.button :submit, class: "btn-primary" %>
   <% end %>
   ```

   

#### Model validation

```ruby
# app/model/post.rb
  validates :title, presence: {message: "제목을 입력해주세요."},
                    length: {maximum: 30,
                            too_long: "제목은 %{count}자 이내로 입력해주세요." }
  validates :content, presence: {message: "내용을 입력해주세요."}
```

```ruby
def create
   @post = Post.new(post_params)
   respond_to do |format|
      if @post.save
         format.html {redirect_to '/', notice: "글 작성완료"} 
          #notice는 flash[:notice]에 값을 담기 위해서
      else
          format.html {render :new}
          format.json {render json: @post.errors}
      end
   end
end
```

```erb
<!-- app/views/posts/_form.html.erb -->
..
	<%= f.error_notification %>
..
```

#### custom helper

```ruby
# app/helpers/application_helper.rb
def flash_message(type)
   case type
   when "alert" then "alert alert-warning"
   when "notice" then "alert alert-primary"
   end
end
```

```erb
<!-- app/views/layout/application.html.erb -->
<% flash.each do |key, value| %> 
<div class="<%=flash_message(key)%>" role="alert">
    <%= value %>
</div>
<% end %>
```

#### [kaminari](https://github.com/kaminari/kaminari) - pagination

1. `Gemfile`

   ```ruby
   gem 'kaminari'
   ```

   `$ bundle install`

2. controller 설정

   ```ruby
   # app/controllers/posts_controller.rb
   def index
     @posts = Post.all.page(params[:page]).per(5) 
   end
   ```

   

3. view 설정

   ```erb
   <%= paginate @posts %>
   ```

4. theme 설정

   ```
   $ rails g kaminari:views bootstrap4#### 
   ```



#### cancancan - 권한설정

1. Gemfile

   ```
   gem 'cancancan', '~> 2.0'
   ```

   

2. ability.rb

   ```
   $ rails g cancan:ability
   ```

   * `app/models/ability.rb` 생성

   ```ruby
   # app/models/ability.rb
       can :read, Post
       return unless user.present?
       can :manage, Post, user_id: user.id
       can :create, Comment
   ```

3. View에서 ability 확인

   ```erb
   <% if can? :update, @post %>
   	<%= link_to '수정', edit_post_path %>
   <% end %>
   ```

   

4. controller ability 확인

   ```ruby
   # app/controllers/posts_controller.rb
     load_and_authorize_resource
   # restful resoureces를 사용하는 경우에만 가능, 아닌 경우에는 독립적으로 액션별로 설정해줘야함.
   def show
      authorize! :read, @post 
   end
   ```

   5. 권한 오류 발생시 메시지 설정

   ```ruby
   # app/controllers/application_controller.rb
     rescue_from CanCan::AccessDenied do |exception|
       respond_to do |format|
         format.json { head :forbidden, content_type: 'text/html' }
         format.html { redirect_to main_app.root_url, notice: exception.message }
         format.js   { head :forbidden, content_type: 'text/html' }
       end
     end
   ```

   

