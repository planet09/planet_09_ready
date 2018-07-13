json.extract! posts_tag, :id, :post_id, :tag_id, :created_at, :updated_at
json.url posts_tag_url(posts_tag, format: :json)
