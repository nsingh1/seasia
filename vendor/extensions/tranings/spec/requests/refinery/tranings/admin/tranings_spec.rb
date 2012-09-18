# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Tranings" do
    describe "Admin" do
      describe "tranings" do
        login_refinery_user

        describe "tranings list" do
          before(:each) do
            FactoryGirl.create(:traning, :title => "UniqueTitleOne")
            FactoryGirl.create(:traning, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.tranings_admin_tranings_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before(:each) do
            visit refinery.tranings_admin_tranings_path

            click_link "Add New Traning"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Tranings::Traning.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Title can't be blank")
              Refinery::Tranings::Traning.count.should == 0
            end
          end

          context "duplicate" do
            before(:each) { FactoryGirl.create(:traning, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.tranings_admin_tranings_path

              click_link "Add New Traning"

              fill_in "Title", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Tranings::Traning.count.should == 1
            end
          end

        end

        describe "edit" do
          before(:each) { FactoryGirl.create(:traning, :title => "A title") }

          it "should succeed" do
            visit refinery.tranings_admin_tranings_path

            within ".actions" do
              click_link "Edit this traning"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            page.should have_content("'A different title' was successfully updated.")
            page.should have_no_content("A title")
          end
        end

        describe "destroy" do
          before(:each) { FactoryGirl.create(:traning, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.tranings_admin_tranings_path

            click_link "Remove this traning forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Tranings::Traning.count.should == 0
          end
        end

      end
    end
  end
end
