# frozen_string_literal: true
require 'net/http'

class BluethumbService
  BASE_URL = 'http://localhost:4000'.freeze

  class << self
    def posts
      uri = URI("#{BASE_URL}/posts")
      response = Net::HTTP.get(uri)
      JSON.parse(response)
    end

    def create_post(payload)
      uri = URI("#{BASE_URL}/posts")
      response = Net::HTTP.post_form(uri, post: payload)
      JSON.parse(response.body)
    end

    def find_post(post_id)
      uri = URI("#{BASE_URL}/posts/#{post_id}")
      response = Net::HTTP.get(uri)
      post = JSON.parse(response)
      comments = find_comments(post['comments_path'])
      post['comments'] = comments

      post
    end

    def create_comment(post_id, payload)
      uri = URI("#{BASE_URL}/posts/#{post_id}/comments")
      response = Net::HTTP.post_form(uri, payload)
      JSON.parse(response.body)
    end

    private

    def find_comments(path)
      uri = URI("#{BASE_URL}#{path}")
      response = Net::HTTP.get(uri)
      JSON.parse(response)
    end
  end

end
