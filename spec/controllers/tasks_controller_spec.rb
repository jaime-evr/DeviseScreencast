require "spec_helper"

describe TasksController do
  let(:user) { FactoryGirl.create(:user) }

  before do
    sign_in user
  end

  describe "GET #index" do
    it "populates an array of tasks" do
      task = FactoryGirl.create :task, user: user
      get :index
      expect(assigns(:tasks)).to match_array [task]
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    before do
      @task = FactoryGirl.create :task, user: user
    end

    it "assigns the requested task to @task" do
      get :show, id: @task
      expect(assigns(:task)).to eq @task
    end

    it "renders the show template" do
      get :show, id: @task
      expect(response).to render_template :show
    end
  end

  describe "GET #new" do
    it "assigns a new task to @task" do
      get :new
      expect(assigns(:task)).to be_a_new(Task)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    it "creates a new task" do
      expect{
        post :create, task: FactoryGirl.attributes_for(:task)
      }.to change(Task,:count).by(1)
    end

    it "redirects to the created task" do
      post :create, task: FactoryGirl.attributes_for(:task)
      expect(response).to redirect_to @task
    end
  end
end
