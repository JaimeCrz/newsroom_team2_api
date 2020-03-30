articles = Article.create(article_class: "free", title: "Free Article", teaser: "The world is running out of hope.",
     content: "People are bulking tons of toilet paper that's an issue for everyone" )

articles = Article.create(article_class: "premium", title: "Premium Article 1", teaser: "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit.",
    content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
    Nunc molestie ante sit amet tempor viverra. In lectus eros, 
    vehicula non lobortis ut, porttitor sit amet metus. Vestibulum a faucibus sem. 
    In vestibulum suscipit faucibus. Fusce congue metus et neque ullamcorper, 
    quis volutpat massa pulvinar. Mauris facilisis tellus purus, 
    vitae commodo eros pulvinar egestas. Cras a sagittis diam, et facilisis libero. 
    Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; 
    Sed laoreet consectetur ex eget gravida." )

articles = Article.create(article_class: "premium", title: "Premium Article 2", teaser: "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit.",
    content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
    Nunc molestie ante sit amet tempor viverra. In lectus eros, 
    vehicula non lobortis ut, porttitor sit amet metus. Vestibulum a faucibus sem. 
    In vestibulum suscipit faucibus. Fusce congue metus et neque ullamcorper, 
    quis volutpat massa pulvinar. Mauris facilisis tellus purus, 
    vitae commodo eros pulvinar egestas. Cras a sagittis diam, et facilisis libero. 
    Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; 
    Sed laoreet consectetur ex eget gravida." )

users = User.create(role: 'journalist', email:'journalist@mail.com', password:'password', password_confirmation:'password')
