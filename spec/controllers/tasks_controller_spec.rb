require "spec_helper"

describe TasksController do
  let(:user) { User.create! email: 'user@example.com', password: 'asdf1234as' }

  before do
    sign_in user
  end

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  #describe "POST #create" do
  #  it "creates a new task" do
  #    expect{
  #      post :create, task: FactoryGirl.attributes_for(:task)
  #    }.to change(Task,:count).by(1)
  #  end
  #end

  describe "GET #show" do
    let(:task) { Task.create! name: 'hello', comments: 'comments for task', user_id: user.id }
    it "finds a task" do
      get :show, id: task.id
      expect(assigns(:task)).to eq task
      expect(response).to be_success
      expect(response.status).to eq(200)
      expect(response).to render_template :show
    end
  end
end