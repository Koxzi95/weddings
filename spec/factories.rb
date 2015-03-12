FactoryGirl.define do
	# :name, :description, :size, :capacity, :price, :picture, :rmcat_id
	factory :room do
		name "The New Room"
		description  "The Really Good New Room"
		size "250"
		capacity "650"
		price "2500"
		picture_file_name 'room-controller-valid.jpg'
		picture_content_type 'image/jpeg'
		picture_file_size 1.megabyte
		# picture { File.new("#{Rails.root}/spec/support/images/room-controller-valid.jpg") }
	end

	factory :rmcat do
		rmtype "The New Roomcat"
		association :rooms, factory: :room
	end

	factory :user do
		email "basicuser@mvmanor.co.uk"
		password "u"
		password_confirmation "u"
		admin false
		customer false
	end

	# Admin
	factory :admin, class: User do
		email "basicadmin@mvmanor.co.uk"
		password "a"
		password_confirmation "a"
		admin true
		customer false
	end
end