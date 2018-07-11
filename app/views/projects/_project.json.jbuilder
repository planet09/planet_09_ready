json.extract! project, :id, :p_id, :p_name, :description, :start_date, :end_date, :account, :goal, :price, :body, :option, :rel_project1_url, :rel_project2_url, :comment_id, :user_id, :created_at, :updated_at
json.url project_url(project, format: :json)
