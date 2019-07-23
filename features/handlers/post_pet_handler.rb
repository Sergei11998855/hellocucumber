class PostPet

  def self.request_with_id_and_name(pet_id, pet_name)
    request = {
        'id': pet_id,
        'category': self.id_name,
        'name': pet_name,
        'photoUrls': [
            'string'
        ],
        'tags': [
            self.id_name
        ],
        'status': 'available'
    }
    request.to_json
  end

  def self.id_name(id = 1, name = 'test_name')
    {
        'id': id,
        'name': name
    }
  end

end
