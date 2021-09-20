# frozen_string_literal: true

class BluethumbService
  include HTTParty
  base_uri 'http://localhost:4000'

  def initialize(id: nil, payload: nil)
    @post_id = id
    @payload = payload
  end

  def posts
    response = self.class.get('/posts')
    return [] unless response['posts'].present?

    response['posts']
  end

  def create_post
    payload = {
      "post": {
        "title": @payload['title'],
        "body": @payload['body']
      }
    }

    response = self.class.post('/posts', body: payload)
    return nil if response.body.blank?

    JSON.parse(response.body)
  end

  def find_post
    post = self.class.get("/posts/#{@post_id}")
    comments = find_comments(post['comments_path'])

    post.merge comments
  end

  def create_comment
    payload = {
      "comment": {
        "name": @payload['name'],
        "body": @payload['body']
      }
    }

    response = self.class.post("/posts/#{@post_id}/comments", body: payload)
    JSON.parse(response.body)
  end

  private

  def find_comments(comments_path)
    self.class.get(comments_path)
  end
end
