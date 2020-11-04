Assignment.destroy_all
User.destroy_all
client = User.create(email: "client@mail.com", password: "password", company_url: "algos", company_name: "asfads", role: "client")
client2 = User.create(email: "client2@mail.com", password: "password", company_url: "algos", company_name: "asfads", role: "client")
client3 = User.create(email: "client3@mail.com", password: "password", company_url: "algos", company_name: "asfads", role: "client")
assignment2 = Assignment.create(
  title: "Build a Web page",
  skills: ["Ruby", "Javascript"],
  points: 320,
  budget: 500,
  description: "I need to design a cool website with some Animation graphics and video. The New company is a PPE manufacturer and distributor. We will sell direct to the public.",
  client_id: client2.id,
  timeframe: 25,
)
assignment1 = Assignment.create(
  title: "Dedicated React Developer",
  skills: ["React", "HTML-CSS"],
  points: 40,
  budget: 250,
  description: "We are looking for talented React developer with 3 years of experience who can work for at least 6 months for the project. We will give the candidate the small test assignment (we will pay for the hours he spent for the test assignment), and consider who to work with.",
  client_id: client.id,
  timeframe: 70,
)
assignment3 = Assignment.create(
  title: "Build an API",
  skills: ["Ruby", "Angular"],
  points: 670,
  budget: 1500,
  description: "I need to design a cool website with some Animation graphics and video. The New company is a PPE manufacturer and distributor. We will sell direct to the public.",
  client_id: client3.id,
  timeframe: 25,
)
assignment4 = Assignment.create(
  title: "Build a Native App",
  skills: ["React Native", "Javascript"],
  points: 1320,
  budget: 2500,
  description: "I need to design a cool website with some Animation graphics and video. The New company is a PPE manufacturer and distributor. We will sell direct to the public.",
  client_id: client.id,
  timeframe: 25,
)
assignment5 = Assignment.create(
  title: "Build a Home page",
  skills: ["HTML-CSS", "Javascript"],
  points: 220,
  budget: 300,
  description: "I need to design a cool website with some Animation graphics and video. The New company is a PPE manufacturer and distributor. We will sell direct to the public.",
  client_id: client.id,
  timeframe: 25,
)
