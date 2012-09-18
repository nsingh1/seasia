# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Verticals" do
    describe "Admin" do
      describe "verticals" do
        login_refinery_user

        describe "verticals list" do
          before(:each) do
            FactoryGirl.create(:vertical, :title => "UniqueTitleOne")
            FactoryGirl.create(:vertical, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.verticals_admin_verticals_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before(:each) do
            visit refinery.verticals_admin_verticals_path

            click_link "Add New Vertical"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Verticals::Vertical.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Title can't be blank")
              Refinery::Verticals::Vertical.count.should == 0
            end
          end

          context "duplicate" do
            before(:each) { FactoryGirl.create(:vertical, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.verticals_admin_verticals_path

              click_link "Add New Vertical"

              fill_in "Title", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Verticals::Vertical.count.should == 1
            end
          end

        end

        describe "edit" do
          before(:each) { FactoryGirl.create(:vertical, :title => "A title") }

          it "should succeed" do
            visit refinery.verticals_admin_verticals_path

            within ".actions" do
              click_link "Edit this vertical"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            page.should have_content("'A different title' was successfully updated.")
            page.should have_no_content("A title")
          end
        end

        describe "destroy" do
          before(:each) { FactoryGirl.create(:vertical, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.verticals_admin_verticals_path

            click_link "Remove this vertical forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Verticals::Vertical.count.should == 0
          end
        end

      end
    end
  end
end
