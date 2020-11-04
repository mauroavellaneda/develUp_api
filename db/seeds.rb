Assignment.destroy_all
client = User.create(email: "client@mail.com", password: "password", password_confirmation: "password", company_name: "Develup", company_url: "http://develup.com", role: "client")

Assignment.create(
  title: "Build a Web page",
  skills: ["Ruby", "JavaScript"],
  points: 320,
  budget: 500,
  description: "I need to design a cool website with some Animation graphics and video. The New company is a PPE manufacturer and distributor. We will sell direct to the public.",
  client_id: client.id,
  timeframe: 25,
)
