require 'rails_helper'

RSpec.describe Link, type: :model do
  let(:user) { create(:user) }

  describe "validations" do
    it "is valid with valid attributes" do
      link = build(:link, user: user)
      expect(link).to be_valid
    end

    it "is invalid without original_url" do
      link = build(:link, original_url: nil, user: user)
      expect(link).not_to be_valid
      expect(link.errors[:original_url]).to include("can't be blank")
    end

    it "is invalid with invalid URL" do
      link = build(:link, original_url: "not-a-url", user: user)
      expect(link).not_to be_valid
      expect(link.errors[:original_url]).to include("is invalid")
    end

    it "is invalid with duplicate slug" do
      create(:link, slug: "dupe", user: user)
      dup = build(:link, slug: "dupe", user: user)
      expect(dup).not_to be_valid
    end
  end

  describe "slug generation" do
    it "generates slug if not provided" do
      link = create(:link, slug: nil, user: user)
      expect(link.slug).to be_present
    end

    it "preserves manually assigned slug" do
      link = create(:link, slug: "manual-slug", user: user)
      expect(link.slug).to eq("manual-slug")
    end
  end

  describe "status enum" do
    it "defaults to active" do
      link = create(:link, user: user)
      expect(link.status).to eq("active")
    end

    it "accepts inactive and archived states" do
      link1 = create(:link, slug: "slug1", original_url: "https://test1.com", status: :inactive, user: user)
      link2 = create(:link, slug: "slug2", original_url: "https://test2.com", status: :archived, user: user)
      expect(link1).to be_inactive
      expect(link2).to be_archived
    end
  end
end
