# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
books = [
    {
        title:"Lord of the rings", 
        genre:"Action and Adventure",
        description: "In ancient times the Rings of Power were crafted by the Elven-smiths, and Sauron, the Dark Lord, forged the One Ring, filling it with his own power so that he could rule all others. But the One Ring was taken from him, and though he sought it throughout Middle-earth, it remained lost to him. After many ages it fell by chance into the hands of the hobbit Bilbo Baggins.",
        isbn: "9780261102309",
        publish_date: DateTime.parse("19/09/1991")
    },
    {
        title:"To kill a mockingbird", 
        genre:"Drama",
        description: "The unforgettable novel of a childhood in a sleepy Southern town and the crisis of conscience that rocked it. To Kill A Mockingbird became both an instant bestseller and a critical success when it was first published in 1960. It went on to win the Pulitzer Prize in 1961 and was later made into an Academy Award-winning film, also a classic.",
        isbn: "9780060933272",
        publish_date: DateTime.parse("29/06/2005")
    },
    {
        title:"Jane Eyre", 
        genre:"Romance",
        description: "Having grown up an orphan in the home of her cruel aunt and at a harsh charity school, Jane Eyre becomes an independent and spirited survivor-qualities that serve her well as governess at Thornfield Hall. But when she finds love with her sardonic employer, Rochester, the discovery of his terrible secret forces her to make a choice. Should she stay with him whatever the consequences or follow her convictions, even if it means leaving her beloved?",
        isbn: "9780141441146",
        publish_date: DateTime.parse("15/08/2006")
    },
    {
        title:"Murder on the Orient Express", 
        genre:"Mystery",
        description: "Just after midnight, the famous Orient Express is stopped in its tracks by a snowdrift. By morning, the millionaire Samuel Edward Ratchett lies dead in his compartment, stabbed a dozen times, his door locked from the inside. Without a shred of doubt, one of his fellow passengers is the murderer.",
        isbn: "9780062693662",
        publish_date: DateTime.parse("10/11/2017")
    },
    {
        title:"IT", 
        genre:"Horror",
        description: "To the children, the town was their whole world. To the adults, knowing better, Derry Maine was just their home town: familiar, well-ordered for the most part. A good place to live. It was the children who saw - and felt - what made Derry so horribly different. In the storm drains, in the sewers, IT lurked, taking on the shape of every nightmare, each one's deepest dread. Sometimes IT reached up, seizing, tearing, killing ...",
        isbn: "9781444707861",
        publish_date: DateTime.parse("01/05/2011")
    }]

books.each do |book|
 Book.create!(book)
end      

