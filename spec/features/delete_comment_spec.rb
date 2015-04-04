describe "deleting a comment process" do
	before do
    visit '/'
    click_link 'Sign Up'
    fill_in 'Email', with: "test@test.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Sign up"
    end
    
  it "deletes the comment" do
    post = Post.create(title: "Hello", body: "Content")
    comment = Comment.create(comment: "Hi", post_id: post.id)
    visit post_path(post)
    click_on 'Delete Comment'
    visit post_path(post)
    expect(page).to have_no_content 'Hi'
  end
end
