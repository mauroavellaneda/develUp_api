Assignment.destroy_all
User.destroy_all
client = User.create(email: "client@mail.com", password: "password", company_url: "algos", company_name: "asfads", role: "client")
client1 = User.create(email: "client1@mail.com", password: "password", company_url: "algos", company_name: "asfads", role: "client")
client2 = User.create(email: "client2@mail.com", password: "password", company_url: "algos", company_name: "asfads", role: "client")
client3 = User.create(email: "client3@mail.com", password: "password", company_url: "algos", company_name: "asfads", role: "client")

develuper = User.create(name: "Johan", email: "develuper@mail.com", password: "password", level: 5, points: 430, completed_projects: 22, skills: ["Ruby", "Javascript"], role: "develuper")
develuper1 = User.create(name: "Jenny", email: "develuper1@mail.com", password: "password", level: 9, points: 43, completed_projects: 2, skills: ["React", "Ruby"], role: "develuper")

assignment2 = Assignment.create(
  title: "Build a Web page",
  skills: ["Ruby", "Javascript"],
  points: 320,
  budget: 500,
  description: "I need to design a cool website with some Animation graphics and video. The New company is a PPE manufacturer and distributor. We will sell direct to the public.",
  client_id: client2.id,
  timeframe: 25,
  status: "published",
)
assignment1 = Assignment.create(
  title: "Dedicated React Developer",
  skills: ["React", "HTML-CSS"],
  points: 40,
  budget: 250,
  description: "We are looking for talented React developer with 3 years of experience who can work for at least 6 months for the project. We will give the candidate the small test assignment (we will pay for the hours he spent for the test assignment), and consider who to work with.",
  client_id: client.id,
  timeframe: 70,
  status: "published",
)
assignment3 = Assignment.create(
  title: "Build an API",
  skills: ["Ruby", "Angular"],
  points: 670,
  budget: 1500,
  description: "I need to design a cool website with some Animation graphics and video. The New company is a PPE manufacturer and distributor. We will sell direct to the public.",
  client_id: client3.id,
  timeframe: 25,
  status: "published",
  applicants: [1230, 1231, 1232, 1233, 1234, 1235, 1236, 1237, 1238],
)
assignment4 = Assignment.create(
  title: "Build a Native App",
  skills: ["React Native", "Javascript"],
  points: 1320,
  budget: 2500,
  description: "I need to design a cool website with some Animation graphics and video. The New company is a PPE manufacturer and distributor. We will sell direct to the public.",
  client_id: client.id,
  timeframe: 25,
  status: "published",
  applicants: [1230, 1231, 1232, 1233, 1234, 1235, 1236, 1237, 1238],
)
assignment5 = Assignment.create(
  title: "Build a Home page",
  skills: ["HTML-CSS", "Javascript"],
  points: 220,
  budget: 300,
  description: "I need to design a cool website with some Animation graphics and video. The New company is a PPE manufacturer and distributor. We will sell direct to the public.",
  client_id: client1.id,
  timeframe: 25,
  status: "published",
  applicants: [1230, 1231, 1232, 1233, 1234, 1235, 1236, 1237, 1238],
)
assignment6 = Assignment.create(
  title: "Build a responsive Web page",
  skills: ["Ruby", "Javascript"],
  points: 320,
  budget: 500,
  description: "I need to design a cool website with some Animation graphics and video. The New company is a PPE manufacturer and distributor. We will sell direct to the public.",
  client_id: client2.id,
  timeframe: 25,
  status: "published",
  applicants: [1230, 1234, 1235, 1236, 1237, 1238],
)
assignment7 = Assignment.create(
  title: "Awesome React Developer",
  skills: ["React", "HTML-CSS"],
  points: 40,
  budget: 250,
  description: "We are looking for talented React developer with 3 years of experience who can work for at least 6 months for the project. We will give the candidate the small test assignment (we will pay for the hours he spent for the test assignment), and consider who to work with.",
  client_id: client1.id,
  timeframe: 70,
  status: "published",
  applicants: [1230, 1231, 1232, 1233, 1234, 1235, 1236],
)
assignment8 = Assignment.create(
  title: "Build an REST API",
  skills: ["Ruby", "Angular"],
  points: 670,
  budget: 1500,
  description: "I need to design a cool website with some Animation graphics and video. The New company is a PPE manufacturer and distributor. We will sell direct to the public.",
  client_id: client3.id,
  timeframe: 25,
  status: "published",
  applicants: [1230, 1231, 1232, 1233, 1234, 1235, 1236, 1237, 1238],
)
assignment9 = Assignment.create(
  title: "Build a Home page 2",
  skills: ["React Native", "Javascript"],
  points: 1320,
  budget: 2500,
  description: "I need to design a cool website with some Animation graphics and video. The New company is a PPE manufacturer and distributor. We will sell direct to the public.",
  client_id: client1.id,
  timeframe: 25,
  status: "published",
  applicants: [1230, 1231, 1232, 1233, 1234, 1235, 1236, 1237, 1238],
)
assignment10 = Assignment.create(
  title: "Build a Home page 3",
  skills: ["HTML-CSS", "Javascript"],
  points: 220,
  budget: 300,
  description: "I need to design a cool website with some Animation graphics and video. The New company is a PPE manufacturer and distributor. We will sell direct to the public.",
  client_id: client1.id,
  timeframe: 25,
  status: "published",
)
assignmen11 = Assignment.create(
  title: "Build a Web page 4",
  skills: ["Ruby", "Javascript"],
  points: 320,
  budget: 500,
  description: "I need to design a cool website with some Animation graphics and video. The New company is a PPE manufacturer and distributor. We will sell direct to the public.",
  client_id: client2.id,
  timeframe: 25,
  status: "published",
)
assignment12 = Assignment.create(
  title: "Dedicated React Developer 5",
  skills: ["React", "HTML-CSS"],
  points: 40,
  budget: 250,
  description: "We are looking for talented React developer with 3 years of experience who can work for at least 6 months for the project. We will give the candidate the small test assignment (we will pay for the hours he spent for the test assignment), and consider who to work with.",
  client_id: client1.id,
  timeframe: 70,
  status: "published",
)
assignment13 = Assignment.create(
  title: "Build an API 6",
  skills: ["Ruby", "Angular"],
  points: 670,
  budget: 1500,
  description: "I need to design a cool website with some Animation graphics and video. The New company is a PPE manufacturer and distributor. We will sell direct to the public.",
  client_id: client3.id,
  timeframe: 25,
  status: "published",
)
assignment14 = Assignment.create(
  title: "Build a Native App",
  skills: ["React Native", "Javascript 7"],
  points: 1320,
  budget: 2500,
  description: "I need to design a cool website with some Animation graphics and video. The New company is a PPE manufacturer and distributor. We will sell direct to the public.",
  client_id: client1.id,
  timeframe: 25,
  status: "published",
)
assignment15 = Assignment.create(
  title: "Build a Full Stack Rails application",
  skills: ["Ruby"],
  points: 220,
  budget: 300,
  description: "I need to design a cool website with some Animation graphics and video. The New company is a PPE manufacturer and distributor. We will sell direct to the public.",
  client_id: client.id,
  timeframe: 25,
  status: "published",
  applicants: [1230, 1231, 1236, 1237, 1238],
)
