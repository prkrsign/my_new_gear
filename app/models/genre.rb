class Genre < ActiveHash::Base  
    self.data = [
    {id: 1, name: 'Jpop'}, {id: 2, name: 'Jazz'}, {id: 3, name: 'Rock'},
    {id: 4, name: 'Blues'}, {id: 5, name: 'HR/HM'}
    ]
end
