# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
virtues = Virtue.create([{name: "Temperance"}, {name: "Silence"}, {name: "Order"}, {name: "Resolution"},
  {name: "Frugality"}, {name: "Sincerity"}, {name: "Justice"}, {name: "Moderation"},
  {name: "Cleanliness"}, {name: "Tranquillity"}, {name: "Chastity"}, {name: "Humility"}])

user = User.create(email: "nathanhood@me.com", password: "foobar11")

commitments = Commitment.create([{description:"Eat not to dullness; drink not to elevation.", user_id: user.id, virtue_id: virtues[0].id},
  {description:"Speak not but what may benefit others or yourself; avoid trifling conversation.", user_id: user.id, virtue_id: virtues[1].id},
  {description:"Let all your things have their places; let each part of your business have its time.", user_id: user.id, virtue_id: virtues[2].id},
  {description:"Resolve to perform what you ought; perform without fail what you resolve.", user_id: user.id, virtue_id: virtues[3].id},
  {description:"Make no expense but to do good to others or yourself; i.e., waste nothing.", user_id: user.id, virtue_id: virtues[4].id},
  {description:"Lose no time; be always employ'd in something useful; cut off all unnecessary actions.", user_id: user.id, virtue_id: virtues[5].id},
  {description:"Use no hurtful deceit; think innocently and justly, and, if you speak, speak accordingly.", user_id: user.id, virtue_id: virtues[6].id},
  {description:"Wrong none by doing injuries, or omitting the benefits that are your duty.", user_id: user.id, virtue_id: virtues[7].id}])

