dogs = [
    {
        name: 'Felix',
        age: 2,
        enjoys: 'Long naps on the couch, and a warm fire',
        image: 'https://images.unsplash.com/photo-1561037404-61cd46aa615b?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
    },
    {
        name: 'Homer',
        age: 12,
        enjoys: 'Food mostly, really just food.',
        image: 'https://images.unsplash.com/photo-1587518102280-8d5fdcb68d13?q=80&w=2952&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
    },
    {
        name: 'Jack',
        age: 5,
        enjoys: 'Furrrrociously hunting bugs.',
        image: 'https://images.unsplash.com/photo-1517849845537-4d257902454a?q=80&w=2835&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
    }
]

dogs.each do |each_dog|
    Dog.create each_dog
    puts "creating dog #{each_dog}"
end