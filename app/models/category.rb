class Category < ActiveHash::Base  
    self.data = [
    {id: 1, name: 'Overdrive'}, {id: 2, name: 'Distortion'}, {id: 3, name: 'Preamp'},
    {id: 4, name: 'Reverb'}, {id: 5, name: 'Chorus'}, {id: 6, name: 'Delay'}, {id: 7, name: 'その他'}
    ]
end
