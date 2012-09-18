# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Requirements" do
    describe "Admin" do
      describe "requirements" do
        login_refinery_user

        describe "requirements list" do
          before(:each) do
            FactoryGirl.create(:requirement, :language => "UniqueTitleOne")
            FactoryGirl.create(:requirement, :language => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.requirements_admin_requirements_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before(:each) do
            visit refinery.requirements_admin_requirements_path

            click_link "Add New Requirement"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Language", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Requirements::Requirement.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Language can't be blank")
              Refinery::Requirements::Requirement.count.should == 0
            end
          end

          context "duplicate" do
            before(:each) { FactoryGirl.create(:requirement, :language => "UniqueTitle") }

            it "should fail" do
              visit refinery.requirements_admin_requirements_path

              click_link "Add New Requirement"

              fill_in "Language", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Requirements::Requirement.count.should == 1
            end
          end

        end

        describe "edit" do
          before(:each) { FactoryGirl.create(:requirement, :language => "A language") }

          it "should succeed" do
            visit refinery.requirements_admin_requirements_path

            within ".actions" do
              click_link "Edit this requirement"
            end

            fill_in "Language", :with => "A different language"
            click_button "Save"

            page.should have_content("'A different language' was successfully updated.")
            page.should have_no_content("A language")
          end
        end

        describe "destroy" do
          before(:each) { FactoryGirl.create(:requirement, :language => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.requirements_admin_requirements_path

            click_link "Remove this requirement forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Requirements::Requirement.count.should == 0
          end
        end

      end
    end
  end
end
