def create_p_draft
  @article = Article.create
  expect {
    3.times { User.create(article: @article) }
  }.to change(User, :count).by(3)
  expect(@article.draft?).to be_truthy
end

def create_p_pending
  create_p_draft
  expect { @article.review! }.to change(Review, :count).by(@article.reviewers.count)
  expect(@article.pending?).to be_truthy
end

def create_p_rejected
  create_p_pending
  @review = @article.reviews.first
  expect { @review.reject! }.to change(@review, :status).from(:pending).to(:rejected)
  expect(@article.rejected?).to be_truthy
end

def create_p_reviewed
  create_p_pending
  @article.reviews.each do |r|
    r.accept!
    expect(r.accepted?).to be_truthy
  end
  expect(@article.reviewed?).to be_truthy
end
