# Clear existing data
Booking.destroy_all
Review.destroy_all
Hostel.destroy_all
Landlord.destroy_all
Student.destroy_all

# Create some landlords
landlord1 = Landlord.create!(
  first_name: 'John',
  last_name: 'Doe',
  email: 'john@example.com',
  phone_number: '1234567890',
  password: 'password',
  password_confirmation: 'password'
)

landlord2 = Landlord.create!(
  first_name: 'Jane',
  last_name: 'Smith',
  email: 'jane@example.com',
  phone_number: '0987654321',
  password: 'password',
  password_confirmation: 'password'
)

# Create some hostels
hostel1 = Hostel.create!(
  hostel_name: 'Green Acres Hostel',
  landlord: landlord1,
  location: 'Downtown',
  price_per_month: 300.0,
  hostel_type: 'Shared',
  toilet: true,
  kitchen: true,
  wifi: true,
  study_room: false,
  balcony: true,
  gym: false,
  wardrobe: true,
  laundry_services: true,
  avaliable_units: 5,
  parking: true,
  room_type: 'Single',
  hot_shower: true,
  garden: false,
  swimming_pool: false,
  air_conditioner: true,
  cctv_cameras: true,
  fire_extinguishers: true,
  first_aid_kits: true,
  smoke_alarm: true,
  description: 'A nice and affordable hostel in downtown.'
)

hostel2 = Hostel.create!(
  hostel_name: 'Blue Sky Apartments',
  landlord: landlord2,
  location: 'Suburbs',
  price_per_month: 450.0,
  hostel_type: 'Private',
  toilet: true,
  kitchen: true,
  wifi: true,
  study_room: true,
  balcony: false,
  gym: true,
  wardrobe: true,
  laundry_services: true,
  avaliable_units: 2,
  parking: false,
  room_type: 'Double',
  hot_shower: true,
  garden: true,
  swimming_pool: false,
  air_conditioner: true,
  cctv_cameras: false,
  fire_extinguishers: true,
  first_aid_kits: false,
  smoke_alarm: true,
  description: 'Comfortable private apartments with modern amenities.'
)

# Create some students
student1 = Student.create!(
  first_name: 'Alice',
  last_name: 'Johnson',
  email: 'alice@student.com',
  phone_number: '1112223333',
  password: 'password',
  password_confirmation: 'password'
)

student2 = Student.create!(
  first_name: 'Bob',
  last_name: 'Williams',
  email: 'bob@student.com',
  phone_number: '4445556666',
  password: 'password',
  password_confirmation: 'password'
)

# Create some bookings
Booking.create!(
  student: student1,
  hostel: hostel1,
  start_date: '2024-10-01',
  end_date: '2025-06-01',
  status: 'Confirmed'
)

Booking.create!(
  student: student2,
  hostel: hostel2,
  start_date: '2024-09-15',
  end_date: '2025-05-15',
  status: 'Confirmed'
)

# Create some reviews
Review.create!(
  hostel: hostel1,
  student: student1,
  comments: 'A great place to stay! Highly recommended.',
  likes: 10
)

Review.create!(
  hostel: hostel2,
  student: student2,
  comments: 'Nice location, but a bit expensive for what you get.',
  likes: 5
)

puts "Seed data loaded successfully!"
