puts "🌱 Seeding spices..."

User.create(name: "Eyal")
User.create(name: "Anne")
User.create(name: "Adam")
User.create(name: "Keren")

Task.create(
    {name: "Mow Lawn",
    description: "Mow front and back lawns, trim hedges",
    category_id: 1,
    user_id: rand(1..4),
    deadline: Date.new(2023,12,31),
    priority: ["High", "Medium", "Low"].sample}
)

Task.create(
    {name: "Make Dinner",
    description: "Thaw chicken, chop veggies, make stew",
    category_id: 1,
    user_id: rand(1..4),
    deadline: Date.new(2023,12,31),
    priority: ["High", "Medium", "Low"].sample}
)

Task.create(
    {name: "Get groceries",
    description: "Buy produce, snacks, and supplies",
    category_id: 3,
    user_id: rand(1..4),
    deadline: Date.new(2023,12,31),
    priority: ["High", "Medium", "Low"].sample}
)

Task.create(
    {name: "Pick up drycleaning",
    description: "Cleaners on 72th Ave",
    category_id: 3,
    user_id: rand(1..4),
    deadline: Date.new(2023,12,31),
    priority: ["High", "Medium", "Low"].sample}
)

Task.create(
    {name: "Feed cats",
    description: nil,
    category_id: 1,
    user_id: rand(1..3),
    deadline: Date.new(2023,12,31),
    priority: ["High", "Medium", "Low"].sample}
)

Task.create(
    {name: "TPS Reports",
    description: "Finish TPS reports, send to Bill",
    category_id: 2,
    user_id: rand(1..4),
    deadline: Date.new(2023,12,31),
    priority: ["High", "Medium", "Low"].sample}
)

Task.create(
    {name: "Staff Meeting",
    description: nil,
    category_id: 2,
    user_id: rand(1..4),
    deadline: Date.new(2023,12,31),
    priority: ["High", "Medium", "Low"].sample}
)


Category.create(
  name: "Home"
)

Category.create(
  name: "Work"
)

Category.create(
  name: "Personal"
)


puts "✅ Done seeding!"
