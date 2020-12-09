package entitieslayer.base

class EntityBase {

    var id: UUID? = ""

    var _id: Int? = ""

    var insertedDbDate: Date? = ""

    init{
        id = UUID.randomUUID()
    }

}