daily_reports = DailyReport.create([{user_id: user.id, created_at: 10.days.ago,
  entry: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum malesuada varius eros,
  nec venenatis tellus tincidunt vel. Phasellus venenatis consequat justo, ut consequat tortor. Phasellus accumsan ligula lorem,
  sed posuere tortor egestas eu. Proin quis tellus purus. Nullam id arcu nec metus blandit fringilla. Cras id libero condimentum,
  volutpat sem ac, tincidunt orci. Aliquam egestas nisl enim, sit amet ultricies lacus porttitor in. Vivamus porta metus at suscipit convallis.
  Vestibulum accumsan metus dolor, sed posuere sem vehicula at. Proin nisi felis, interdum nec varius et, ornare non nunc. Suspendisse potenti."},
  {user_id: user.id, created_at: 9.days.ago,
    entry: "Deep v quinoa crucifix, single-origin coffee dreamcatcher umami mixtape trust fund Intelligentsia. Echo Park Tumblr photo booth,
    small batch ethical Helvetica mustache art party gluten-free vinyl retro shabby chic blog tousled Marfa. Try-hard hoodie before they sold out
    chillwave fap mustache Schlitz Banksy. Kogi pork belly narwhal aesthetic. Messenger bag craft beer mumblecore, pop-up sartorial vegan stumptown put
     a bird on it umami letterpress Etsy whatever Tonx gentrify. Pour-over heirloom kitsch, stumptown artisan Kickstarter VHS flannel chillwave XOXO
     seitan fap. Gentrify try-hard selfies forage YOLO, art party retro +1 semiotics pork belly typewriter."},
  {user_id: user.id, created_at: 8.days.ago,
    entry: "Deep v quinoa crucifix, single-origin coffee dreamcatcher umami mixtape trust fund Intelligentsia. Echo Park Tumblr photo booth,
    small batch ethical Helvetica mustache art party gluten-free vinyl retro shabby chic blog tousled Marfa. Try-hard hoodie before they sold out
    chillwave fap mustache Schlitz Banksy. Kogi pork belly narwhal aesthetic. Messenger bag craft beer mumblecore, pop-up sartorial vegan stumptown put
     a bird on it umami letterpress Etsy whatever Tonx gentrify. Pour-over heirloom kitsch, stumptown artisan Kickstarter VHS flannel chillwave XOXO
     seitan fap. Gentrify try-hard selfies forage YOLO, art party retro +1 semiotics pork belly typewriter."},
  {user_id: user.id, created_at: 7.days.ago,
    entry: "Deep v quinoa crucifix, single-origin coffee dreamcatcher umami mixtape trust fund Intelligentsia. Echo Park Tumblr photo booth,
    small batch ethical Helvetica mustache art party gluten-free vinyl retro shabby chic blog tousled Marfa. Try-hard hoodie before they sold out
    chillwave fap mustache Schlitz Banksy. Kogi pork belly narwhal aesthetic. Messenger bag craft beer mumblecore, pop-up sartorial vegan stumptown put
     a bird on it umami letterpress Etsy whatever Tonx gentrify. Pour-over heirloom kitsch, stumptown artisan Kickstarter VHS flannel chillwave XOXO
     seitan fap. Gentrify try-hard selfies forage YOLO, art party retro +1 semiotics pork belly typewriter."},
  {user_id: user.id, created_at: 6.days.ago,
    entry: "Deep v quinoa crucifix, single-origin coffee dreamcatcher umami mixtape trust fund Intelligentsia. Echo Park Tumblr photo booth,
    small batch ethical Helvetica mustache art party gluten-free vinyl retro shabby chic blog tousled Marfa. Try-hard hoodie before they sold out
    chillwave fap mustache Schlitz Banksy. Kogi pork belly narwhal aesthetic. Messenger bag craft beer mumblecore, pop-up sartorial vegan stumptown put
     a bird on it umami letterpress Etsy whatever Tonx gentrify. Pour-over heirloom kitsch, stumptown artisan Kickstarter VHS flannel chillwave XOXO
     seitan fap. Gentrify try-hard selfies forage YOLO, art party retro +1 semiotics pork belly typewriter."},
  {user_id: user.id, created_at: 5.days.ago,
    entry: "Deep v quinoa crucifix, single-origin coffee dreamcatcher umami mixtape trust fund Intelligentsia. Echo Park Tumblr photo booth,
    small batch ethical Helvetica mustache art party gluten-free vinyl retro shabby chic blog tousled Marfa. Try-hard hoodie before they sold out
    chillwave fap mustache Schlitz Banksy. Kogi pork belly narwhal aesthetic. Messenger bag craft beer mumblecore, pop-up sartorial vegan stumptown put
     a bird on it umami letterpress Etsy whatever Tonx gentrify. Pour-over heirloom kitsch, stumptown artisan Kickstarter VHS flannel chillwave XOXO
     seitan fap. Gentrify try-hard selfies forage YOLO, art party retro +1 semiotics pork belly typewriter."},
  {user_id: user.id, created_at: 4.days.ago,
    entry: "Deep v quinoa crucifix, single-origin coffee dreamcatcher umami mixtape trust fund Intelligentsia. Echo Park Tumblr photo booth,
    small batch ethical Helvetica mustache art party gluten-free vinyl retro shabby chic blog tousled Marfa. Try-hard hoodie before they sold out
    chillwave fap mustache Schlitz Banksy. Kogi pork belly narwhal aesthetic. Messenger bag craft beer mumblecore, pop-up sartorial vegan stumptown put
     a bird on it umami letterpress Etsy whatever Tonx gentrify. Pour-over heirloom kitsch, stumptown artisan Kickstarter VHS flannel chillwave XOXO
     seitan fap. Gentrify try-hard selfies forage YOLO, art party retro +1 semiotics pork belly typewriter."},
  {user_id: user.id, created_at: 3.days.ago,
    entry: "Deep v quinoa crucifix, single-origin coffee dreamcatcher umami mixtape trust fund Intelligentsia. Echo Park Tumblr photo booth,
    small batch ethical Helvetica mustache art party gluten-free vinyl retro shabby chic blog tousled Marfa. Try-hard hoodie before they sold out
    chillwave fap mustache Schlitz Banksy. Kogi pork belly narwhal aesthetic. Messenger bag craft beer mumblecore, pop-up sartorial vegan stumptown put
     a bird on it umami letterpress Etsy whatever Tonx gentrify. Pour-over heirloom kitsch, stumptown artisan Kickstarter VHS flannel chillwave XOXO
     seitan fap. Gentrify try-hard selfies forage YOLO, art party retro +1 semiotics pork belly typewriter."},
  {user_id: user.id, created_at: 2.days.ago,
    entry: "Deep v quinoa crucifix, single-origin coffee dreamcatcher umami mixtape trust fund Intelligentsia. Echo Park Tumblr photo booth,
    small batch ethical Helvetica mustache art party gluten-free vinyl retro shabby chic blog tousled Marfa. Try-hard hoodie before they sold out
    chillwave fap mustache Schlitz Banksy. Kogi pork belly narwhal aesthetic. Messenger bag craft beer mumblecore, pop-up sartorial vegan stumptown put
     a bird on it umami letterpress Etsy whatever Tonx gentrify. Pour-over heirloom kitsch, stumptown artisan Kickstarter VHS flannel chillwave XOXO
     seitan fap. Gentrify try-hard selfies forage YOLO, art party retro +1 semiotics pork belly typewriter."},
  {user_id: user.id, created_at: 1.days.ago,
    entry: "Deep v quinoa crucifix, single-origin coffee dreamcatcher umami mixtape trust fund Intelligentsia. Echo Park Tumblr photo booth,
    small batch ethical Helvetica mustache art party gluten-free vinyl retro shabby chic blog tousled Marfa. Try-hard hoodie before they sold out
    chillwave fap mustache Schlitz Banksy. Kogi pork belly narwhal aesthetic. Messenger bag craft beer mumblecore, pop-up sartorial vegan stumptown put
     a bird on it umami letterpress Etsy whatever Tonx gentrify. Pour-over heirloom kitsch, stumptown artisan Kickstarter VHS flannel chillwave XOXO
     seitan fap. Gentrify try-hard selfies forage YOLO, art party retro +1 semiotics pork belly typewriter."}])

virtue_reports = VirtueReport.create([{virtue_id: virtues[0].id, daily_report_id: daily_reports[0].id, rating: 2}, {virtue_id: virtues[1].id, daily_report_id: daily_reports[0].id, rating: 3},
  {virtue_id: virtues[2].id, daily_report_id: daily_reports[0].id, rating: 1}, {virtue_id: virtues[3].id, daily_report_id: daily_reports[0].id, rating: 2},
  {virtue_id: virtues[4].id, daily_report_id: daily_reports[0].id, rating: 2}, {virtue_id: virtues[5].id, daily_report_id: daily_reports[0].id, rating: 4},
  {virtue_id: virtues[6].id, daily_report_id: daily_reports[0].id, rating: 3}, {virtue_id: virtues[7].id, daily_report_id: daily_reports[0].id, rating: 4},

  {virtue_id: virtues[0].id, daily_report_id: daily_reports[1].id, rating: 3}, {virtue_id: virtues[1].id, daily_report_id: daily_reports[1].id, rating: 2},
  {virtue_id: virtues[2].id, daily_report_id: daily_reports[1].id, rating: 2}, {virtue_id: virtues[3].id, daily_report_id: daily_reports[1].id, rating: 4},
  {virtue_id: virtues[4].id, daily_report_id: daily_reports[1].id, rating: 5}, {virtue_id: virtues[5].id, daily_report_id: daily_reports[1].id, rating: 4},
  {virtue_id: virtues[6].id, daily_report_id: daily_reports[1].id, rating: 4}, {virtue_id: virtues[7].id, daily_report_id: daily_reports[1].id, rating: 3},

  {virtue_id: virtues[0].id, daily_report_id: daily_reports[2].id, rating: 3}, {virtue_id: virtues[1].id, daily_report_id: daily_reports[2].id, rating: 1},
  {virtue_id: virtues[2].id, daily_report_id: daily_reports[2].id, rating: 3}, {virtue_id: virtues[3].id, daily_report_id: daily_reports[2].id, rating: 3},
  {virtue_id: virtues[4].id, daily_report_id: daily_reports[2].id, rating: 2}, {virtue_id: virtues[5].id, daily_report_id: daily_reports[2].id, rating: 5},
  {virtue_id: virtues[6].id, daily_report_id: daily_reports[2].id, rating: 3}, {virtue_id: virtues[7].id, daily_report_id: daily_reports[2].id, rating: 5},

  {virtue_id: virtues[0].id, daily_report_id: daily_reports[3].id, rating: 2}, {virtue_id: virtues[1].id, daily_report_id: daily_reports[3].id, rating: 3},
  {virtue_id: virtues[2].id, daily_report_id: daily_reports[3].id, rating: 1}, {virtue_id: virtues[3].id, daily_report_id: daily_reports[3].id, rating: 1},
  {virtue_id: virtues[4].id, daily_report_id: daily_reports[3].id, rating: 3}, {virtue_id: virtues[5].id, daily_report_id: daily_reports[3].id, rating: 5},
  {virtue_id: virtues[6].id, daily_report_id: daily_reports[3].id, rating: 4}, {virtue_id: virtues[7].id, daily_report_id: daily_reports[3].id, rating: 4},

  {virtue_id: virtues[0].id, daily_report_id: daily_reports[4].id, rating: 2}, {virtue_id: virtues[1].id, daily_report_id: daily_reports[4].id, rating: 3},
  {virtue_id: virtues[2].id, daily_report_id: daily_reports[4].id, rating: 4}, {virtue_id: virtues[3].id, daily_report_id: daily_reports[4].id, rating: 2},
  {virtue_id: virtues[4].id, daily_report_id: daily_reports[4].id, rating: 3}, {virtue_id: virtues[5].id, daily_report_id: daily_reports[4].id, rating: 4},
  {virtue_id: virtues[6].id, daily_report_id: daily_reports[4].id, rating: 5}, {virtue_id: virtues[7].id, daily_report_id: daily_reports[4].id, rating: 5},

  {virtue_id: virtues[0].id, daily_report_id: daily_reports[5].id, rating: 3}, {virtue_id: virtues[1].id, daily_report_id: daily_reports[5].id, rating: 2},
  {virtue_id: virtues[2].id, daily_report_id: daily_reports[5].id, rating: 4}, {virtue_id: virtues[3].id, daily_report_id: daily_reports[5].id, rating: 3},
  {virtue_id: virtues[4].id, daily_report_id: daily_reports[5].id, rating: 4}, {virtue_id: virtues[5].id, daily_report_id: daily_reports[5].id, rating: 2},
  {virtue_id: virtues[6].id, daily_report_id: daily_reports[5].id, rating: 5}, {virtue_id: virtues[7].id, daily_report_id: daily_reports[5].id, rating: 3},

  {virtue_id: virtues[0].id, daily_report_id: daily_reports[6].id, rating: 2}, {virtue_id: virtues[1].id, daily_report_id: daily_reports[6].id, rating: 2},
  {virtue_id: virtues[2].id, daily_report_id: daily_reports[6].id, rating: 2}, {virtue_id: virtues[3].id, daily_report_id: daily_reports[6].id, rating: 2},
  {virtue_id: virtues[4].id, daily_report_id: daily_reports[6].id, rating: 5}, {virtue_id: virtues[5].id, daily_report_id: daily_reports[6].id, rating: 4},
  {virtue_id: virtues[6].id, daily_report_id: daily_reports[6].id, rating: 4}, {virtue_id: virtues[7].id, daily_report_id: daily_reports[6].id, rating: 5},

  {virtue_id: virtues[0].id, daily_report_id: daily_reports[7].id, rating: 1}, {virtue_id: virtues[1].id, daily_report_id: daily_reports[7].id, rating: 3},
  {virtue_id: virtues[2].id, daily_report_id: daily_reports[7].id, rating: 2}, {virtue_id: virtues[3].id, daily_report_id: daily_reports[7].id, rating: 3},
  {virtue_id: virtues[4].id, daily_report_id: daily_reports[7].id, rating: 4}, {virtue_id: virtues[5].id, daily_report_id: daily_reports[7].id, rating: 5},
  {virtue_id: virtues[6].id, daily_report_id: daily_reports[7].id, rating: 5}, {virtue_id: virtues[7].id, daily_report_id: daily_reports[7].id, rating: 5}])
