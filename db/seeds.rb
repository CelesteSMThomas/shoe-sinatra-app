User.destroy_all
Shoe.destroy_all
#here is where I will write the seed data for my program

celeste = User.create(name: "Celeste", email: "celeste@celeste.com", image_url: "https://picsum.photos/id/237/200/300", bio: "sneaker gawd", password: "password")
brandon = User.create(name: "Brandon",email: "brandon@brandon.com", image_url: "https://picsum.photos/id/238/200/300", bio: "sneaker game sick, someone call a doctor.", password: "pw")

Shoe.create(title: "Air Jordan 'Flu Game' 12", image_url: "https://cdn.flightclub.com/2600/TEMPLATE/012394/1.jpg", description: "The Air Jordan 12 “Flu Game” is a black and red version of Michael Jordan's twelfth signature shoe. MJ wore these during Game 5 of the 1997 NBA Finals while having flu-like symptoms. Despite his condition, he was able to lead the Chicago Bulls to victory over the Utah Jazz.", user_id: celeste.id)

Shoe.create(title: "Adidas Stan Smith", image_url: "https://cdn.shopify.com/s/files/1/1356/7869/files/adidas-stan-smith.jpg?52987", description: "The Stan Smith is one of the most popular sneakers that adidas has ever made. However, it has quite an interesting backstory. Named after the American tennis legend, Stan Smith, this sleek and simple design was originally designed for the French tennis star, Robert Haillet. Haillet wore the shoe through the 1960s until he retired in 1971.", user_id: celeste.id)

Shoe.create(title: "Jordan 1 Retro Chicago (2015)", image_url: "https://stockx-360.imgix.net//Air-Jordan-1-Retro-Chicago-2015_TruView/Images/Air-Jordan-1-Retro-Chicago-2015_TruView/Lv2/img01.jpg?auto=format,compress&q=90&updated_at=1559089616&w=1000", description: "The Air Jordan 1 was Michael Jordan's first shoe.", user_id: brandon.id)



 