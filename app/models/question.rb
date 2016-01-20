class Question < ActiveRecord::Base
    has_many :answers
    has_many :likes
    belongs_to :article
    belongs_to :user
    #def file=(filedata_field)
    #    transaction do
    #    if filedata_field.size>0 then
    #        @file_size=filedata_field.size
    #        @file_type=filedata_field.content_type.chomp
    #        self.obligate1=@file_type
    #    end
    #    end
    #end
end
